# W2_Workshop

# Study Group Members
- Patrick Green-Holloway
- Hana Tilahun
- Kendra Tyler
- Myleah Richardson
- Oluwafemi Farinloye


# Requirements and Conceptual Model

 



## End User & Needs
**End User:** Event Organizer / Admin

 

**What the end user needs to do:**
- Create and manage events
- Register attendees
- Track attendance
- View event details and reports

 

---

 

## Data Categories

 

### Events
- Event ID
- Event Name
- Date
- Location
- Description

 

### Attendees
- Attendee ID
- First Name
- Last Name
- Email
- Phone Number

 

### Registrations
- Registration ID
- Event ID
- Attendee ID
- Registration Date
- Attendance Status

 

### Locations
- Location ID
- Venue Name
- Address
- City
- State

 

---

 

# Logical Model

 

## Entities (Tables)
- Events
- Attendees
- Registrations
- Locations

 

---

 

## Attributes by Entity

 

### Events
- event_id (Primary Key)
- event_name
- date
- location_id (Foreign Key)
- description

 

### Attendees
- attendee_id (Primary Key)
- first_name
- last_name
- email
- phone

 

### Registrations
- registration_id (Primary Key)
- event_id (Foreign Key)
- attendee_id (Foreign Key)
- registration_date
- attendance_status

 

### Locations
- location_id (Primary Key)
- venue_name
- address
- city
- state

 

---

 

## Relationships
- One Event → Many Registrations
- One Attendee → Many Registrations
- One Location → Many Events

 

---

 

## Many-to-Many Relationships
- Attendees and Events have a many-to-many relationship
- This is resolved using the **Registrations** table

 

---

 

## Group Discussion Notes

 

### Similarities
- Most diagrams included Events, Attendees, and Registrations
- Similar use of a joining table for many-to-many relationships

 

### Differences
- Some included Locations as a separate table, others kept it inside Events
- Attribute choices varied (some added phone/email, others didn’t)

 

### Pros and Cons

 

**Separate Location Table**
- More organized and reusable
- Slightly more complex

 

**Location inside Events**
- Simpler design
- Data duplication risk

 
a) Similarities

Most of our diagrams were very similar. Everyone included the main tables: Events, Attendees, and Registrations. We all understood that attendees can go to multiple events, so we used a Registrations table to connect them.

We also used similar attributes like IDs, names, and dates, and had the same basic relationships (one event → many registrations, one attendee → many registrations).

b) Differences

The biggest difference was how we handled locations.

Some people used a separate Locations table
Others put location info directly in Events

A separate table is more organized and avoids duplicate data, but it is more complex. Keeping it in Events is simpler, but can lead to repeated data.

Some diagrams also had more or fewer attributes depending on how detailed people wanted to be. More detail is useful but adds complexity.

Overall

We all had the same main idea, but made slightly different design choices based on simplicity vs. organization.
---
