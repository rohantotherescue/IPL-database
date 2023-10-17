import pandas as pd
import streamlit as st
from database import view_player_data, view_only_player_ID, delete_player_data


def delete():
    result = view_player_data()
    df = pd.DataFrame(result, columns=["PlayerID", "FirstName", "LastName", "Team_Name", "Runs", "Wickets", "DOB", "Bats", "Bowls","No_of_Matches", "TeamID"]) 
    with st.expander("View all Players"):
        st.dataframe(df)
    list_of_players = [i[0] for i in view_only_player_ID()]
    selected_player = st.selectbox("Player to Delete", list_of_players)
    st.warning("Do you want to delete ::{}".format(selected_player))
    if st.button("Delete Player"):
        delete_player_data(selected_player)
        st.success("Player entry has been deleted successfully")
    new_result = view_player_data()
    df = pd.DataFrame(new_result, columns=["PlayerID", "FirstName", "LastName", "Team_Name", "Runs", "Wickets", "DOB", "Bats", "Bowls","No_of_Matches", "TeamID"]) 
    with st.expander("Updated Player data"):
        st.dataframe(df)