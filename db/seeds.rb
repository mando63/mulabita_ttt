# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
GamePlayer.create!(player_name: 'Mando', player_email: 'mymail@gmail.com', player_alias: 'Gooner')
Game.create!(game_desc: 'Mando vs The Computer')