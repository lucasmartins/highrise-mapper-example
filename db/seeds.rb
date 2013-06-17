# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
company = Company.create({name: 'Rails na Praia', highrise_base_url: 'https://railsnapraia.highrisehq.com', highrise_token: 'a11386d68bdd94fe549b8498afafce56'})
person = Person.create(
  { company: company,
    name: 'Pessoa',
    last_name: 'Teste',
    email:'pessoa@gmail.com',
    company_name: 'Google Inc',
    job_title: 'Tester',
    phone: '+1 12312134423',
    website: 'https://google.com'})
