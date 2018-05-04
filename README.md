# Hamilton Central School - Parents Teachers Organization

## Project Description

HCS-PTO is a ruby web app developed by Colgate University students.

## Project Features

* Show all the Calendar activities in specified order
* Create a new event and store it in the database
* Create calendar database
* Filter calendar events using dates
* Create a Teacher, Staff, or Parent User Account with user submitted login credentials
* Delete a User Account
* Access links to resources and opportunities for HCS students
* Sign in to or Sign out of User Account
* Filter the email receiver list
* Be able to set an end date/time that is before the start date/time
* Sign up as a volunteer for an event from the page with the description of the event.
* Sign up to volunteer for an event from the page with the list of events
* Email all the volunteers of a particular event
* About page for PTO with members and bylaws
* Be able to see some current and upcoming events this week on the homepage
* See the list of volunteers for a given event

## Dependencies

This application uses:
Ruby 2.4.1
Rails 5.1.4

## Installation

* Clone the git repo at: https://github.com/ColgateCOSC480/HCS-PTO.git
* Run bundle install to install the gems
* Rub bundle exec figaro install to create config/application.yml
* Set GMAIL_USERNAME and GMAIL_PASSWORD environment variables in application.yml with username and app password 
* Run rails db:migrate to set up database
* Run rails db:seed to seed admin account
* Run rails db:test:prepare to prepare the test database

## Contributors

* Lumi Halitjaha
* Asad Jamil
* Priya Dhawka
* Yesu Carter
* Nam Nguyen
* Tyrell Roberts
