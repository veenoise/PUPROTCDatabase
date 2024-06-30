from flask import Flask, render_template, request, url_for, redirect
import flask_login
import cs50
from hashlib import pbkdf2_hmac
from dotenv import load_dotenv
from os import getenv

load_dotenv()

SESSION_SECRET = getenv('SESSION_SECRET')
DATABASE_URL = getenv('DATABASE_URL')
HASHING_SALT = getenv('HASHING_SALT')
HASHING_ITERATION = 600_000

app = Flask(__name__)
# Choose a proper secret key
app.secret_key = SESSION_SECRET
login_manager = flask_login.LoginManager()
login_manager.init_app(app)
# For PostgreSQL
db = cs50.SQL(DATABASE_URL) 

class User(flask_login.UserMixin):
    pass

@login_manager.user_loader
def user_loader(strusername):
    username = db.execute("SELECT * FROM tbladmin WHERE strusername = ?", strusername)
    if len(username) != 1:
        return
    
    if strusername != username[0]['strusername']:
        return

    user = User()
    user.id = strusername
    return user

@login_manager.request_loader
def request_loader(request):
    username_var = request.form.get('username')
    username = db.execute("SELECT * FROM tbladmin WHERE strusername = ?", username_var)
    if len(username) != 1:
        return
    
    if username_var != username[0]['strusername']:
        return

    user = User()
    user.id = username_var
    return user

@app.route("/")
@flask_login.login_required
def home():
    return render_template('home.html')

@app.route("/cadets", methods=['POST', 'GET'])
@flask_login.login_required
def cadets():
    if request.method == 'POST':
        form_action = request.form['arg']
        
        if form_action == 'add':
            first_name = request.form['firstName'].strip()
            middle_name = request.form['middleName'].strip()
            if middle_name == '':
                middle_name = None

            surname = request.form['surName'].strip()
            student_number = request.form['studentNumber'].strip()
            address = request.form['address'].strip()
            date_of_birth = request.form['dateOfBirth'].strip()
            date_of_enrollment = request.form['dateOfEnrollment'].strip()
            course = request.form['course'].strip()
            enrollment_status = request.form['enrollmentStatus'].strip()
            rank = request.form['rank'].strip()
            platoon = request.form['platoon'].strip()
            role = request.form['role'].strip()
            if role == '':
                role = None
            
            db.execute("\
                INSERT INTO tblcadet(\
                    strfirstname, \
                    strmiddlename, \
                    strsurname, \
                    strstudentnumber, \
                    straddress, \
                    datdateofbirth, \
                    datdateofenrollment, \
                    intrankid, \
                    intcourseid, \
                    intenrollmentstatusid, \
                    introleid, \
                    intplatoonid\
                ) VALUES (\
                    ?, ?, ?, ?, ?, ?, ? ,? ,? ,? ,? ,?\
                )\
                ", 
                first_name, 
                middle_name, 
                surname, 
                student_number, 
                address, 
                date_of_birth, 
                date_of_enrollment, 
                rank, 
                course, 
                enrollment_status, 
                role, 
                platoon
            )
        elif form_action == 'update':
            student_number = request.form['studentNumber'].strip()
            date_of_enrollment = request.form['dateOfEnrollment'].strip()
            course = request.form['course'].strip()
            enrollment_status = request.form['enrollmentStatus'].strip()
            rank = request.form['rank'].strip()
            platoon = request.form['platoon'].strip()
            role = request.form['role'].strip()
            if role == '':
                role = None

            db.execute("\
                UPDATE tblcadet\
                SET \
                datdateofenrollment = ?, \
                intcourseid = ?, \
                intenrollmentstatusid = ?, \
                intrankid = ?, \
                intplatoonid = ?, \
                introleid = ?\
                WHERE\
                strstudentnumber = ?\
                ", 
                date_of_enrollment, 
                course, 
                enrollment_status, 
                rank, 
                platoon, 
                role, 
                student_number
            )
        elif form_action == 'delete':
            student_number = request.form['studentNumber'].strip()

            db.execute("\
                DELETE FROM tblcadet \
                WHERE \
                strstudentnumber = ?\
                ",
                student_number
            )

    rows = db.execute("\
        SELECT intcadetid, \
        strfirstname,\
        strmiddlename,\
        strsurname,\
        strstudentnumber, \
        datDateOfBirth, \
        b.strcoursename, \
        c.strenrollmentstatus, \
        d.strrank, \
        e.strplatoonname, \
        f.strrolename \
        FROM tblcadet a\
        LEFT JOIN tblcourse b\
        ON a.intcourseid = b.intcourseid\
        LEFT JOIN tblenrollmentstatus c\
        ON a.intenrollmentstatusid = c.intenrollmentstatusid\
        LEFT JOIN tblrank d\
        ON a.intrankid = d.intrankid\
        LEFT JOIN tblplatoon e\
        ON a.intplatoonid = e.intplatoonid\
        LEFT JOIN tblrole f\
        ON a.introleid = f.introleid\
        ORDER BY a.intcadetid;"\
    )
    courses = db.execute("\
        SELECT * FROM tblcourse\
        ORDER BY intcourseid;\
    ")
    enrollment_status = db.execute("\
        SELECT * FROM tblenrollmentstatus\
        ORDER BY intenrollmentstatusid;\
    ")
    rank = db.execute("\
        SELECT * FROM tblrank\
        ORDER BY intrankid;\
    ")
    platoon = db.execute("\
        SELECT * FROM tblplatoon\
        ORDER BY intplatoonid;\
    ")
    role = db.execute("\
        SELECT * FROM tblrole\
        ORDER BY introleid;\
    ")
    return render_template('cadets.html', rows=rows, courses=courses, enrollment_status=enrollment_status, rank=rank, platoon=platoon, role=role)

@app.route("/instructors", methods=['POST', 'GET'])
@flask_login.login_required
def instructors():
    if request.method == 'POST':
        form_action = request.form['arg']

        if form_action == 'add':
            first_name = request.form['firstName'].strip()
            middle_name = request.form['middleName'].strip()
            if middle_name == '':
                middle_name = None

            surname = request.form['surName'].strip()
            date_assigned = request.form['dateAssigned'].strip()
            rank = request.form['rank'].strip()

            db.execute("\
                INSERT INTO tblinstructor(\
                    strfirstname,\
                    strmiddlename,\
                    strsurname,\
                    datdateassigned,\
                    intrankid\
                ) VALUES (\
                    ?, ?, ?, ?, ?\
                )\
                ",
                first_name,
                middle_name,
                surname,
                date_assigned,
                rank
            )
        elif form_action == 'update':
            instructor_id = request.form['instructorId'].strip()
            date_assigned = request.form['dateAssigned'].strip()
            rank = request.form['rank'].strip()

            db.execute("\
                UPDATE tblinstructor\
                SET \
                datdateassigned = ?,\
                intrankid = ?\
                WHERE \
                intinstructorid = ?\
                ",
                date_assigned,
                rank,
                instructor_id
            )
            
        elif form_action == 'delete':
            instructor_id = request.form['instructorId']

            db.execute("\
                DELETE FROM tblinstructor\
                WHERE\
                intinstructorid = ?\
                ",
                instructor_id
            )

    rows = db.execute("\
        SELECT \
        intinstructorid,\
        strfirstname,\
        strmiddlename,\
        strsurname,\
        datdateassigned,\
        b.strrank\
        FROM tblinstructor a\
        LEFT JOIN tblrank b\
        ON a.intrankid = b.intrankid;\
    ")
    rank = db.execute("\
        SELECT * FROM tblrank;\
    ")
    return render_template('instructors.html', rows=rows, rank=rank)

@app.route("/equipments", methods=['POST', 'GET'])
@flask_login.login_required
def equipments():
    if request.method == 'POST':
        form_action = request.form['arg']

        if form_action == 'add':
            equipment = request.form['equipment']

            db.execute("\
                INSERT INTO tblequipment(\
                    strequipment\
                ) VALUES (\
                    ?\
                )\
                ",
                equipment
            )

        elif form_action == 'update':
            equipment = request.form['equipment']
            equipment_rename = request.form['equipmentRename']
            db.execute("\
                UPDATE tblequipment\
                SET strequipment = ?\
                WHERE strequipment = ?",
                equipment_rename,
                equipment
            )

        elif form_action == 'delete':
            equipment = request.form['equipment']
            db.execute("\
                DELETE FROM tblequipment\
                WHERE strequipment = ?\
                ",
                equipment
            )

    rows = db.execute("\
        SELECT intequipmentid, strequipment \
        FROM tblequipment;\
    ")
    return render_template('equipments.html', rows=rows)

@app.route("/equipmentsused", methods=['POST', 'GET'])
@flask_login.login_required
def equipmentsused():
    if request.method == 'POST':
        form_action = request.form['arg']

        if form_action == 'add':
            quantity = request.form['quantity']           
            event = request.form['event']
            if event == '':
                event = None

            equipment = request.form['equipment']

            db.execute("\
                INSERT INTO tblequipmentused(\
                    intquantity,\
                    inteventid,\
                    intequipmentid\
                ) VALUES (\
                    ?,?,?\
                )\
                ",
                quantity,
                event,
                equipment
            )

        elif form_action == 'update':
            equipment_used_id = request.form['equipmentUsedId']
            quantity = request.form['quantity']           
            event = request.form['event']
            if event == '':
                event = None
                
            equipment = request.form['equipment']

            db.execute("\
                UPDATE tblequipmentused\
                SET \
                intquantity = ?,\
                inteventid = ?,\
                intequipmentid = ?\
                WHERE \
                intequipmentusedid = ?\
                ",
                quantity,
                event,
                equipment,
                equipment_used_id
            )
        
        elif form_action == 'delete':
            equipment_used_id = request.form['equipmentUsedId']

            db.execute("\
                DELETE FROM tblequipmentused\
                WHERE intequipmentusedid = ?\
                ",
                equipment_used_id
            )

    rows = db.execute("\
        SELECT \
        intequipmentusedid,\
        intquantity,\
        b.streventname,\
        c.strequipment\
        FROM tblequipmentused a\
        LEFT JOIN tblevent b\
        ON a.inteventid = b.inteventid\
        LEFT JOIN tblequipment c\
        ON a.intequipmentid = c.intequipmentid\
        ORDER BY intequipmentusedid;\
    ")
    event = db.execute("\
        SELECT * FROM tblevent;\
    ")
    equipment = db.execute("\
        SELECT * FROM tblequipment;\
    ")
    return render_template('equipmentused.html', rows=rows, event=event, equipment=equipment)

@app.route("/events", methods=['POST', 'GET'])
@flask_login.login_required
def events():
    if request.method == 'POST':
        form_action = request.form['arg']

        if form_action == 'add':
            event = request.form['event']
            if event == '':
                event = None

            event_date = request.form['eventDate']

            db.execute("\
                INSERT INTO tblevent(\
                    streventname,\
                    dateventdate\
                ) VALUES (\
                    ?, ?\
                )\
                ",
                event,
                event_date
            )
        
        elif form_action == 'update':
            event_id = request.form['eventId']
            event = request.form['event']
            if event == '':
                event = None

            event_date = request.form['eventDate']

            db.execute("\
                UPDATE tblevent\
                SET\
                streventname = ?,\
                dateventdate = ?\
                WHERE \
                inteventid = ?\
                ",
                event,
                event_date,
                event_id
            )

        elif form_action == 'delete':
            event_id = request.form['eventId']

            db.execute("\
                DELETE FROM tblevent\
                WHERE inteventid = ?\
                ",
                event_id
            )

    rows = db.execute("\
        SELECT \
        inteventid,\
        streventname,\
        dateventdate\
        FROM tblevent;\
    ")
    return render_template('events.html', rows=rows)

@app.route("/attendance", methods=['POST', 'GET'])
@flask_login.login_required
def attendance():
    if request.method == 'POST':
        form_action = request.form['arg']

        if form_action == 'add':
            date = request.form['eventDate']
            student_number = request.form['studentNumber']
            event = request.form['event']
            if event == '':
                event = None
                
            cadet_id = db.execute("\
                SELECT intcadetid FROM tblcadet \
                WHERE\
                strstudentnumber = ? \
                ",
                student_number
            )

            if len(cadet_id) != 1:
                return "Cadet not found"
            
            db.execute("\
                INSERT INTO tblattendance(\
                    datdate,\
                    intcadetid,\
                    inteventid\
                ) VALUES (\
                    ?, ?, ?\
                )\
                ",
                date,   
                cadet_id[0]['intcadetid'],
                event
            )

        elif form_action == 'update':
            date = request.form['eventDate']
            event = request.form['event']
            if event == '':
                event = None

            attendance_id = request.form['attendanceId']

            db.execute("\
                UPDATE tblattendance\
                SET\
                datdate = ?,\
                inteventid = ?\
                WHERE intattendanceid = ?\
                ",
                date,
                event,
                attendance_id
            )

        elif form_action == 'delete':
            attendance_id = request.form['attendanceId']

            db.execute("\
                DELETE FROM tblattendance\
                WHERE intattendanceid = ?\
                ",
                attendance_id
            )

    rows = db.execute("\
        SELECT \
        intattendanceid,\
        datdate,\
        b.strfirstname,\
        b.strmiddlename,\
        b.strsurname,\
        c.streventname\
        FROM tblattendance a\
        LEFT JOIN tblcadet b\
        ON a.intcadetid = b.intcadetid\
        LEFT JOIN tblevent c \
        ON a.inteventid = c.inteventid\
    ")
    event = db.execute("\
        SELECT * FROM tblevent;\
    ")
    return render_template('attendance.html', rows=rows, event=event)

@app.route("/login", methods=['POST', 'GET'])
def login():
    if request.method == "POST":
        username = request.form['username']
        password = request.form['password']
        password_hash = pbkdf2_hmac('sha256', password.encode('utf-8'), HASHING_SALT.encode('utf-8') * 2, HASHING_ITERATION).hex()
        row = db.execute("SELECT * FROM tbladmin WHERE strusername = ?", username)
        print(len(row))
        if len(row) != 1:
            # TODO: Use flash
            return 'Bad login'
        elif row[0]['strpassword'] == password_hash:
            user = User()
            user.id = username
            flask_login.login_user(user)
            return redirect(url_for('home'))
    return render_template('login.html')

@app.route('/logout')
def logout():
    flask_login.logout_user()
    return redirect(url_for('login'))

@login_manager.unauthorized_handler
def unauthorized_handler():
    return redirect(url_for('login'))

app.run(
    debug=True
)