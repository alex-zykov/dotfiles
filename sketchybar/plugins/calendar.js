const iCalTime = (t) => {
  return((t.valueOf() +  978307200) * 1000);
}

const getRecentMeetings = (events) => {
  const nonAllDayEvents = events.filter(event => event.all_day === 0);

  if (nonAllDayEvents.length === 0) {
    return {
      event: false
    };
  }

  const now = Date.now();

  const currentMeeting = nonAllDayEvents.find(event =>
      iCalTime(event.start_date) <= now && iCalTime(event.end_date) > now
  );

  const upcomingMeeting = nonAllDayEvents.find(event =>
      iCalTime(event.start_date) > now
  );

  const formatMeeting = (meeting, start) => {
    if (!meeting) return null;
    let eventDate = new Date(iCalTime(meeting.start_date));
    if (!start) {
      eventDate = new Date(iCalTime(meeting.end_date));
    }
    const timeString = eventDate.toLocaleTimeString('en-US', {
      hour: '2-digit',
      minute: '2-digit',
      hour12: false,
      timeZone: Intl.DateTimeFormat().resolvedOptions().timeZone
    });
    return {
      title: `${timeString} ${meeting.title}`,
      color: meeting.color || '#000000' // default color if none provided
    };
  };

  return {
    event: !!(currentMeeting || upcomingMeeting),
    current: currentMeeting ? formatMeeting(currentMeeting, false) : null,
    upcoming: upcomingMeeting ? formatMeeting(upcomingMeeting, true) : null
  };
};

const getTopAllDayEvents = (events) => {
  const allDayEvents = events
      .filter(event => event.all_day === 1)
      .sort((a, b) => a.start_date - b.start_date)
      .slice(0, 3)
      .map(event => ({
        title: event.title.length > 20 ?
            event.title.substring(0, 20) + '...' :
            event.title,
        color: event.color || '#000000' // default color if none provided
      }));

  return {
    hasEvents: allDayEvents.length > 0,
    events: allDayEvents
  };
};

module.exports = { getRecentMeetings, getTopAllDayEvents };
