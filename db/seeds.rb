# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

volunteer1 = Volunteer.create(org_name: "Garda Pangan",
    org_email: "sampahmakanan@gmail.com",
    org_phone: "0812132289",
    org_address: "JL Pemotongan NO 999",
    org_pass: "1234halo")

volunteer2 = Volunteer.create(org_name: "Peduli Sampah",
    org_email: "carisampah@gmail.com",
    org_phone: "081283342",
    org_address: "JL Pahlawan NO 9090",
    org_pass: "1234pass")