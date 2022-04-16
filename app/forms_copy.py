from flask_wtf import FlaskForm
from wtforms import (
                    StringField
                    ,PasswordField
                    ,BooleanField
                    ,SubmitField
                    ,TextField
                    ,TextAreaField
                    ,SelectField
                    ,IntegerField
                    ,RadioField
)
from wtforms.validators import DataRequired
from wtforms.fields.html5 import DateField
from datetime import datetime
from wtforms.ext.sqlalchemy.fields import QuerySelectField
from app.models import Office

class LoginForm(FlaskForm):
    username        = StringField('Username',validators =[DataRequired()])
    password        = PasswordField('Password', validators=[DataRequired()])
    remember_me     = BooleanField('Remember Me')
    submit          = SubmitField('Sign In')

class DocumentForm(FlaskForm):
    reference_no = StringField('File No')
    dated = DateField('Dated')
    source = StringField('Document Source',validators=[DataRequired()])
    subject = StringField('Subject', validators=[DataRequired()])
    keywords = StringField('Keywords', validators=[DataRequired()])
    note = StringField('Any Additional Note')
    file_type = SelectField('File Type', choices=[('Note','note'),('Document','document'), ('Letter','letter')])
    number_of_pages = IntegerField('Number of pages', default =1)
    corresponding = IntegerField('Corresponding', default =1)
    priority = SelectField('Priority', choices=[('U','Urgent'), ('M','Medium'), ('N','No Priority')])
    confidential = BooleanField('Confidential',default = False)
    recieve_date = DateField('Receive Date', default = datetime.utcnow)
    contact = StringField('Contact Address')

    submit = SubmitField('Submit')
class DocumentMovementForm(FlaskForm):
    # recipient = QuerySelectField(query_factory=lambda: Office.query.all())
    recipient = QuerySelectField(query_factory=lambda: Office.query.all(), allow_blank=True, get_label='name', get_pk = lambda a:a.id, blank_text=u'Select Destination ...')
    priority = SelectField('Priority', choices=[('U','Urgent'), ('M','Medium'), ('N','No Priority')])
    deadline = DateField('Deadline', default= datetime.utcnow)
    remarks = StringField('Remarks')

    submit = SubmitField('Forward Document')