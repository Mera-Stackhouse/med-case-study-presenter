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

cas1 = Case.create(title: "Pulmonary embolism", body: "On November 15, 2017, a 25-year-old man complaining of chest pain and with evidence of significant chest trauma presented to the emergency department at Ochsner Baton Rouge Medical Center in Louisiana. Earlier that day he had suffered an accident while riding an all-terrain vehicle. Chest x-rays showed no signs of fracture, but an abnormality of his left clavicle was observed.

Further investigation with computed tomography angiography (CTA) detected a sternoclavicular dislocation — the clavicular head was disarticulated and posteriorly displaced. The dislocation was significant enough to compress the brachiocephalic vein. In addition, a small hematoma was noted in the superior anterior mediastinum. There was no sign of active hemorrhage or arterial injury, but there was evidence of a vascular-type injury, which was assumed to be venous.

An orthopedic surgeon was consulted, and because the patient was stable, the decision was made that his dislocation would be reduced under anesthesia the following morning, with a cardiothoracic surgeon present. Prior to the procedure, the patient was intubated and anesthetized. When the dislocation was reduced, a large blood clot proximal to the brachiocephalic vein compression that had not previously been noted was dislodged and traveled to the patient’s heart and lungs. The patient experienced cardiac arrest and a code blue was activated. The patient’s systolic blood pressure dropped to <50 mm Hg and a vasopressor was administered.

At the time of the code blue, I was performing a procedure in the hospital’s catheter laboratory. I was called to consult on this patient, so I ordered a stat CTA, which revealed a massive saddle PE, a life-threatening condition in which the embolus is so large that it straddles the bifurcation of the pulmonary trunk, extending into the left and right pulmonary arteries. The patient also had a significantly elevated right ventricle/left ventricle ratio of 1:3. Thrombolysis was clearly indicated, but first the cardiothoracic surgeon and I discussed whether tissue plasminogen activator (tPA) was contraindicated in this patient; the presence of a hematoma implied that bleeding was already occurring and might be increased by the administration of tPA. However, we agreed that the need for directed therapy outweighed that risk.")
cas2 = Case.create(title: "Leukemia", body: "blah")
cas3 = Case.create(title: "Heart failure", body: "blah")
cas4 = Case.create(title: "Sepsis", body: "blah")
cas5 = Case.create(title: "Anemia", body: "Anemia is a condition that develops when your blood lacks enough healthy red blood cells or hemoglobin. Hemoglobin is a main part of red blood cells and binds oxygen. If you have too few or abnormal red blood cells, or your hemoglobin is abnormal or low, the cells in your body will not get enough oxygen. Symptoms of anemia -- like fatigue -- occur because organs aren't getting what they need to function properly.")

cat1 = Category.create(tag: "Heart disease")
cat2 = Category.create(tag: "Oncology")
cat3 = Category.create(tag: "Inflammatory")
cat4 = Category.create(tag: "Bacterial")
cat5 = Category.create(tag: "Parasite")
cat6 = Category.create(tag: "Internal Medicine")

CasesCategory.create(case: cas1, category: cat1)
CasesCategory.create(case: cas1, category: cat3)
CasesCategory.create(case: cas2, category: cat2)
CasesCategory.create(case: cas2, category: cat3)
CasesCategory.create(case: cas3, category: cat1)
CasesCategory.create(case: cas4, category: cat4)
CasesCategory.create(case: cas5, category: cat3)
