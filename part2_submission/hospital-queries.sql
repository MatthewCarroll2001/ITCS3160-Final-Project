USE hospital;

/*
*	THIS SQL FILE IS NOT REQUIRED FOR THE ASSIGNMENT,
*	BUT I AM INCLUDING IT SO THAT THE DATA CAN BE VISUALIZED
*/

-- Shows all physicians and nurses
select * from physician;
select * from nurse;

-- Shows all patients and their health records
select * from patient;
select p.patient_name, disease, record_date, record_status, descr from health_record hr 
join patient p on p.patient_id = hr.patient_id;

-- Shows who medicates what patient with what medication
select nurse_name, patient_name, medication_name, quantity, med_date from medicates med
join nurse n on n.nurse_id = med.nurse_id
join patient p on p.patient_id = med.patient_id
join medication m on m.medication_id = med.medication_id;

-- Shows all rooms and who's hospitalized in them as well as instructions which will be payable
select r.room_number, p.patient_name from room r 
join hospitalized h on h.room_number = r.room_number
join patient p on p.patient_id = h.patient_id;

-- Shows what physician monitors what patient and for how long
select physician_name, patient_name, duration from monitors m
join physician ph on ph.physician_id = m.physician_id
join patient p on p.patient_id = m.patient_id;

-- All orders for instructions
select instruction_code, physician_name, patient_name from orders o
join physician ph on ph.physician_id = o.physician_id
join patient p on p.patient_id = o.patient_id
order by instruction_code;

-- All executions on instructions
select instruction_code, nurse_name, patient_name from executes e
join nurse n on n.nurse_id = e.nurse_id
join patient p on p.patient_id = e.patient_id
order by instruction_code;

-- Invoices for all patients with name and amount included
select p.patient_id, p.patient_name, i.total_cost, i.invoice_id from invoice i
join patient p on p.patient_id = i.patient_id
order by patient_id;

-- Payments made by patients on invoices
select p.patient_name, i.invoice_id, pay.payment_id, pay.amount, pay.date_paid from payment pay
join invoice i on i.invoice_id = pay.invoice_id
join patient p on p.patient_id = i.patient_id;
