# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Resource.create(name: 'Cat pic', media_type: 'jpg', description: 'picture of a cat')
Resource.create(name: 'Falafel guy', media_type: 'jpg', description: 'picture of the Falafel guy')
Resource.create(name: 'Calendar', media_type: 'pdf', description: 'pdf of the calendar')

Tag.create(name: 'food', description: 'items that are edible')
Tag.create(name: 'pets', description: 'items that are pets')
Tag.create(name: 'digital', description: 'items that are digital')

ResourceTag.create(resource_id: 1, tag_id: 2)
ResourceTag.create(resource_id: 2, tag_id: 1)
ResourceTag.create(resource_id: 3, tag_id: 3)
