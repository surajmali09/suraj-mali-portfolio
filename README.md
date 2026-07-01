# Suraj Mali — Portfolio (Flask + SQLite)

## What this is
The same portfolio site, rebuilt with a Python backend:
- **Flask** serves the pages and renders the HTML via Jinja templates.
- **SQLite** stores all the content (experience, projects, skills, achievements, certifications) — populated and read with raw **SQL** queries (see `schema.sql`, `seed.sql`, and the query functions in `app.py`).
-Clicking your email address opens your default email app directly via a mailto: link, addressed to surajmali1309@gmail.com. Clicking the phone number opens the dialer via tel:.

## Project structure
```
portfolio_flask/
├── app.py              # Flask app + SQL queries
├── schema.sql           # Database table definitions
├── seed.sql             # Your resume content as SQL INSERT statements
├── requirements.txt
├── templates/
│   └── index.html       # Jinja template
└── static/
    ├── css/style.css
    └── js/script.js
```

## Run it locally

Then open **(https://suraj-mali-portfolio.onrender.com/)** in your browser.

The first run automatically creates `portfolio.db` from `schema.sql` + `seed.sql`. To reset the data, just delete `portfolio.db` and restart.

## Editing your content
You don't need to touch the HTML to update your info — edit `seed.sql`, delete `portfolio.db`, and restart the app. For example, to add a new project, add a row to the `projects` table insert and matching rows to `project_stack`.

## Deploying it live
Any host that runs Python works: **Render**, **Railway**, or **PythonAnywhere** are the easiest free options for a small Flask app like this. Push this folder to GitHub, connect the repo to one of those services, and set the start command to `python app.py` (or use `gunicorn app:app` for production).
