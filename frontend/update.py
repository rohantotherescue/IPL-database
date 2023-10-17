import pandas as pd
import streamlit as st
from database import view_medic_data, view_only_med_ID, edit_medic_data


def update():
    result = view_medic_data()
    df = pd.DataFrame(result, columns=["MedID","FirstName","LastName","Specialization","Hospital","Years_of_Exp","TeamID"]) 
    with st.expander("Current Medic stats"):
        st.dataframe(df)
    list_of_medics = [i[0] for i in view_only_med_ID()]
    selected_medic = st.selectbox("medic to Edit", list_of_medics)
    if selected_medic:
        new_hosp = st.text_input("New Hospital")
        if st.button("Update Medic's Hospital"):
            edit_medic_data(new_hosp, selected_medic)
            st.success("Successfully updated Hospital of medic :: {} to :: {}".format(selected_medic, new_hosp))

    result2 = view_medic_data()
    df2 = pd.DataFrame(result2, columns=["MedID","FirstName","LastName","Specialization","Hospital","Years_of_Exp","TeamID"])
    with st.expander("Updated Medic data"):
        st.dataframe(df2)