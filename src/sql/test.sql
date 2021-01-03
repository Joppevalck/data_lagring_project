SELECT r.rental_id, ri.name, r.rental_date, r.return_date
FROM rental AS r
NATURAL LEFT OUTER JOIN rental_instrument AS ri
WHERE r.student_id = 2 
AND r.terminated = false;