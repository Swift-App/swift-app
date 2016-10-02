# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.create({title: 'Babysit', description: 'Babysit a 5 yr old', pay_amount: 5000, job_type: 'Babysit', content: 'Babysit a 5 years old boy really good', location: 'tokyo', nearest_station: 'tokyo', number_of_positions: 1, work_date: DateTime.now + 3.days, hours: 5, holidays: 'Saturday', certifications_and_experience: "post-graduate degree", benefits: 'many', employment_type: 'hiring', person_in_charge: 'House owner', remarks: 'great job', branch_in_charge: 'tokyo branch', pay_range: '5000-10000', area: 'tokyo', shift_category: 'day', duration: '5 hours',category: 'home' })
