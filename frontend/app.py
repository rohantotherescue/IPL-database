import streamlit as st
# from create import create
from create import create_player
from create import create_inventory
from create import create_coach
# from database import create_table
from delete import delete
from read import read_team
from read import read_player
from update import update

def main():
    st.title("Indian Premium League D-Base")
    menu = ["Add Player","Add inventory","Add coach", "View PLAYER", "View TEAM", "Edit MEDIC", "Remove PLAYER"]
    choice = st.sidebar.selectbox("Menu", menu)
    # create_table()
    if choice == "Add Player":
        st.subheader("Enter PLAYER Details:")
        create_player()
    elif choice == "Add inventory":
        st.subheader("Enter INVENTORY Details:")
        create_inventory()
    elif choice == "Add coach":
        st.subheader("Enter COACH Details:")
        create_coach()
    elif choice == "View PLAYER":
        st.subheader("View created players")
        read_player()
    elif choice == "View TEAM":
        st.subheader("View created teams")
        read_team()    
    elif choice == "Edit MEDIC":
        st.subheader("Update the medic hospital")
        update()
    elif choice == "Remove PLAYER":
        st.subheader("Delete players")
        delete()
    else:
        st.subheader("Divided by teams, United by king of good times.")
if __name__ == '__main__':
    main()