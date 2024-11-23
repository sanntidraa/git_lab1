*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      http://45.136.236.146:8081/
${USERNAME}    u6587106
${EMAIL}       sitthida.sri@student.mahidol.edu
${PASSWORD}    muict555
${VALID_TITLE}             Group8
${VALID_POST}              Test
${INVALID_TITLE}           ${EMPTY}
${INVALID_TITLE_LEAST3}   mu
${INVALID_POST}            ${EMPTY}
${SCREENSHOT_DIR_discussion_Pass}          ./Screenshots/discussion_Pass/
${SCREENSHOT_DIR_discussion_Fail_Invalid_All}          ./Screenshots/discussion_Fail_IncalidAll/
${SCREENSHOT_DIR_discussion_Fail_Invalid_Title_Write}          ./Screenshots/discussion_Fail_IncalidTitle_Write/
${SCREENSHOT_DIR_discussion_Fail_Title_Least3}          ./Screenshots/discussion_Fail_Title_Least3/


*** Test Cases ***

Test Successful Discussion
    Open Browser    ${URL}    Chrome
    Login To System
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Pass}1_Login_Successful.png
    Click New Discussion
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Pass}2_New_Discussion_Clicked.png
    Wait Until Element Is Visible    xpath=//span[text()='Choose Tags']    timeout=10
    Click Element   xpath=//span[contains(text(), 'Choose Tags')]
    Wait Until Element Is Visible    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]    timeout=5
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Pass}3_Tag_Selected.png
    Scroll Element Into View    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]
    Click Element    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'TagDiscussionModal-form')]    timeout=5
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Pass}4_Tag_Entered.png
    Click Button    xpath=//div[contains(@class,'TagDiscussionModal-form-submit')]//button[span[text()='OK']]
    Input Text    xpath=//li[@class='item-discussionTitle']//input[@class='FormControl']    ${VALID_TITLE}
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Pass}5_Title_Entered.png
    Input Text      xpath=//textarea[@placeholder='Write a Post...']    ${VALID_POST}
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Pass}6_Post_Entered.png
    Click Button    xpath=//button[span[contains(text(), 'Post Discussion')]]
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Pass}7_Discussion_Posted.png
    Close Browser

Test Failed Discussion Invalid All
    Open Browser    ${URL}    Chrome
    Login To System
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_All}1_Login_Successful.png
    Click New Discussion
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_All}2_New_Discussion_Clicked.png
    Input Text    xpath=//input[@placeholder='Discussion Title']    ${INVALID_TITLE}  # ไม่กรอกข้อมูล Title
    Input Text    xpath=//textarea[@placeholder='Write a Post...']    ${INVALID_POST}   # ไม่กรอกเนื้อหาในโพสต์
    Wait Until Element Is Visible    xpath=//button[span[contains(text(), 'Post Discussion')]]    timeout=5
    Scroll Element Into View         xpath=//button[span[contains(text(), 'Post Discussion')]]
    Click Button                     xpath=//button[span[contains(text(), 'Post Discussion')]]
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_All}3_Invalid_All&Post.png
    Wait Until Element Is Visible    xpath=//span[text()='Choose Tags']    timeout=10
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_All}4_Tag_Selected.png
    Close Browser

Test Failed Discussion Invalid Title and Write a Post
    Open Browser    ${URL}    Chrome
    Login To System
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_Title_Write}1_Login_Successful.png
    Click New Discussion
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_Title_Write}2_New_Discussion_Clicked.png
    Wait Until Element Is Visible    xpath=//span[text()='Choose Tags']    timeout=10
    Click Element   xpath=//span[contains(text(), 'Choose Tags')]
    Wait Until Element Is Visible    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]    timeout=5
    Scroll Element Into View    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]
    Click Element    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_Title_Write}3_Tag_Entered.png
    Click Button    xpath=//div[contains(@class,'TagDiscussionModal-form-submit')]//button[span[text()='OK']]
    Input Text    xpath=//input[@placeholder='Discussion Title']    ${INVALID_TITLE}  # ไม่กรอกข้อมูล Title
    Input Text    xpath=//textarea[@placeholder='Write a Post...']    ${INVALID_POST}   # ไม่กรอกเนื้อหาในโพสต์
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_Title_Write}4_Invalid_Title_Write&Post.png
    Click Button    xpath=//button[span[contains(text(), 'Post Discussion')]]
    Wait Until Element Is Visible    xpath=//div[@id='alerts']//span[@class='Alert-body']    timeout=5
    Element Should Contain           xpath=//div[@id='alerts']//span[@class='Alert-body']    The title field is required.
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Invalid_Title_Write}5_Alert_title_field.png
    Click Button                     xpath=//div[@id='alerts']//button[@aria-label='Dismiss alert']
    Close Browser

Test Failed Discussion Invalid Title least 3 characters.
    Open Browser    ${URL}    Chrome
    Login To System
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Title_Least3}1_Login_Successful.png
    Click New Discussion
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Title_Least3}2_New_Discussion_Clicked.png
    Wait Until Element Is Visible    xpath=//span[text()='Choose Tags']    timeout=10
    Click Element   xpath=//span[contains(text(), 'Choose Tags')]
    Wait Until Element Is Visible    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]    timeout=5
    Scroll Element Into View    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]
    Click Element    xpath=//div[contains(@class,'Modal-footer')]//ul[contains(@class,'SelectTagList')]//li[span[text()='General']]
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Title_Least3}3_Tag_Entered.png
    Click Button    xpath=//div[contains(@class,'TagDiscussionModal-form-submit')]//button[span[text()='OK']]
    Input Text    xpath=//input[@placeholder='Discussion Title']    ${INVALID_TITLE_LEAST3}
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Title_Least3}4_Title_Least3characters.png
    Click Button    xpath=//button[span[contains(text(), 'Post Discussion')]]
    Wait Until Element Is Visible    xpath=//div[@id='alerts']//span[@class='Alert-body']    timeout=5
    Element Should Contain           xpath=//div[@id='alerts']//span[@class='Alert-body']    The title must be at least 3 characters.
    Capture Page Screenshot    ${SCREENSHOT_DIR_discussion_Fail_Title_Least3}5_Alert_title_Least3characters.png
    Click Button                     xpath=//div[@id='alerts']//button[@aria-label='Dismiss alert']
    Close Browser

*** Keywords ***

Login To System
    [Arguments]  
    Click Element   xpath=//button[span[text()='Log In']]
    Wait Until Element Is Visible    //input[@name='identification']    timeout=5
    Input Text    //input[@name='identification']    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button  //button[@type='submit']

Click New Discussion
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'IndexPage-newDiscussion')]    timeout=10
    Scroll Element Into View         xpath=//button[contains(@class, 'IndexPage-newDiscussion')]
    Wait Until Element Is Enabled    xpath=//button[contains(@class, 'IndexPage-newDiscussion')]    timeout=10
    Mouse Over                       xpath=//button[contains(@class, 'IndexPage-newDiscussion')]
    Click Element                    xpath=//button[contains(@class, 'IndexPage-newDiscussion')]
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'IndexPage-newDiscussion')]    timeout=5
    Click Element                    xpath=//button[contains(@class, 'IndexPage-newDiscussion')]

