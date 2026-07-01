INSERT INTO profile (id, name, tagline, location, email, phone, linkedin, github, summary) VALUES
(1, 'Suraj Dattatray Mali', 'Code, data, and a patent along the way.', 'Solapur, India',
 'surajmali1309@gmail.com', '+919960620919',
 'https://linkedin.com/in/suraj-mali09', 'https://github.com/surajmali09',
 'I''m Suraj Mali — a Computer Science Engineering graduate (2026) who builds ETL pipelines, ML models, and full-stack software. Core contributor to a patent-pending hologram calling platform.');

INSERT INTO experience (id, role, company, date_range, sort_order) VALUES
(1, 'Software Developer Intern', 'Swapsoft Sghitech Pvt. Ltd. — Pune', 'Apr 2026 – Jun 2026', 1),
(2, 'Data Science Intern', 'The Developers Arena — Remote', 'Aug 2025 – Nov 2025', 2);

INSERT INTO experience_points (experience_id, point) VALUES
(1, 'Developed and deployed 2–3 application features end-to-end; resolved roughly 10 bugs through root-cause debugging, measurably improving app reliability.'),
(1, 'Collaborated with cross-functional teams to design, test, and ship features following Agile/SDLC practices and Git version control.'),
(2, 'Built ML models on datasets of 1,000–5,000 rows, achieving 80–85% prediction accuracy.'),
(2, 'Executed end-to-end pipelines — data collection, cleaning, EDA, feature engineering, and predictive modeling with Python and Scikit-learn — delivering insights via Power BI dashboards to stakeholders.');

INSERT INTO projects (id, title, date_label, description, patent_note, sort_order) VALUES
(1, 'HOLOCall', 'Jan 2025',
 'A full-stack hologram video calling platform that transforms traditional calls into 3D holographic experiences. Sub-2-second stream initiation and 99%+ uptime during testing.',
 'Patent filed & published — grant in process', 1),
(2, 'Airline Management System', 'Jun 2025',
 'A complete airline operations system managing 500+ passenger and flight records — booking, scheduling, seat management, and a dynamic pricing engine.',
 NULL, 2),
(3, 'Traffic Sign Classification', 'Jun 2024',
 'A CNN-based classifier for autonomous vehicle navigation reaching 92%+ accuracy, with IoT sensor integration and sub-second detection on edge hardware.',
 NULL, 3);

INSERT INTO project_stack (project_id, tech) VALUES
(1, 'Vite.js'), (1, 'Node.js'), (1, 'REST API'), (1, 'Cloud'),
(2, 'Java'), (2, 'JDBC'), (2, 'MySQL'), (2, 'OOP'),
(3, 'Python'), (3, 'CNNs'), (3, 'OpenCV'), (3, 'IoT');

INSERT INTO skill_categories (id, name, sort_order) VALUES
(1, 'Languages', 1),
(2, 'Data & BI', 2),
(3, 'Data Engineering', 3),
(4, 'Databases & Cloud', 4),
(5, 'Frameworks & Tools', 5),
(6, 'Concepts', 6);

INSERT INTO skills (category_id, name) VALUES
(1, 'Python'), (1, 'SQL'), (1, 'Core Java'), (1, 'HTML'), (1, 'CSS'),
(2, 'Power BI'), (2, 'Tableau'), (2, 'Advanced Excel'),
(3, 'ETL/ELT'), (3, 'Data Warehousing'), (3, 'Star/Snowflake Schema'), (3, 'Databricks'), (3, 'Azure'),
(4, 'MySQL'), (4, 'MongoDB'), (4, 'SQL Server'), (4, 'AWS'), (4, 'NumPy'), (4, 'Pandas'),
(5, 'FastAPI'), (5, 'Node.js'), (5, 'Vite.js'), (5, 'Git'), (5, 'REST APIs'),
(6, 'OOP'), (6, 'SDLC'), (6, 'Agile'), (6, 'Machine Learning'), (6, 'Deep Learning'), (6, 'Computer Vision');

INSERT INTO achievements (icon_label, description, sort_order) VALUES
('13', '<b>13th position nationally</b> at HackFest''24, IIT (ISM) Dhanbad, in an IoT/Hardware competition.', 1),
('1st', '<b>1st place</b> at the Campus-to-Corporate Hackathon (Corporate Mela, NKOCET) for "Green-Trust," a farmer-to-customer direct commerce platform.', 2),
('◆', 'Filed a patent for <b>HOLOCall</b> on 5 Aug 2025, published 22 Aug 2025 — currently grant-in-process, a rare achievement among undergraduate students.', 3),
('★', 'Serves as <b>Event Coordinator</b>, Astronomy Club, NKOCET Solapur.', 4);

INSERT INTO certifications (title, issuer, year) VALUES
('Data Analyst Career Path', 'Microsoft Learn', '2024'),
('Data Visualization', 'TATA (Forage)', '2024'),
('Data Analytics Essentials', 'CISCO', '2024'),
('Intro to Cybersecurity', 'CISCO', '2025'),
('Web Development', 'Unstop Tech Fair', '2025');
