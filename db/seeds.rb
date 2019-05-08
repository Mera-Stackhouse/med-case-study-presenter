# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Case.destroy_all
Category.destroy_all
# CasesCategory.destroy_all

cas1 = Case.create(title: "Pulmonary embolism", body: "blah")
cas2 = Case.create(title: "Leukemia", body: "blah")
cas3 = Case.create(title: "Heart failure", body: "blah")
cas4 = Case.create(title: "Sepsis", body: "blah")

cat1 = Category.create(tag: "Heart disease")
cat2 = Category.create(tag: "Cancer")
cat3 = Category.create(tag: "Inflammatory")

CasesCategory.create(case: cas1, category: cat1)
CasesCategory.create(case: cas1, category: cat3)
CasesCategory.create(case: cas2, category: cat2)
CasesCategory.create(case: cas2, category: cat3)
CasesCategory.create(case: cas3, category: cat1)
