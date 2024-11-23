*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      http://45.136.236.146:8081/
${NEW_USERNAME}    u6587103
${NEW_EMAIL}   supisara.tho@student.mahidol.edu
${USERNAME}    u6587106
${EMAIL}       sitthida.sri@student.mahidol.edu
${PASSWORD}    muict555
${WRONG_USERNAME}    mu
${WRONG_PASSWORD}    ict555
${SCREENSHOT_DIR_signup_Pass}          ./Screenshots/signup_Pass/
${SCREENSHOT_DIR_signup_Fail}          ./Screenshots/signup_Fail/
${SCREENSHOT_DIR_signup_Fail_Already_been_taken}          ./Screenshots/signup_Fail_Already_been_taken/


*** Test Cases ***

Test Successful Sign Up
    Open Browser    ${URL}    Chrome
    Click Element   xpath=//button[span[text()='Sign Up']]
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Pass}1_Click_Signup.png
    Wait Until Element Is Visible    //input[@name='username']    timeout=5
    Input Text    //input[@name='username']    ${NEW_USERNAME}
    Input Text      name=email          ${NEW_EMAIL}
    Input Text      name=password          ${PASSWORD}
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Pass}2_Signup_Entered.png
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'Dropdown-toggle') and contains(@class, 'Button--user')]    timeout=10
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Pass}3_Signup_Successful.png
    Close Browser

Test Failed Sign Up
    Open Browser    ${URL}    Chrome
    Click Element   xpath=//button[span[text()='Sign Up']]
    Wait Until Element Is Visible    //input[@name='username']    timeout=5
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Fail}1_Click_Signup.png
    Input Text    //input[@name='username']    ${WRONG_USERNAME}
    Input Text      name=email          ${EMAIL}
    Input Text      name=password          ${WRONG_PASSWORD}
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Fail}2_Signup_Entered.png
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    timeout=5
    Element Should Contain    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    The username must be at least 3 characters.
    Element Should Contain    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    The email has already been taken.
    Element Should Contain    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    The password must be at least 8 characters.
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Fail}3_Alert_least_characters.png
    Close Browser

Test Failed Sign Up Already been taken
    Open Browser    ${URL}    Chrome
    Click Element   xpath=//button[span[text()='Sign Up']]
    Wait Until Element Is Visible    //input[@name='username']    timeout=5
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Fail_Already_been_taken}1_Click_Signup.png
    Input Text    //input[@name='username']    ${USERNAME}
    Input Text      name=email          ${EMAIL}
    Input Text      name=password          ${PASSWORD}
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Fail_Already_been_taken}2_Signup_Entered.png
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    timeout=5
    Element Should Contain    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    The username has already been taken.
    Element Should Contain    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    The email has already been taken.
    Capture Page Screenshot    ${SCREENSHOT_DIR_signup_Fail_Already_been_taken}3_Alert_Already_been_taken.png
    Close Browser