# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

games = YAML.load_file(Rails.root.join('db/seeds/games.yml'))
games.each { |attrs| Game::Create.run(game: attrs) unless Game.where(title_ja: attrs[:title_ja]).present? }
