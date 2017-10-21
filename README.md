# Meetup Client

## Quick Start

```ruby
# Initialize the client...
meetup = MeetupClient.new(access_token: "<OAUTH2_USER_ACCESS_TOKEN>")

# Get all RSVP events for the authenticated user...
meetup.events

# Get all groups that the authenticated user belongs to...
meetup.groups
```

## Parameters

Check the API docs for details about the parameters that can be passed.

```ruby
# Get all waitlist events for the authenticated user...
meetup.events(rsvp: 'waitlist')
```

## Supported Endpoints

### v3 events

* /self/events

### v3 groups

* /self/groups
