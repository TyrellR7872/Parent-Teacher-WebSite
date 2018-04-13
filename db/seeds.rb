# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CalendarEvent.delete_all

calendar_event_1 = CalendarEvent.create(:title => "Color Run", :start_date_time => DateTime.new(2018,8,5), :end_date_time => DateTime.new(2018,9,5), :location => 'Hamilton NY', :description => "Colorful event for days", :is_sport => true, :is_musical => false, :is_meeting => false, :is_charity => true, :is_gathering => true, :is_optional => false, :for_teacher => true, :for_parent => true, :for_elementary_student => true, :for_highschool_student => true, :contact_person => "Elder Person", :is_approved => true)

calendar_event_2 = CalendarEvent.create(:title => "Movie Night", :start_date_time => DateTime.new(2018,4,5), :end_date_time => DateTime.new(2018,5,5), :location => 'Hamilton NY', :description => "Scary Movie Night", :is_sport => false, :is_musical => false, :is_meeting => false, :is_charity => false, :is_gathering => true, :is_optional => true, :for_teacher => false, :for_parent => true, :for_elementary_student => true, :for_highschool_student => true, :contact_person => "Younger Person", :is_approved => true)

calendar_event_3 = CalendarEvent.create(:title => "Fright Night", :start_date_time => DateTime.new(2018,6,1), :end_date_time => DateTime.new(2018,6,6), :location => 'Hamilton NY', :description => "Halloween Pregame", :is_sport => false, :is_musical => false, :is_meeting => false, :is_charity => false, :is_gathering => true, :is_optional => true, :for_teacher => false, :for_parent => true, :for_elementary_student => true, :for_highschool_student => true, :contact_person => "Scary Person", :is_approved => true)

calendar_event_4 = CalendarEvent.create(:title => "Fund-Raiser", :start_date_time => DateTime.new(2018,6,2), :end_date_time => DateTime.new(2018,6,2), :location => 'Hamilton NY', :description => "Rich People, give money", :is_sport => false, :is_musical => false, :is_meeting => false, :is_charity => true, :is_gathering => true, :is_optional => false, :for_teacher => true, :for_parent => true, :for_elementary_student => true, :for_highschool_student => true, :contact_person => "Poor Person", :is_approved => false)

calendar_event_5 = CalendarEvent.create!(title: "Chill night with the Beatles", start_date_time: DateTime.new(2018,6,1), end_date_time: DateTime.new(2018,6,6), location: 'Hamilton NY', description: "Yesterday, all my troubles seem so far away", is_sport: false, is_musical: true, is_meeting: false, is_charity: false, is_gathering: true, is_optional: true, for_teacher: false, for_parent: true, for_elementary_student: true, for_highschool_student: true, contact_person: "Yoko Ono", is_approved: true)

calendar_event_6 = CalendarEvent.create!(title: "Learn about Python with Monty Python", start_date_time: DateTime.new(2018,4,1), end_date_time: DateTime.new(2018,4,6), location: 'Colgate University,Hamilton NY', description: "Python is a modern programming language, also the object of comic relief", is_sport: false, is_musical: false, is_meeting: false, is_charity: false, is_gathering: true, is_optional: true, for_teacher: false, for_parent: true, for_elementary_student: true, for_highschool_student: true, contact_person: "Monty Python", is_approved: true)

calendar_event_7 = CalendarEvent.create!(title: "Food-eating contest", start_date_time: DateTime.new(2018,5,1), end_date_time: DateTime.new(2018,5,4), location: 'Pizza Place,Hamilton NY', description: "Cooked, uncooked, food is meant to be eaten", is_sport: false, is_musical: false, is_meeting: false, is_charity: false, is_gathering: true, is_optional: true, for_teacher: true, for_parent: true, for_elementary_student: true, for_highschool_student: true, contact_person: "Dominoes", is_approved: true)

UserAccount.delete_all

user_account_1 = UserAccount.create!(username: "TestUser", password: "testpass1", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Bad Child", childgrade: 10, homeaddress: "Drake Hall")
user_account_2 = UserAccount.create!(username: "TestUser", password: "testpass2", email: "testuser@test2.com", accounttype: "Teacher", name: "Tester Name", childname: "Good Child", childgrade: 5, homeaddress: "123 Test Street")
