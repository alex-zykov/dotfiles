#!/usr/bin/env node

const { execSync } = require('child_process');
const { getRecentMeetings, getTopAllDayEvents } = require('./calendar');

const name = process.env.NAME;

try {
  const events = JSON.parse(execSync('icalpal eventsToday -o json'));
  const tasks = getTopAllDayEvents(events);
  if (tasks && tasks.hasEvents) {
    const title = tasks.events.map((event, index) => `${index+1}. ${event.title}`).join(' | ');
    execSync(`sketchybar --set ${name} display=1 label="${title}"`);
  } else {
    execSync(`sketchybar --set ${name} display=0 label=""`);
  }
} catch (error) {
  console.error(`Error: ${error.message}`);
}
