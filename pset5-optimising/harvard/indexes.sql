-- Course title and number
CREATE INDEX "course_index" ON courses ("title", "number");

-- Student name
CREATE INDEX "student_index" ON students ("name");

-- Requirement name
CREATE INDEX "requirements_index" on requirements ("name")
