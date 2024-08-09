*** Settings ***
Library    SeleniumLibrary
Library  Collections
Library    OperatingSystem
Library    Process
Resource    ./Varibles_XPath.robot



*** Test Cases ***
Employee profile
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${Main_page_wait}
    Employee Login page
    Employee Form page
    SSLC_Education_details
    HSC_School_Details
    UG_Education_Details
    Employee_Experience
    ID_Information
    Summary

*** Keywords ***
Employee Login page
    Input Text   ${user_name_locator}    ${username}
    Input Password   ${Password_locator}   ${pass}
    Click Button    ${login}
    Sleep    5s
Employee Form page
    Click Element    ${check}
    Sleep    2s
#   Click Link    ${Next}
    Wait Until Element Is Visible   ${Pesronal_info_tab_wait}
    Wait Until Element Is Visible   ${Alter_MobileNum}  2s
    Click Element    ${Alter_MobileNum}
    Press Key    ${Alter_MobileNum}    ${Alter_MobileNum_value}
    Wait Until Element Is Visible   ${Alter_MobileNum}  2s
    Gender
    Sleep    5s
    Capture Page Screenshot
#    Select Year    ${YEAR}
#    Capture Page Screenshot
#    Select Month
#    Select Day    ${DAY}
    DOB
    Marital status
    Upload photo
    Sleep   2s
    Set Focus To Element    ${Address_Information_Expand}
    Sleep    2s
    Address_information
    Capture Page Screenshot
Gender 
    Wait Until Element Is Visible   ${Gender}    2s
    Click Element    ${Gender}
    Sleep       5s
    Capture Page Screenshot
Marital status
    Wait Until Element Is Visible   ${Marital_status}    2s
    Click Element    ${Marital_status}

    Click Element    ${Nationality}
    Input Text    ${Input_nationality_locator}   ${Nationality_Value}
#    Set Focus To Element    ${Set_focus_Nationlity_Value}
    Wait Until Element Is Visible    ${Nationality_wait}
    Click Element   ${Nationality_value_locator}
DOB

    Click Element   ${Date_of_birth_calender_locator}
    FOR  ${index}  IN RANGE  ${max_iterations}
        ${current_year}  Get Text  ${current_year_text}
        Exit For Loop If  '${YEAR}' == '${current_year}'
        Click Element   ${previous_switch}
    END


#Select Year
#    [Arguments]    ${year}
#    Wait Until Element Is Visible   ${Date_of_birth_calender_locator}
#    Click Element                   ${Date_of_birth_calender_locator}
#    Wait Until Element Is Visible   ${Slect_year_month_switch}
#    Click Element    ${Slect_year_month_switch}
#    Click Element    ${Select_year_switch}
#    Click Element     ${Select_year_value_locator}
#
#
#Select Month
#
#    Wait Until Element Is Visible    ${SelectMonth_visible_wait}
#    Click Element    ${SelecMonth_Value_locator}
#
#Select Day
#    [Arguments]    ${day}
#    Wait Until Element Is Visible     ${SelectDay_Value_locator}
#    Click Element                     ${SelectDay_Value_locator}
Upload photo

    Set Focus To Element   ${upload_xpath_focus}
    Choose File     ${profile_pic_upload_locator}   ${image_path}
    Capture Page Screenshot
    Sleep       5s

Address_information
#    Click Element    ${Address_Information_Expand}
#    Click Element    ${Address_Information_Expand}
#    Input Text    ${Address_Line1}    No.2, XXXXXXXX,
#    Input Text    ${Address_Line2}    Old Byepass Road,
#    Input Text    ${Address_Zipcode}    632006
#    Click Element    ${Address_City}
#    Page Should Contain Radio Button    ${Nature_Of_Stay}
#    Select Radio Button    employee_permanent_nature_of_stay    Own
#    Input Text    ${Staying_From}    13/06/2022
#    Input Text    ${Staying_To}    15/07/2024
#    Sleep       2s
#   Set Focus To Element    ${Same_As_Paramanent_Address}
#   Click Element    ${Same_As_Paramanent_Address}
#
#    Set Focus To Element   ${profile_save_button_focus}
#    Click Element    ${Profile_Save_button_locator}
#    Sleep    1s
##    Wait Until Element Is Visible    ${wait_untill_visible}
#
#    Capture Page Screenshot

    Click Element  ${Profile_tab_Next}
###########################################
#   Education Details   SSLC              #
###########################################
SSLC_Education_details
#   FOR DIRECTLY NAVIGATING TO EDUCATION LEFT TAB SO COMMENTED BECAUSE CLICKING NEXT IN PERSONAL TAB ITSELF
#    Scroll Element Into View    ${Education_tab}
#    Set Focus To Element    ${Education_tab}
#    Wait Until Element Is Visible    ${Education_tab}
#    Set Focus To Element    ${Education_tab}
#    Click Element           ${Education_tab}
#    Sleep    3s
#    Capture Page Screenshot
    Wait Until Element Is Visible       ${Education_tab_page}
    Click Element    ${SSLC_Upload_xpath}
    Capture Page Screenshot
    Input Text    ${Schoolname_xpath}     ${School_Name}
    Input Text    ${SRegister_xpath}    ${SRegister_Number}
    Sleep    2s
    Mouse over    ${click_Name_of_theLevel}
    Click Element    ${click_Name_of_theLevel}
    Input Text      ${SSLC_search_Value_Xpath}        Secondary
    Wait Until Element Is Visible       ${primaryEducationNameOfLevel_results_shown_Xpath}
    Click Element  ${secondary_Value_Xpath}
    Sleep    2s
    Input Text    ${percentage_xpath}    ${percentage_value}
    Capture Page Screenshot
    Click Element    ${SSLC_fromdate_locator}
    Select Datepicker MonthYear_from_date
    Click Element       ${month_xpath}
    Select Datepicker MonthYear_To_date
    Click Element       ${month_xpath}
    Select Datepicker MonthYear_yearofpassing
    Consolidated Marksheet
    School_Address_Details



Select Datepicker MonthYear_from_date
     Click Element    ${SSLC_fromdate_locator}
     FOR  ${index}  IN RANGE  ${max_iterations}
        ${current_year}  Get Text  ${current_year_text}
        Exit For Loop If  '${SSLC_expected_Month_from_Year}' == '${current_year}'
        Click Element   ${previous_switch}

    END
Select Datepicker MonthYear_To_date
    Click Element    ${SSLC_To_locator}
    FOR  ${index}  IN RANGE  ${max_iterations}
        ${current_year}  Get Text  ${current_year_text}
        Exit For Loop If  '${SSLC_expected_Month_To_Year}' == '${current_year}'
        Click Element   ${previous_switch}
    END

Select Datepicker MonthYear_yearofpassing
    Click Element   ${SSLC_year_of_passing_locator}
    FOR  ${index}  IN RANGE  ${max_iterations}
        ${is_year_visible}  Run Keyword And Return Status  Element Should Be Visible  ${SSLC_Month_year_of_passing_target}
        IF  ${is_year_visible}
            Click Element    ${SSLC_Month_year_of_passing_target}
            Exit For Loop
        ELSE
            Click Element    ${previous_switch_year_of_passing}
        END
    END
Consolidated Marksheet
#        Wait Until Element Is Visible   ${consolidate_locator}

        Choose File    ${consolidate_locator}    ${SSLC_Marksheet}
School_Address_Details
        Set Focus To Element    ${SSLC_Add_line1_locator}
        Input Text    ${SSLC_Add_line1_locator}     ${SSLC_Add_line1_input_value}
        Input Text    ${SSLC_Add_line2_locator}     ${SSLC_Add_line2_input_value}
        Input Text    ${SSLC_Add_zipcode_locator}    ${SSLC_Add_zipcode_input_value}
        Set Focus To Element   ${SSLC_Add_City_locator}
        Input Text    ${SSLC_primary_Education_Email_locator}     ${SSLC_primary_Education_Email_value}
        Click Element    ${SSLC_School_MobileNum_locator}
        Press Key    ${SSLC_School_MobileNum_locator}     ${SSLC_School_MobileNum_value}
        Sleep    2s
        Set Focus To Element   ${SSLC_save_focus}
        Click Element    ${SSLC_save_button}

###########################################
#   Education Details   HSC               #
###########################################
HSC_School_Details
#   FOR DIRECTLY NAVIGATING TO EDUCATION LEFT TAB SO COMMENTED BECAUSE CLICKING NEXT IN EDUCATIONAL TAB ITSELF
#    Sleep    5s
#    Set Focus To Element    ${Education_tab}
#    Click Element           ${Education_tab}
#    Sleep    3s
#    Capture Page Screenshot
#    Wait Until Element Is Visible       ${Education_tab_page}
    Wait Until Element Is Visible   ${HSC_upload_locator}
    Set Focus To Element    ${HSC_upload_locator}
    Click Element    ${HSC_upload_locator}
    Capture Page Screenshot
    Wait Until Element Is Visible     ${HSC_Schoolname_locator}
    Input Text    ${HSC_Schoolname_locator}     ${HSC_School_name}
    Input Text    ${HSC_Register_locator}    ${HSC_Register_Number}
    Sleep    2s
    Mouse over    ${HSC_click_Name_of_theLevel}
    Click Element    ${HSC_click_Name_of_theLevel}
    Input Text      ${HSC_search_Value_Xpath}        ${HSC_secondary_Value}
    Wait Until Element Is Visible       ${HSC_primaryEducationNameOfLevel_results_shown_Xpath}
    Click Element  ${HSC_primaryEducationNameOfLevel_results_shown_Xpath}
    Sleep    2s
    Input Text    ${HSC_percentage_xpath}    ${percentage_value}
    Capture Page Screenshot
    Select HSC_Datepicker MonthYear_from_date
    Select HSC_Datepicker MonthYear_To_date
    Select HSC_Datepicker MonthYear_yearofpassing
    HSC_Consolidated Marksheet
    School_Address_Details
Select HSC_Datepicker MonthYear_from_date
     Click Element    ${HSC_fromdate_locator}
     FOR  ${index}  IN RANGE  ${max_iterations}
        ${current_year}  Get Text  ${HSC_current_year_text}
        Exit For Loop If  '${HSC_expected_Month_from_Year}' == '${current_year}'
        Click Element   ${HSC_previous_switch}

    END
    Click Element       ${HSC_month_xpath}

Select HSC_Datepicker MonthYear_To_date
    Click Element    ${HSC_To_locator}
    FOR  ${index}  IN RANGE  ${HSC_max_iterations}
        ${current_year}  Get Text  ${current_year_text}
        Exit For Loop If  '${HSC_expected_Month_To_Year}' == '${current_year}'
        Click Element   ${HSC_previous_switch}
    END
    Click Element       ${HSC_month_xpath}

Select HSC_Datepicker MonthYear_yearofpassing
    Click Element   ${HSC_year_of_passing_locator}
    FOR  ${index}  IN RANGE  ${HSC_YOP_max_iterations}
        ${is_year_visible}  Run Keyword And Return Status  Element Should Be Visible  ${HSC_Month_year_of_passing_target}
        IF  ${is_year_visible}
            Click Element    ${HSC_Month_year_of_passing_target}
            Exit For Loop
        ELSE
            Click Element    ${HSC_previous_switch_year_of_passing}
        END
    END
HSC_Consolidated Marksheet
        Wait Until Element Is Visible   ${HSC_consolidate_locator}
        Set Focus To Element   ${HSC_consolidate_locator}
        Choose File    ${HSC_consolidate_locator}    ${HSC_Marksheet}

School_Address_Details
        Set Focus To Element    ${HSC_Add_line1_locator}
        Input Text    ${HSC_Add_line1_locator}     ${HSC_Add_line1_input_value}
        Input Text    ${HSC_Add_line2_locator}     ${HSC_Add_line2_input_value}
        Input Text    ${HSC_Add_zipcode_locator}    ${HSC_Add_zipcode_input_value}
        Set Focus To Element   ${HSC_Add_City_locator}
        Input Text    ${HSC_primary_Education_Email_locator}     ${HSC_primary_Education_Email_value}
        Click Element    ${HSC_School_MobileNum_locator}
        Press Key    ${HSC_School_MobileNum_locator}     ${HSC_School_MobileNum_value}
        Sleep    2s
        Set Focus To Element   ${HSC_save_focus}
        Click Element    ${HSC_save_button}

###########################################
#   Education Details   UG                 #
###########################################
UG_Education_Details
       Sleep    5s
       Set Focus To Element    ${UG_Upload}
       Click Element    ${UG_Upload}
       Wait Until Element Is Visible       ${UG_Yes_radio_button_location}    10s
       ${element}=  Get WebElement  ${UG_Yes_radio_button}
       ${enabled}=  Run Keyword And Return Status  Element Should Be Enabled  ${element}
       Input Text    ${UG_Register_number_locator}    ${UG_Register_number}
       Capture Page Screenshot
       Mouse over       ${UG_Degree_selection_locator}
       Click Element    ${UG_Degree_selection_locator}
       Set Focus To Element    ${UG_Degree_sel_dropdown_locator}
       Input Text    ${UG_Degree_search_locator}     ${UG_Degree_search_Values}
       Wait Until Element Is Visible    ${UG_Wait}
       Wait Until Element Is Visible    ${UG_Degree_options}
       Set Focus To Element    ${UG_Degree_options}
       Click Element    ${UG_Degree_options}
       Click Element    ${UG_Specilization_locator}
       Input Text    ${UG_Degree_search_locator}   ${UG_Specilization_search_value}
       Click Element    ${UG_Degree_specilized_options}
       Input Text    ${UG_CGPA_locator}    ${UG_CGPA_value}
       Input Text    ${UG_College_Name_locator}    ${UG_College_Name}
       Input Text    ${UG_university_name_locator}    ${UG_university_name}
       Click Element    ${UG_Course_Attendent_locator}
       Click Element    ${UG_Course_Attendent_value}
       Capture Page Screenshot
       UG_Education_Details
       Select UG_Datepicker MonthYear_from_date
       Select UG_Datepicker MonthYear_To_date
       Select UG_Datepicker MonthYear_yearofpassing
       UG_Consolidated Marksheet
       UG_Provisional
       UG_Degree/Course certificate
       UG_Address_Details

Select UG_Datepicker MonthYear_from_date
         Click Element    ${UG_fromdate_locator}
     FOR  ${index}  IN RANGE  ${UG_max_iterations}
        ${current_year}  Get Text  ${UG_current_year_text}
        Exit For Loop If  '${UG_expected_Month_from_Year}' == '${current_year}'
        Click Element   ${UG_previous_switch}
    END
        Click Element       ${UG_month_locator}

Select UG_Datepicker MonthYear_To_date
    Click Element    ${UG_To_locator}
    FOR  ${index}  IN RANGE  ${UG_max_iterations}
        ${current_year}  Get Text  ${UG_current_year_text}
        Exit For Loop If  '${UG_expected_Month_To_Year}' == '${current_year}'
        Click Element   ${UG_previous_switch}
    END
        Click Element       ${UG_month_locator}

Select UG_Datepicker MonthYear_yearofpassing
    Click Element   ${UG_year_of_passing_locator}
    FOR  ${index}  IN RANGE  ${max_iterations}
        ${is_year_visible}  Run Keyword And Return Status  Element Should Be Visible  ${UG_Month_year_of_passing_target}
        IF  ${is_year_visible}
            Click Element    ${UG_Month_year_of_passing_target}
            Exit For Loop
        ELSE
            Click Element    ${UG_previous_switch_year_of_passing}
        END
    END
UG_Consolidated Marksheet
        Wait Until Element Is Visible   ${UG_consoldidate_Marksheet_locator}
        Set Focus To Element   ${UG_consoldidate_Marksheet_locator}
        Choose File    ${UG_consoldidate_Marksheet_locator}    ${UG_consoldidate_Marksheet}

UG_Provisional
        Wait Until Element Is Visible   ${UG_provisional_Marksheet_locator}
        Set Focus To Element   ${UG_provisional_Marksheet_locator}
        Choose File    ${UG_provisional_Marksheet_locator}      ${UG_provisional_Marksheet}

 UG_Degree/Course certificate
        Wait Until Element Is Visible   ${UG_course_completion_locator}
        Set Focus To Element   ${UG_course_completion_locator}
        Choose File    ${UG_course_completion_locator}       ${UG_course_completion}
UG_Address_Details
        Set Focus To Element    ${UG_Add_line1_locator}
        Input Text    ${UG_Add_line1_locator}     ${SSLC_Add_line1_input_value}
        Input Text    ${UG_Add_line2_locator}     ${SSLC_Add_line2_input_value}
        Input Text    ${UG_Add_zipcode_locator}    ${SSLC_Add_zipcode_input_value}
        Set Focus To Element   ${UG_Add_City_locator}
        Input Text    ${UG_primary_Education_Email_locator}     ${UG_primary_Education_Email_value}
        Click Element    ${UG_School_MobileNum_locator}
        Press Key    ${UG_School_MobileNum_locator}     ${UG_School_MobileNum_value}
        Sleep    2s
        Set Focus To Element   ${UG_save_focus}
        Click Element    ${UG_save_button}
        Set Focus To Element    ${Eductaion_next_button}
        Click Element    ${Eductaion_next_button}
###########################################
#       EXPERIENCE COMPANY1               #
###########################################


Employee_Experience
#        Set Focus To Element  ${Experience_tab_focus}
#        Click Element    ${Experience_tab_locator}
# IF FREASHER NEED TO SET YES
#        Set Focus To Element    ${Experience_yes_radio}
#        Click Element    ${Experience_yes_radio}
        Set Focus To Element    ${Experience_No_radio}
        Click Element    ${Experience_No_radio}
        Click Element    ${Add_experience_locator}
        Input Text    ${EXP_Organisation_locator}    ${EXP_Organisation_Value}
        Input Text    ${EXP_Job_title_locator}    ${EXP_Job_title_value}
        Input Text    ${EXP_Employee_ID_locator}    ${EXP_Employee_ID_Value}
        Select EXP_Employee_Datepicker MonthYear_Start_date
        Select EXP_Employee_Datepicker MonthYear_End_date
        Input Text   ${EXP_Reason_For_Leaving_locator}    ${EXP_Reason_For_leaving_Value}
        EXP_Offer_letter
        EXP_Employee_status
        EXP_Employee_Company_Address
        EXP_Employee_Company_supervisor_info
        EXP_Employee_Company_HR_info
        Sleep    10s


Select EXP_Employee_Datepicker MonthYear_Start_date
         Click Element    ${EXP_Employee_Startdate_locator}
         Click Element    ${EXP_Employee_startdate_current_yearlocator}
     FOR  ${index}  IN RANGE  ${EXP_max_iterations}
        ${current_year}  Get Text  ${EXP_current_start_year_text}
        Exit For Loop If  '${EXP_expected_Month_from_Year}' == '${current_year}'
        Click Element   ${EXP_previous_switch}
    END
        Wait Until Element Is Visible     ${EXP_month_locator}
        Click Element   ${EXP_month_locator}
        Wait Until Element Is Visible    ${EXP_start_date_locator}
        Click Element    ${EXP_start_date_locator}

Select EXP_Employee_Datepicker MonthYear_End_date
         Click Element    ${EXP_Employee_End_date_locator}
         Click Element    ${EXP_Employee_End_date_current_yearlocator}
     FOR  ${index}  IN RANGE  ${EXP_max_iterations}
        ${current_year}  Get Text  ${EXP_current_End_year_text}
        Exit For Loop If  '${EXP_End_expected_Month_from_Year}' == '${current_year}'
        Click Element   ${EXP_previous_switch}
    END
        Wait Until Element Is Visible     ${EXP_month_locator}
        Click Element   ${EXP_End_month_locator}
        Wait Until Element Is Visible    ${EXP_End_date_locator}
        Click Element    ${EXP_End_date_locator}

EXP_Offer_letter
        Mouse Down    ${EXP_file_are_focus}
        Set Focus To Element   ${EXP_file_are_focus}
        Choose File   ${EXP_Offer_latter_File_locator}    ${EXP_Offer_latter_File}
        Choose File   ${EXP_service_letter_File_locator}   ${EXP_service_latter_File}
        Choose File    ${EXP_Payslip_locator}   ${EXP_Payslip1_file1}
EXP_Employee_status
        Scroll Element Into View    ${EXP_Employee_status_expand_locator}
        Click Element    ${EXP_Employee_status_expand_locator}
        Scroll Element Into View   ${EXP_Company_address_informatiom}
        Set Focus To Element    ${EXP_Employee_fulltime_radio_select_locator}
        Click Element    ${EXP_Employee_fulltime_radio_select_locator}
        Click Element    ${EXP_Company_address_informatiom_locator}
EXP_Employee_Company_Address
        Scroll Element Into View     ${EXP_Footer_focus_locator}
        Set Focus To Element    ${EXP_Add_Line1_locator}
        Input Text    ${EXP_Add_Line1_locator}    ${EXP_Add_Line1_Value}
        Input Text    ${EXP_Add_Line2_locator}    ${EXP_Add_Line2_Value}
        Input Text    ${EXP_Add_Zipcode_locator}  ${EXP_Add_Zipcode_Value}
        Click Element    ${EXP_Add_City_locator}
EXP_Employee_Company_supervisor_info
        Click Button    ${EXP_Expand_Sup_info_locator}
        Input Text    ${EXP_Supervisor_Name_locator}    ${EXP_Supervisor_Name_Value}
        Input Text    ${EXP_Supervisor_Email_locator}    ${EXP_Supervisor_Email_Value}
        Click Element    ${EXP_Supervisor_MobileNum_locator}
        Press Key    ${EXP_Supervisor_MobileNum_locator}     ${EXP_Supervisor_MobileNum_Value}
EXP_Employee_Company_HR_info
        Input Text    ${EXP_HR_Name_locator}    ${EXP_HR_Name_Value}
        Input Text    ${EXP_HR_Email_locator}    ${EXP_HR_Email_Value}
        Click Element    ${EXP_HR_MobileNum_locator}
        Press Key    ${EXP_HR_MobileNum_locator}     ${EXP_HR_MobileNum_Value}
        Set Focus To Element    ${EXP_Footer_focus_locator}
        Click Element    ${EXP_Save_locator} 
        Click Element    ${EXP_Next_locator}
###########################################
#       ID INFORMATION                     #
###########################################


ID_Information
        Sleep    5s
        PAN_Card
        Driving_licence

PAN_Card
      Click Element    ${ID_Information_tab_locator}
     Click Element    ${ID_PANcard_upload_locator}
     Wait Until Element Is Visible    ${ID_PANcard_File_focus}
     Set Focus To Element   ${ID_PANcard_File_focus}
     Choose File   ${ID_PANcard_File_locator}  ${ID_PANcard_File}
     Input Text    ${ID_PANCard_Number_locator}    ${ID_PANCard_Number_Value}
     Input Text    ${ID_PANCard_Re_Number_locator}    ${ID_PANCard_Number_Value}
     Input Text    ${ID_PANcard_Name_locator}    ${ID_PANcard_Name_Value}
     Set Focus To Element    ${ID_PANcard_Verify_focus}
     Click Element    ${ID_PANcard_Verify_locator}

Driving_licence
    Set Focus To Element    ${ID_Driving_licence_upload_focus}
    Click Element    ${ID_Driving_licence_upload_locator}
    Wait Until Element Is Visible   ${ID_Driving_File_focus}
    Set Focus To Element    ${ID_Driving_File_focus}
    Choose File    ${ID_Driving_File_locator}     ${ID_Driving_File}
    Input Text    ${ID_Driving_Number_locator}    ${ID_Driving_Number_Value}
    Input Text    ${ID_Driving_Re_Number_locator}    ${ID_Driving_Number_Value}
    Sleep    20S
    Input Text    ${ID_Driving_Name_locator}    ${ID_Driving_Name_Value}
    Sleep    20S
    Set Focus To Element    ${ID_Driving_Verify_focus}
    Click Element    ${ID_Driving_Verify_locator}
    Click Element    ${ID_Footer_focus} 
    Click Element    ${ID_Next_locator}
        ################################## SUMMARY #######################################
Summary
    Set Focus To Element    ${Declaration_focus}
    Wait Until Element Is Visible    ${Declaration_focus}
    Set Focus To Element    ${Declaration_Yes}
    Click Element    ${Declaration_Yes}
    Set Focus To Element    ${Decleration_signature_focus}
    Input Text    ${Decleration_signature_locator}  ${Decleration_signature_Value}
    Wait Until Element Is Visible    ${Decleration_Conset_focus}
    Set Focus To Element    ${Decleration_Conset_focus}
    Click Element    ${Declaration_conset_save}

