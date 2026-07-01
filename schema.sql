DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS experience;
DROP TABLE IF EXISTS experience_points;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS project_stack;
DROP TABLE IF EXISTS skill_categories;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS achievements;
DROP TABLE IF EXISTS certifications;

CREATE TABLE profile (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    tagline TEXT,
    location TEXT,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    linkedin TEXT,
    github TEXT,
    summary TEXT
);

CREATE TABLE experience (
    id INTEGER PRIMARY KEY,
    role TEXT NOT NULL,
    company TEXT NOT NULL,
    date_range TEXT NOT NULL,
    sort_order INTEGER NOT NULL
);

CREATE TABLE experience_points (
    id INTEGER PRIMARY KEY,
    experience_id INTEGER NOT NULL,
    point TEXT NOT NULL,
    FOREIGN KEY (experience_id) REFERENCES experience(id)
);

CREATE TABLE projects (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    date_label TEXT,
    description TEXT NOT NULL,
    patent_note TEXT,
    sort_order INTEGER NOT NULL
);

CREATE TABLE project_stack (
    id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    tech TEXT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE skill_categories (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    sort_order INTEGER NOT NULL
);

CREATE TABLE skills (
    id INTEGER PRIMARY KEY,
    category_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES skill_categories(id)
);

CREATE TABLE achievements (
    id INTEGER PRIMARY KEY,
    icon_label TEXT NOT NULL,
    description TEXT NOT NULL,
    sort_order INTEGER NOT NULL
);

CREATE TABLE certifications (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    issuer TEXT NOT NULL,
    year TEXT NOT NULL
);
