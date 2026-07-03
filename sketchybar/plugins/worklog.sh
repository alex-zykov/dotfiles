#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Configuration
const TIME_LOG_FILE = path.join(process.env.HOME, '.work_time_log.json');
const IDLE_THRESHOLD = 300000; // 5 minutes in milliseconds - if script hasn't run for this long, consider it idle time
const name = process.env.NAME || 'work_time'; // Default to 'work_time' if NAME not set

// Initialize or load time tracking data
function loadTimeData() {
  try {
    if (fs.existsSync(TIME_LOG_FILE)) {
      const data = JSON.parse(fs.readFileSync(TIME_LOG_FILE, 'utf8'));
      // If it's a new day, reset the data
      const today = new Date().toISOString().split('T')[0];
      if (data.date !== today) {
        return {
          date: today,
          totalMilliseconds: 0,
          lastRunTimestamp: null,
          sessionStart: null
        };
      }
      return data;
    }
  } catch (error) {
    console.error(`Error loading time data: ${error.message}`);
  }
  
  // Default new data
  return {
    date: new Date().toISOString().split('T')[0],
    totalMilliseconds: 0,
    lastRunTimestamp: null,
    sessionStart: null
  };
}

// Save time tracking data
function saveTimeData(data) {
  try {
    fs.writeFileSync(TIME_LOG_FILE, JSON.stringify(data, null, 2));
  } catch (error) {
    console.error(`Error saving time data: ${error.message}`);
  }
}

// Main function
try {
  const timeData = loadTimeData();
  const now = new Date();
  const currentTimestamp = now.getTime();
  
  // If this is the first run of the day or ever
  if (!timeData.lastRunTimestamp) {
    timeData.lastRunTimestamp = currentTimestamp;
    timeData.sessionStart = now.toLocaleTimeString();
  } else {
    // Calculate time since last run in milliseconds
    const timeSinceLastRun = currentTimestamp - timeData.lastRunTimestamp;
    
    // If the gap is less than idle threshold, user is considered active
    if (timeSinceLastRun < IDLE_THRESHOLD) {
      // Add the time since last run to total
      timeData.totalMilliseconds += timeSinceLastRun;
    } else {
      // User was idle, start a new session
      timeData.sessionStart = now.toLocaleTimeString();
    }
    
    // Update last run timestamp
    timeData.lastRunTimestamp = currentTimestamp;
  }
  
  // Save updated data
  saveTimeData(timeData);
  
  // Format time for display
  const totalSeconds = Math.floor(timeData.totalMilliseconds / 1000);
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const timeLabel = `${hours}h ${minutes}m`;
  
  // Create display label with session start time
  const displayLabel = `${timeLabel} (since ${timeData.sessionStart})`;
  
  // Update sketchybar - set display=1 to show the item
  execSync(`sketchybar --set ${name} display=1 label="${displayLabel}"`);
  
} catch (error) {
  console.error(`Error: ${error.message}`);
  // In case of error, hide the item
  try {
    execSync(`sketchybar --set ${name} display=0 label=""`);
  } catch (e) {
    // Ignore errors when hiding
  }
}
