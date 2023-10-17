import streamlit as st
from database import add_player_data
from database import add_inventory_data
from database import add_coach_data

def create_player():
    col1, col2 = st.columns(2)
    with col1:
        PlayerID = st.text_input("Player ID")
        FirstName = st.text_input("First Name")
        LastName = st.text_input("Last Name")
        Team_Name = st.text_input("Team Name")
    with col2:
        Runs = st.text_input("Strike runs")
        Wickets = st.text_input("Wickets taken")
        DOB = st.text_input("Date of Birth")
        Bats = st.selectbox("Batting Style", ["Right-Handed", "Left-Handed"])
        Bowls = st.selectbox("Bowling Style", ["Right-arm offspin", "Right-arm medium", "Right-arm fast", "Left-arm offspin"])
        No_of_Matches= st.text_input("No. of matches played")
        TeamID= st.text_input("TeamID")
    if st.button("Add Player Details"):
        add_player_data(PlayerID, FirstName, LastName, Team_Name, Runs, Wickets, DOB, Bats, Bowls,No_of_Matches, TeamID)
        st.success("Successfully added Player with ID: {}".format(PlayerID))

def create_inventory():
    col1, col2 = st.columns(2)
    with col1:
        Name = st.text_input("Inventory Name")
        Quantity = st.text_input("Quantity")
    with col2:
        InventoryID = st.text_input("Inventory ID")
        TeamID = st.text_input("Team ID")
    if st.button("Add Inventory Details"):
        add_inventory_data(Name, Quantity, InventoryID, TeamID)
        st.success("Successfully added Inventory with ID: {}".format(InventoryID))

def create_coach():
    col1, col2 = st.columns(2)
    with col1:
        CoachID = st.text_input("Coach ID")
        FirstName = st.text_input("Coach First Name")
        LastName = st.text_input("Coach Last Name")
        Years_of_Exp = st.text_input("Years of Experience")
    with col2:
        DOB = st.text_input("Date of Birth")
        Coaching_style = st.selectbox("Coaching Style", ["Head-Coach", "Batting Coach","Bowling Coach", "Feilding Coach"])
        TeamID = st.text_input("Team ID")
    if st.button("Add Coach Details"):
        add_coach_data(CoachID,FirstName, LastName,Years_of_Exp,DOB, Coaching_style, TeamID)
        st.success("Successfully added Coach with ID: {}".format(CoachID))