"""
Suraj Mali — Portfolio Website
Flask backend + SQLite database (built with raw SQL queries).

Run:
    pip install -r requirements.txt
    python app.py
Then open http://127.0.0.1:5000
"""

import sqlite3
import os
from flask import Flask, render_template, g

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, "portfolio.db")
SCHEMA_PATH = os.path.join(BASE_DIR, "schema.sql")
SEED_PATH = os.path.join(BASE_DIR, "seed.sql")

app = Flask(__name__)


# ---------------------------------------------------------------------------
# Database helpers
# ---------------------------------------------------------------------------
def get_db():
    """Open a new database connection if one doesn't exist for this request."""
    if "db" not in g:
        g.db = sqlite3.connect(DB_PATH)
        g.db.row_factory = sqlite3.Row
    return g.db


@app.teardown_appcontext
def close_db(exception=None):
    db = g.pop("db", None)
    if db is not None:
        db.close()


def init_db():
    """Create tables from schema.sql and populate them from seed.sql."""
    conn = sqlite3.connect(DB_PATH)
    with open(SCHEMA_PATH, "r") as f:
        conn.executescript(f.read())
    with open(SEED_PATH, "r") as f:
        conn.executescript(f.read())
    conn.commit()
    conn.close()


# ---------------------------------------------------------------------------
# Data access layer — every read here is a plain SQL query
# ---------------------------------------------------------------------------
def get_profile(db):
    return db.execute("SELECT * FROM profile WHERE id = 1").fetchone()


def get_experience(db):
    rows = db.execute(
        "SELECT * FROM experience ORDER BY sort_order ASC"
    ).fetchall()
    experience = []
    for row in rows:
        points = db.execute(
            "SELECT point FROM experience_points WHERE experience_id = ?",
            (row["id"],),
        ).fetchall()
        experience.append(
            {
                "role": row["role"],
                "company": row["company"],
                "date_range": row["date_range"],
                "points": [p["point"] for p in points],
            }
        )
    return experience


def get_projects(db):
    rows = db.execute(
        "SELECT * FROM projects ORDER BY sort_order ASC"
    ).fetchall()
    projects = []
    for row in rows:
        stack = db.execute(
            "SELECT tech FROM project_stack WHERE project_id = ?",
            (row["id"],),
        ).fetchall()
        projects.append(
            {
                "title": row["title"],
                "date_label": row["date_label"],
                "description": row["description"],
                "patent_note": row["patent_note"],
                "stack": [s["tech"] for s in stack],
            }
        )
    return projects


def get_skills(db):
    categories = db.execute(
        "SELECT * FROM skill_categories ORDER BY sort_order ASC"
    ).fetchall()
    result = []
    for cat in categories:
        skills = db.execute(
            "SELECT name FROM skills WHERE category_id = ?", (cat["id"],)
        ).fetchall()
        result.append(
            {"name": cat["name"], "skills": [s["name"] for s in skills]}
        )
    return result


def get_achievements(db):
    rows = db.execute(
        "SELECT * FROM achievements ORDER BY sort_order ASC"
    ).fetchall()
    return [
        {"icon_label": r["icon_label"], "description": r["description"]}
        for r in rows
    ]


def get_certifications(db):
    rows = db.execute("SELECT * FROM certifications").fetchall()
    return [
        {"title": r["title"], "issuer": r["issuer"], "year": r["year"]}
        for r in rows
    ]


# ---------------------------------------------------------------------------
# Route
# ---------------------------------------------------------------------------
@app.route("/")
def index():
    db = get_db()
    return render_template(
        "index.html",
        profile=get_profile(db),
        experience=get_experience(db),
        projects=get_projects(db),
        skills=get_skills(db),
        achievements=get_achievements(db),
        certifications=get_certifications(db),
    )


if __name__ == "__main__":
    if not os.path.exists(DB_PATH):
        init_db()
        print("Database initialized from schema.sql + seed.sql")
    app.run(debug=True)
