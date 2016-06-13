# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Location.create(name: 'Mushroom Town', slug: 'main')
Location.create(name: 'Shop', slug: 'shop', parent_id: Location.find_by(slug: 'main').id)