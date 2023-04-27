# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Metal.create_with(price_cents: 0_02).find_or_create_by!(name: "Steel")
Metal.create_with(price_cents: 0_01).find_or_create_by!(name: "Aluminum")
Metal.create_with(price_cents: 1_00).find_or_create_by!(name: "Gold")
