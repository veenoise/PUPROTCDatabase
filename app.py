from os import getenv
from flask import Flask, render_template, session, redirect, url_for, request, flash
from dotenv import load_dotenv
from cs50 import SQL
from hashlib import pbkdf2_hmac
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

load_dotenv()

session_key = getenv("SESSION_SECRET")
hashing_salt = getenv("HASHING_SALT")
HASHING_ITERATION = 600_000

app = Flask(__name__)

app.secret_key = session_key

limiter = Limiter(
    get_remote_address,
    app=app,
    default_limits=["200 per day", "50 per hour"],
    storage_uri="memory://",
)

db = SQL("sqlite:///dbROTC.db")

@app.route("/")
def index():
    if 'username' not in session:
        return redirect(url_for('login'))
    return render_template("index.html")

@app.route("/staffs")
def staffs():
    if 'username' not in session:
        return redirect(url_for('login'))
    return render_template("staffs.html")

@app.route("/events")
def events():
    if 'username' not in session:
        return redirect(url_for('login'))
    return render_template("events.html")

@app.route("/inventory")
def inventory():
    if 'username' not in session:
        return redirect(url_for('login'))
    return render_template("inventory.html")

@app.route("/login", methods=['GET', 'POST'])
@limiter.limit("1 per 30 seconds", methods=['POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = pbkdf2_hmac('sha256', password.encode('utf-8'), hashing_salt.encode('utf-8') * 2, HASHING_ITERATION).hex()
        admin_credentials = db.execute("SELECT * FROM tblAccount WHERE strUsername = ?", username)

        if len(admin_credentials) != 0 and admin_credentials[0]['strPassword'] == hashed_password:
            session['username'] = username
            return redirect(url_for('index'))
        
        else:
            return render_template("login.html", flash_message="is-invalid")

        return redirect(url_for('login'))
    session.pop('username', None)
    return render_template("login.html")