DROP INDEX IF EXISTS "search_courses_by_title_first";
DROP INDEX IF EXISTS "search_courses_by_semester_first";
DROP INDEX IF EXISTS "search_enrollment_by_course_id_fisrt";
DROP INDEX IF EXISTS "search_enrollment_by_student_id_first";
DROP INDEX IF EXISTS "search_courses_by_department_AND_semester";
DROP INDEX IF EXISTS "search_satisfies_by_course_id";


CREATE INDEX "search_courses_by_title" ON "courses"("title","semester");
CREATE INDEX "search_courses_by_semester" ON "courses"("semester","title");
CREATE INDEX "search_enrollment_by_course_id_fisrt" ON "enrollments"("course_id","student_id");
CREATE INDEX "search_enrollment_by_student_id_first" ON "enrollments"("student_id","course_id");
CREATE INDEX "search_courses_by_department_AND_semester" ON "courses"("department","semester","number","id");
CREATE INDEX "search_satisfies_by_course_id" ON "satisfies"("course_id","requirment_id");

--check your queries with "EXPLAIN QUERY PLAN" to know what indexes do you need / don't let any scan
