########### IMPORT SECTION ########################################
from app import db
from datetime import datetime
from werkzeug import generate_password_hash, check_password_hash
from flask_login import UserMixin
from app import login
###################################################################

@login.user_loader
def load_user(id):
    return User.query.get(int(id))

class User(UserMixin,db.Model):
    id = db.Column(db.Integer, primary_key =True)
    username = db.Column(db.String(128), index=True,unique=True)
    email = db.Column(db.String(128), index=True, unique=True)
    password_hash = db.Column(db.String(128))
    office_id       = db.Column(db.Integer, db.ForeignKey('office.id'))

    documents_created = db.relationship('Document',  backref='author', lazy='dynamic')
    documents_forwarded = db.relationship('DocumentMovement',  backref='author', lazy='dynamic')

    def set_password(self,password):
        self.password_hash=generate_password_hash(password)

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)

    def __repr__(self):
        return '<User {}>'.format(self.username)

class Document(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    reference_no = db.Column(db.String(100))
    dated = db.Column(db.DateTime, index=True, default = datetime.utcnow)
    source = db.Column(db.String(100)) # User should be able to select department or type new
#    destination = db.Column(db.String(100))
    subject = db.Column(db.String(100))
    keywords = db.Column(db.String(100))
    note = db.Column(db.String(100))
    file_type = db.Column(db.String(32))
    number_of_pages = db.Column(db.Integer)
    corresponding = db.Column(db.Integer)
    priority = db.Column(db.String(32))
    confidential = db.Column(db.Boolean, default = False)
    recieve_date = db.Column(db.DateTime, index = True, default = datetime.utcnow)
    insert_date = db.Column(db.DateTime,index=True, default = datetime.utcnow)
    contact = db.Column(db.String(100))

    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return '<Document Title: {}>'.format(self.subject)

class Office(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(128), unique=True, index=True)
    in_charge = db.Column(db.String(128))

    def __repr__(self):
        return '<Office: {}>'.format(self.name)

class DocumentMovement(db.Model):
    id              = db.Column(db.Integer,primary_key=True)
    remarks         = db.Column(db.String(200))
    priority        = db.Column(db.String(16))
    insert_date     = db.Column(db.DateTime, default = datetime.utcnow)
    deadline        = db.Column(db.DateTime, default = datetime.utcnow)
    opened          = db.Column(db.Boolean, default = False)
    #Foreign key relations
    source_id       = db.Column(db.Integer, db.ForeignKey('office.id'))
    destination_id  = db.Column(db.Integer, db.ForeignKey('office.id'))
    user_id         = db.Column(db.Integer, db.ForeignKey('user.id'))
    document_id     = db.Column(db.Integer, db.ForeignKey('document.id'))

    def __repr__(self):
        return '<Movement: {}>'.format(self.remarks)

class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sender_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    recipient_id = db.Column(db.Integer,db.ForeignKey('user.id'))
    body = db.Column(db.String(200))
    timestamp = db.Column(db.DateTime, default = datetime.utcnow, index=True)

    # messages_sent = db.relationship('Message',
    #                                 foreign_keys='Message.sender_id',
    #                                 backref='sender', lazy='dynamic')
    # messages_received = db.relationship('Message',
    #                                     foreign_keys='Message.recipient_id',
    #                                     backref='recipient', lazy='dynamic')
    last_message_read_time = db.Column(db.DateTime)

    def __repr__(self):
        return '<Message {}>'.format(self.body)


    def new_messages(self):
        last_read_time = self.last_message_read_time or datetime(1900, 1, 1)
        return Message.query.filter_by(recipient=self).filter(
            Message.timestamp > last_read_time).count()

class DocumentSource(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    source = db.Column(db.String(128))
