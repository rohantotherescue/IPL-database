import pandas as pd
import streamlit as st
import plotly.express as px
# from database import view_all_data
from database import view_player_data
from database import view_team_data
def read_player():
    result = view_player_data()
    df = pd.DataFrame(result, columns=["PlayerID", "FirstName", "LastName", "Team_Name", "Runs", "Wickets", "DOB", "Bats", "Bowls","No_of_Matches", "TeamID"]) 
    with st.expander("View all Players"):
        st.dataframe(df)

def read_team():
    result = view_team_data()
    df = pd.DataFrame(result, columns=["TeamID", "TeamName", "Owner", "Net_Worth", "Year_formed", "Captian", "Win_percent", "Fairplay_points", "No_of_players", "Table_rank","Head_coach"]) 
    with st.expander("View all Teams"):
        st.dataframe(df)
        team_df = df.value_counts().to_frame()
        team_df = team_df.reset_index()
        # st.dataframe(team_df)
        p1 = px.pie(team_df, names='TeamName', values='Win_percent')
        st.plotly_chart(p1)