from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime 
from flask import redirect, url_for
import pyodbc
from sqlalchemy import create_engine
import urllib
from dotenv import load_dotenv
import os

load_dotenv()  # Load environment variables from .env file if present

app = Flask(__name__)

db_driver = os.environ.get('DB_DRIVER')
db_server = os.environ.get('DB_SERVER')
db_name = os.environ.get('DB_NAME')
db_user = os.environ.get('DB_USER')
db_password = os.environ.get('DB_PASSWORD')

params = urllib.parse.quote_plus(
    f'Driver={db_driver};'
    f'Server=tcp:{db_server},1433;'
    f'Database={db_name};'
    f'Uid={db_user};'
    f'Pwd={db_password};'
    f'Encrypt=yes;'
    f'TrustServerCertificate=no;'
    f'Connection Timeout=30;'
)

conn_str = f'mssql+pyodbc:///?odbc_connect={params};charset=utf8mb4'
engine_azure = create_engine(conn_str,echo=True)

# Set the SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_DATABASE_URI'] = str(engine_azure.url)

db = SQLAlchemy(app)

class Entry(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.UnicodeText(collation='Cyrillic_General_CI_AS'), nullable=False)  # Use UnicodeText to support longer strings
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
        # entry_content_utf8 = entry_content.encode('utf-8')
        new_entry = Entry(content=entry_content)
        db.session.add(new_entry)
        db.session.commit()
        return redirect(url_for('thankyou'))  # Redirect to the thank you page

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(port=5000, host='0.0.0.0', debug=True)
