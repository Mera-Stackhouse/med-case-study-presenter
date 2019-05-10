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
cas2 = Case.create(title: "Leukemia", body: "A 47-year-old woman presents to the emergency department complaining of fatigue and shortness of breath. She reports a two-week history of worsening exercise tolerance and a rather abrupt onset of shortness of breath over the past several hours. The patient has no major past medical history and works as an architect. Prior to this illness, she exercised three to four times weekly. Her breathing appears somewhat labored. Physical examination is notable for tachycardia, tachypnea, an erythematous rash on her chest and back, and scattered ecchymosis on the extremities. Her laboratory results reveal the following:

Count	Value	Reference Range
White blood cells	174.1 × 109/L	4 x 109/L – 10 × 109/L
Hemoglobin	7.3 g/dL	14 – 18 g/dL
Platelet count	24 × 109/L	150 × 109/L – 450 × 109/L
White blood cell (WBC) differential is notable for 89 percent blasts. Peripheral blood smear shows a vast majority of cells are large blasts with occasional cytoplasmic granules and pseudopodia. Bone marrow aspiration and biopsy is performed, revealing a hypercellular marrow involved with monocytic-appearing blasts comprising 80 percent of bone marrow cellularity. Cytogenetics reveal t(6;11)(q27;q23) present in 19 out of 20 metaphase cells. Molecular studies show wild-type CEPBA and NPM1 genes and a FLT3-ITD mutation (FMS-like tyrosine kinase 3, internal tandem duplication) is present. She is admitted to the hospital to initiate induction chemotherapy for acute myeloid leukemia (AML).")
cas3 = Case.create(title: "Heart failure", body: "Mr. Solomon is a 63-year old gentle man who has been under your care for a variety of medical problems during the past 5 years. He has been treated for two myocardial infarctions, hypertension, non-insulin dependent diabetes and stasis dermatitis of the left leg. He had an aorto-coronary bypass one year ago.

Today he presents in the office with shortness of breath which has been progressive over the past five days. He has, however, experienced episodes of shortness of breath during the past four months, especially when exerting himself. He fatigues easily and has lost 'all my energy to do anything.' He also complains of anorexia. Last night he awoke suddenly from sleep because 'I couldn’t catch my breath' and developed a dry cough. The breathing problem improved when he sat on the edge of his bed for an hour. He generally sleeps with two, sometimes three pillows. He has not experienced chest pain, leg pain or fainting spells.


Examination in the office reveals an undernourished man who appears depressed and older than his stated age. He is unkept and unshaven. His shoes are untied. His breathing is labored and his lips have a blue tinge.

Vital Signs: Blood Pressure 98/82mmHg in the right arm; Heart Rate 110/min; Respiratory Rate 26/min; Temperature 98�F. Examination of the lungs reveals dullness to percussion in both bases with decreased excursion of the diaphragms. Course rhonchi and moist, inspiratory crackles are heard bilaterally in the lower lung fields.

Examination of the cardiovascular system: Neck veins are prominent and distended to the mandible when the patient is sitting upright. The apical pulse is palpated in the 5ICS, left of the MCL. S3 is palpable at the apex. S1 and S2 are diminished. S3 is heard at the apex. A grade 3/6 holosytolic murmur is heard best at the apex; it radiated to the left axilla.

Examination of the abdomen: The anterior wall is round and soft. The liver edge is palpable and tender. The spleen is not palpable. Examination of the extremities revealed diminished peripheral pulses. There is an irregular pulse. There is pitting edema of both lower extremities.

The patient is hospitalized.")
cas4 = Case.create(title: "Sepsis", body: "A 77-year-old man is admitted to the intensive care unit (ICU) of a university hospital from the operating room. Earlier the same day, he had presented to the emergency department with abdominal pain. His medical history included treated hypertension and hypercholesterolemia, previous heavy alcohol intake, and mild cognitive impairment. In the emergency department, he was drowsy and confused when roused and was peripherally cold with cyanosis. The systemic arterial blood pressure was 75/50 mm Hg, and the heart rate was 125 beats per minute. The abdomen was tense and distended. After the administration of 1 liter of intravenous crystalloid to restore the blood pressure, a computed tomographic scan of the abdomen showed extraluminal gas and suspected extraluminal feces consistent with a perforated sigmoid colon. He was treated with intravenous antibiotics and taken to the operating room for laparotomy. During this procedure, gross fecal peritonitis from a perforated sigmoid colon was confirmed; resection of the sigmoid colon with closure of the rectal stump and creation of an end colostomy (Hartmann’s procedure) was performed with extensive peritoneal toilet and washout.

On arrival in the ICU, he is still anesthetized, the trachea is intubated, and the lungs are mechanically ventilated with a fraction of inspired oxygen of 0.4; the arterial blood pressure is supported with a norepinephrine infusion. When the patient was in the operating room, he received a total of 4 liters of crystalloid. On his arrival in the ICU, the vital signs are a blood pressure of 88/52 mm Hg, heart rate of 120 beats per minute in sinus rhythm, central venous pressure of 6 mm Hg, and temperature of 35.6°C. An analysis of arterial blood shows a pH of 7.32, a partial pressure of carbon dioxide of 28 mm Hg, a partial pressure of oxygen of 85 mm Hg, and a lactate level of 3.0 mmol per liter.")
cas5 = Case.create(title: "Anemia", body: "A 39-year-old woman was referred to our institution for evaluation of anemia. She was known to have multiple comorbidities and had a baseline hemoglobin concentration of approximately 10.5 g/dL. About 6 months before her referral, the patient began having recurrent episodes of severe anemia, with hemoglobin values as low as 3.5 g/dL. She had become transfusion-dependent and had received about 30 units of packed red blood cells (RBCs) in the preceding 3 months. The patient denied any history of easy bruisability, menorrhagia, or overt evidence of bleeding from any site. Additionally, she denied any change in the appearance or color of her urine and had no history of jaundice. There was no family history of anemia or any other hematologic disorder. As an outpatient, she had undergone an extensive evaluation at another institution, but results failed to provide an explanation for her anemia.

The patient's medical history was remarkable for severe asthma, thought to be due to Churg-Strauss syndrome. She had a tunneled central venous catheter for self-administration of intravenous corticosteroids at the earliest sign of an asthmatic exacerbation. Her other medications included bronchodilators, weekly erythropoietin injections, intravenous iron therapy, an antidepressant, and an anxiolytic.

At presentation, the patient's vital signs were normal. Physical examination was unremarkable except for mild generalized pallor. A complete blood count on the day of admission revealed the following (reference ranges shown parenthetically): hemoglobin, 4.9 g/dL (12.0-15.5 g/dL); mean corpuscular volume (MCV), 94.4 fL (81.6-98.3 fL); hematocrit, 13.4% (34.9%-44.5%); leukocyte count, 6.0 × 109/L (3.5-10.5 × 109/L); and platelet count, 203 × 109/L (150-450 × 109/L). The patient's partial thromboplastin time and prothrombin time (PT)/international normalized ratio were normal. These results were obtained within 24 hours of her last transfusion.")

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
