# README

Medical Case Study SPA

ABOUT

This is a single page application for medical case studies. The layout of the page has a side bar at the left to choose a case, a display panel to view each case on the right, and a form at the bottom for creating new cases.

MODELS/SCHEMA

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

Features:
- Create, view, edit, and delete case studies
- Filter by category tags
- Search by keyword case body


DEPLOYMENT

This app is deployed to:
* Heroku
https://obscure-chamber-36685.herokuapp.com/

If you would like to use locally:
* Configuration
Uses Postgres Database

* Database creation
rails db:setup
rails db:migrate


* Database initialization
To have category tags you will need to either seed using
rails db:seed
or create the tags in console with
rails c
Category.create(tag: "<tag name here>")

* Local Server
To start the server run
rails s
and navigate to the port specified by the terminal

LICENSE

MIT License
Copyright (c) 2019 Mera Stackhouse

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
