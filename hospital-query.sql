USE hospital;

/*
*	QUERIES AND DESCRIPTIONS
*/

-- 1. Shows all physicians whose fields end with "ology"
select physician_name, field_of_expertise from physician
where field_of_expertise like "%ology";

-- 2. Shows all patients who were given morphine
select patient_name as  patients_given_morphine
from patient p
join medicates m on m.patient_id = p.patient_id
join medication med on med.medication_id = m.medication_id
where medication_name = 'Morphine';

-- 3. Shows all patients given over 200 mg/ml of medication
select patient_name, medication_name, quantity from medicates m
join patient p on p.patient_id = m.patient_id
join medication med on med.medication_id = m.medication_id
where quantity > 200;

-- 4. Show all total prices for invoices with the names of the patients associated 
select patient_name, invoice_id, total_cost from invoice i
join patient p on p.patient_id = i.patient_id;

-- 5. Find all instructions with more than one nurse executing it
select i.instruction_code from executes e
join instruction i on i.instruction_code = e.instruction_code
join nurse n on n.nurse_id = e.nurse_id
group by i.instruction_code
having count(*) > 1;

-- 6. Select all room numbers that have hospitalized more than one person
select room_number, count(patient_id) as number_of_patients
from hospitalized
group by room_number
having count(patient_id) > 1;

-- 7. Show the average cost for all invoices
select avg(total_cost) as avg_invoice_cost from invoice;

-- 8. Lists all patients not medicated by Nurse Simone Biles
select patient_name, n.nurse_name from medicates m
join patient p on p.patient_id = m.patient_id
join nurse n on n.nurse_id = m.nurse_id
where n.nurse_id not in
	(select nurse_id from nurse where nurse_name = "Nurse Simone Biles");
    
-- 9. Select all rooms that have not hospitalized a patient given morphine
select distinct room_number as room_without_morphine_patient from room
where room_number not in
	(select room_number from hospitalized h
    join patient p on p.patient_id = h.patient_id
	join medicates m on m.patient_id = p.patient_id
	join medication med on med.medication_id = m.medication_id
	where medication_name = 'Morphine');
    
-- 10. Find all patients who have not made any payments
select patient_name as patients_without_payments
from patient
where patient_id not in
	(select patient_id from invoice i
    join payment pay on pay.invoice_id = i.invoice_id);

-- 11. Shows all medication names that are smaller than 10 characters
select medication_name as small_medication_names from medication
where length(medication_name) < 10;

-- 12. Shows all physicians and nurses who have a certification number over 8
select physician_name as worker_name, certification_number
from physician
where certification_number > 8
UNION
select nurse_name as worker_name, certification_number
from nurse
where certification_number > 8;

-- 13. Select all patient id's from patients hospitalized in or after 2013
select h.patient_id, record_date from hospitalized h
join health_record hr on hr.patient_id = h.patient_id
where year(record_date) >= 2013;

-- 14. Select the highest payment that each payer has made
select patient_name, max(amount) as max_payment from payment pay
join invoice i on i.invoice_id = pay.invoice_id
join patient p on p.patient_id = i.patient_id
group by patient_name;

-- 15. Display the number of inactive and active patients
select record_status, count(*) as number_of_patients
from health_record
group by record_status;
