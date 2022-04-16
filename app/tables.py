from flask_table import Col, ButtonCol, DateCol, LinkCol, Table,DatetimeCol

class PredictionTable(Table):
    classes = ['table','table-striped','table-bordered','table-hover','table-sm ']
    id = Col('ID')
    home_team = Col('Home Team')
    away_team = Col('Away Team')
    winner = Col('Winner')

class UserTable(Table):
    classes = ['table','table-striped','table-bordered','table-hover','table-sm ']
    id = Col('ID')
    username = Col('Username')
    email = Col('Email')
    is_admin = Col('Is Admin')
    delete = LinkCol('Delete', 'delete_user',url_kwargs=dict(id ='id'))

class TeamTable(Table):
    classes = ['table','table-striped','table-bordered','table-hover','table-sm ']
    id = Col('ID')
    name = Col('Name')
    delete = LinkCol('Delete', 'delete_team',url_kwargs=dict(id ='id'))
