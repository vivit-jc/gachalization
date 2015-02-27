# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


alpha = User.create(email: "alpha@example.com", password: "alpha...")
gamma = User.create(email: "gamma@example.com", password: "gamma...")
delta = User.create(email: "delta@example.com", password: "delta...")

alpha_player = alpha.create_player(name: "alpha")
alpha_player.init
gamma_player = gamma.create_player(name: "gamma")
gamma_player.init
delta_player = delta.create_player(name: "delta")
delta_player.init
