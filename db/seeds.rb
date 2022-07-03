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

provinces = Province.create([
    {province_name: "Aceh"}, {province_name: "Lampung"}, {province_name: "Bali"},{province_name: "Bangka-Belitung"},{province_name: "Bangka-Belitung"},
    {province_name: "Banten"}, {province_name: "Bengkulu"}, {province_name: "Gorontalo"},{province_name: "DKI Jakarta"},{province_name: "Jambi"},
    {province_name: "Jawa Barat"}, {province_name: "Jawa Tengah"}, {province_name: "Jawa Timur"},{province_name: "Sulawesi Selatan"},{province_name: "Sulawesi Utara"},
    {province_name: "Yogyakarta"}, {province_name: "Sumatera Utara"}, {province_name: "Sumatera Selatan"},{province_name: "Kalimantan Timur"},{province_name: "Kalimantan Selatan"}

])

cities = City.create([
    {city_name: "Jakarta", province_id: 10}, {city_name: "Depok", province_id: 12}, {city_name: "Bogor", province_id: 12}, {city_name: "Bekasi", province_id: 12},
    {city_name: "Bandung", province_id: 12}, {city_name: "Cimahi", province_id: 12},   {city_name: "Semarang", province_id: 13},{city_name: "Solo", province_id: 13},
    {city_name: "Makassar", province_id: 15}, {city_name: "Surabaya", province_id: 14}, {city_name: "Malang", province_id: 14}
])

restaurants = GarbageProducer.create([
    {producer_name: "Restaurant 77", producer_pass: "12halo", email_producer: "resto77@gmail.com", address: "JL Simatupang no 190", opening_time: "08:00", closing_time: "22:00", province_id: 10},
    {producer_name: "Rumah Makan Borobudur", producer_pass: "borobudur1234", email_producer: "boro77@gmail.com", address: "JL candi NO 5 A", opening_time: "08:00", closing_time: "22:00", province_id: 10},
    {producer_name: "Fried Chicken 90", producer_pass: "chicken90", email_producer: "chicken90@gmail.com", address: "JL pemotongan NO 5 A", opening_time: "09:00", closing_time: "21:00", province_id: 12}
])

conditions = Condition.create([
    {condition_type: "Not fit for consumption"},
    {condition_type: "Worth consuming food"}
])

foods = Food.create([
    {food_name: "Cap jay seafood (porsi)", food_quantity: 2, food_desc: "masih utuh belum berjamur, sayurnya masih cukup segar, belum berbau busuk, dan sedang disimpan di freezer", expiration_date: "06-07-2022", condition_id: 2, garbage_producer_id: 2},
    {food_name: "Sop saudara (porsi)", food_quantity: 4, food_desc: "masih utuh belum berjamur dan belum berbau busuk, sedang disimpan di freezer", expiration_date: "06-07-2022", condition_id: 2, garbage_producer_id: 2},
    {food_name: "Ayam kare (porsi)", food_quantity: 3, food_desc: "sudah lewat masa expired-nya", expiration_date: "02-07-2022", condition_id: 1, garbage_producer_id: 2},
    {food_name: "semur ayam (porsi)", food_quantity: 2, food_desc: "sudah lewat masa expired-nya", expiration_date: "02-07-2022", condition_id: 1, garbage_producer_id: 2},
    {food_name: "Sari Roti (bungkus)", food_quantity: 100, food_desc: "Masih utuh dan belum berjamur dan sedang disimpan di freezer", expiration_date: "10-07-2022", condition_id: 2, garbage_producer_id:1 }
])

