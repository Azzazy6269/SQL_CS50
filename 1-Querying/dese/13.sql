WITH Averages AS (
 SELECT AVG(expenditures.per_pupil_expenditure) AS avg_expenditure, AVG(teacher_ratings.percent_exemplary) AS avg_percent_exemplary
 FROM expenditures
 INNER JOIN teacher_ratings ON expenditures.district_id = teacher_ratings.district_id
)
SELECT districts.name AS district_name, expenditures.per_pupil_expenditure, teacher_ratings.percent_exemplary
FROM  districts
INNER JOIN  expenditures ON districts.id = expenditures.district_id
INNER JOIN  teacher_ratings ON districts.id = teacher_ratings.district_id
WHERE  expenditures.per_pupil_expenditure > (SELECT avg_expenditure FROM Averages)
AND teacher_ratings.percent_exemplary > (SELECT avg_percent_exemplary FROM Averages)
ORDER BY teacher_ratings.percent_exemplary DESC, expenditures.per_pupil_expenditure DESC;
