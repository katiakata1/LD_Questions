from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime 
from flask import redirect, url_for
import pyodbc
from sqlalchemy import create_engine
import urllib

app = Flask(__name__)

params = urllib.parse.quote_plus \
(r'Driver={ODBC Driver 18 for SQL Server};Server=tcp:ldquestionssqlserver.database.windows.net,1433;Database=ld_sql_db;Uid=sql_admin@ldquestionssqlserver;Pwd=LD_P@ssw0rd123!_secret;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;')
conn_str = 'mssql+pyodbc:///?odbc_connect={}'.format(params)
engine_azure = create_engine(conn_str,echo=True)

# Set the SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_DATABASE_URI'] = str(engine_azure.url)

db = SQLAlchemy(app)

class Entry(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String(255), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow) 

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/thankyou')
def thankyou():
    return render_template('thankyou.html')

@app.route('/submit', methods=['POST'])
def submit():
    if request.method == 'POST':
        entry_content = request.form['entry']
        new_entry = Entry(content=entry_content)
        db.session.add(new_entry)
        db.session.commit()
        return redirect(url_for('thankyou'))  # Redirect to the thank you page

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)