import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="sport_database"
)
c = mydb.cursor()


# def create_table():
#     c.execute('CREATE TABLE IF NOT EXISTS TRAIN(Train_No TEXT, T_Name TEXT, T_type TEXT, Arrival TEXT, Destination TEXT, Availability TEXT)')


def add_player_data(PlayerID, FirstName, LastName, Team_Name, Runs, Wickets, DOB, Bats, Bowls,No_of_Matches, TeamID):
    c.execute('INSERT INTO player(PlayerID, FirstName, LastName, Team_Name, Runs, Wickets, DOB, Bats, Bowls,No_of_Matches, TeamID) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',
              (PlayerID, FirstName, LastName, Team_Name, Runs, Wickets, DOB, Bats, Bowls,No_of_Matches, TeamID))
    mydb.commit()

def add_inventory_data(Name, Quantity, InventoryID, TeamID):
    c.execute('INSERT INTO inventory(Name, Quantity, InventoryID, TeamID) VALUES (%s,%s,%s,%s)',
              (Name, Quantity, InventoryID, TeamID))
    mydb.commit()

def add_coach_data(CoachID,FirstName, LastName,Years_of_Exp,DOB, Coaching_style, TeamID):
    c.execute('INSERT INTO coach(CoachID,FirstName, LastName,Years_of_Exp,DOB, Coaching_style, TeamID) VALUES (%s,%s,%s,%s,%s,%s,%s)',
              (CoachID,FirstName, LastName,Years_of_Exp,DOB, Coaching_style, TeamID))
    mydb.commit()


def view_player_data():
    c.execute('SELECT * FROM player')
    data = c.fetchall()
    return data

def view_only_player_ID():
    c.execute('SELECT PlayerID FROM player')
    data = c.fetchall()
    return data

def view_team_data():
    c.execute('SELECT * FROM team')
    data = c.fetchall()
    return data

def view_only_med_ID():
    c.execute('SELECT MedID FROM medic')
    data = c.fetchall()
    return data

def view_medic_data():
    c.execute('SELECT * FROM medic')
    mydb.commit()
    data = c.fetchall()
    return data

def edit_medic_data(new_hospital, MedID):
    c.execute("UPDATE medic SET Hospital=%s where MedID= %s", (new_hospital, MedID))
    mydb.commit()


def delete_player_data(PlayerID):
    c.execute('DELETE FROM player WHERE PlayerID="{}"'.format(PlayerID))
    mydb.commit()