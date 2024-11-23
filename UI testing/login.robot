*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      http://45.136.236.146:8081/
${USERNAME}    u6587106
${EMAIL}       sitthida.sri@student.mahidol.edu
${PASSWORD}    muict555
${WRONG_USERNAME}    mu
${WRONG_EMAIL}       testuser.com
${WRONG_PASSWORD}    ict555
${SCREENSHOT_DIR_login_Pass_username}     ./Screenshots/login_Pass_username/
${SCREENSHOT_DIR_login_Pass_email}        ./Screenshots/login_Pass_email/
${SCREENSHOT_DIR_login_Fail}              ./Screenshots/login_Fail/

*** Test Cases ***

Test Successful Login with username
    Open Browser    ${URL}    Chrome
    Click Element   xpath=//button[span[text()='Log In']]
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Pass_username}1_Click_Login.png
    Wait Until Element Is Visible    //input[@name='identification']    timeout=5
    Input Text    //input[@name='identification']    ${USERNAME}
    Input Text      name=password          ${PASSWORD}
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Pass_username}2_Login_Entered.png
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'Dropdown-toggle') and contains(@class, 'Button--user')]    timeout=10
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Pass_username}3_Login_Successful.png
    Close Browser
    
Test Successful Login with Email
    Open Browser    ${URL}    Chrome
    Click Element   xpath=//button[span[text()='Log In']]
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Pass_email}1_Click_Login.png
    Wait Until Element Is Visible    //input[@name='identification']    timeout=5
    Input Text    //input[@name='identification']    ${EMAIL}
    Input Text      name=password          ${PASSWORD}
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Pass_email}2_Login_Entered.png
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'Dropdown-toggle') and contains(@class, 'Button--user')]    timeout=10
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Pass_email}3_Login_Successful.png
    Close Browser

Test Failed Login
    Open Browser    ${URL}    Chrome 
    Click Element   xpath=//button[span[text()='Log In']]
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Fail}1_Click_Login.png
    Wait Until Element Is Visible    //input[@name='identification']    timeout=5
    Input Text    //input[@name='identification']    ${WRONG_USERNAME}
    Input Text      name=password          ${WRONG_PASSWORD}
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Fail}2_Login_Entered.png
    Click Button    //button[@type='submit']
    Wait Until Element Is Visible    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    timeout=5
    Element Should Contain    xpath=//div[contains(@class,'Modal-alert')]//span[contains(@class,'Alert-body')]    Your login details were incorrect.
    Capture Page Screenshot    ${SCREENSHOT_DIR_login_Fail}3_Login_Fail.png
    Close Browser