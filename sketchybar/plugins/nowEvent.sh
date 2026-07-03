#!/usr/bin/env node

const { execSync } = require('child_process');
const { getRecentMeetings, getTopAllDayEvents } = require('./calendar');

const name = process.env.NAME;

try {
  const events = JSON.parse(execSync('icalpal eventsToday -o json'));
  const meetings = getRecentMeetings(events);
  if (meetings && meetings.current) {
    execSync(`sketchybar --set ${name} display=1 label="${meetings.current.title}"`);
    execSync(`sketchybar --set delimiter_${name} display=1`);
  } else {
    execSync(`sketchybar --set ${name} display=0 label=""`);
    execSync(`sketchybar --set delimiter_${name} display=0`);
  }
} catch (error) {
  console.error(`Error: ${error.message}`);
}
