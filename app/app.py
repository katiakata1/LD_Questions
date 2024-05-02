from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime 
from flask import redirect, url_for

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///app.db'
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