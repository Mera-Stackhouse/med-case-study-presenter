# README

Temp Read Me


Pitch Req’s:
Project Idea
MVP identified (CRUD)
Stretch goals identified
Rough idea/draft of schema


Medical Case Study SPA

Models/Schema

Case
Has many case-categories
Has many categories through case-categories

- Title
- Body


Case-category
Belongs to case
Belongs to category

- Case id
- Category id


Category
Has many case-categories
Has many cases through case-categories

- Tag


SPA View

R: Left side bar shows case titles
- When each title is clicked the full title, categories, and body elements will appear on the right side of page
- E: edit Botton next to title on right side of page
    - Hidden forms will appear next to title and body elements
- D: delete button next to edit button
    - Deletes it from the left side list // and clears the right side

C: Form along the bottom to create new cases
- Appears along the left side // and also shows up on the right side


Stretch Goals
- Filter by category tags
- Search by keyword in title or in body













This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
