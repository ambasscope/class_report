---------------------------------------------------------
-- Table creation
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    student_name TEXT NOT NULL,
    grade TEXT NOT NULL,
    room TEXT NOT NULL,
    student_no INTEGER NOT NULL,
    student_id TEXT GENERATED ALWAYS AS (
        grade || '-' || 
        printf('%02d', room) || '-' || 
        printf('%02d', student_no)
    ) STORED,
    UNIQUE (grade, room, student_no)
);

CREATE TABLE IF NOT EXISTS modules (
    id INTEGER PRIMARY KEY,
    module_name TEXT NOT NULL,
    module_code TEXT NOT NULL,
    UNIQUE (module_code)
);

CREATE TABLE IF NOT EXISTS classes (
    id INTEGER PRIMARY KEY,
    grade TEXT NOT NULL,
    room TEXT NOT NULL,
    UNIQUE (grade, room)
);

CREATE TABLE IF NOT EXISTS sessions (
    id INTEGER PRIMARY KEY,
    grade TEXT NOT NULL,
    room TEXT NOT NULL,
    module_code TEXT NOT NULL,
    plan_name TEXT NOT NULL,
    plan_number INTEGER NOT NULL,
    plan_date DATE NOT NULL,
    session_id TEXT GENERATED ALWAYS AS (
        grade || '-' || 
        printf('%02d', room) || '-' || 
        plan_date
    ) STORED,
    session_duration INTEGER NOT NULL,
    completed BOOLEAN NOT NULL,
    incompleted_reason TEXT,
    additional_notes TEXT,
    problem TEXT,
    comments TEXT
);

CREATE TABLE IF NOT EXISTS scoring_categories (
    id INTEGER PRIMARY KEY,
    category_id TEXT NOT NULL,
    category_name TEXT NOT NULL,
    subcategory_id TEXT NOT NULL,
    subcategory_name TEXT NOT NULL,
    max_score INTEGER NOT NULL,
    unique (subcategory_name)
);

CREATE TABLE IF NOT EXISTS scores (
    id INTEGER PRIMARY KEY,
    student_id TEXT NOT NULL,
    session_id TEXT NOT NULL,
    score INTEGER NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);



INSERT INTO students (student_name, grade, room, student_no) VALUES
('นายจีโซลุย -', '4', '1', '1'),
('นายณฐกร รอดเกษม', '4', '2', '1'),
('นายอภินันท์ แก้วกสิกรรม', '4', '1', '2'),
('นายนครินทร์ หัตถีกูล', '6', '1', '1');

SELECT * FROM students;

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS modules;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS sessions;
-- ALTER TABLE student RENAME COLUMN name TO student_name;

