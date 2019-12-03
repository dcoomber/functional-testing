*** Settings ***
Documentation   My First Robotframework Test
Library         SeleniumLibrary
Library         RequestsLibrary
Library         Collections

*** Variables ***
${Selenium_URL}     http://www.google.co.za
${Rest_URL}         https://automationintesting.online

*** Test Cases ***
My First Test
    Log         Hello World...

First Selenium Test
#    Open Browser                ${Selenium_URL}     googlechrome
#    Set Browser Implicit Wait   5
#    Input Text                  name=q              RobotFramework for dummies
#    Press Keys                  name=q              ENTER
#    Sleep                       2
#    Close Browser
#    Log                         Test complete

First REST Test - Get
    create session                          ListBookings         ${Rest_URL}
    ${response}=                            get request          ListBookings         /room
    dictionary should not contain value     ${response.json()}   101
    Log                                     ${response.json()}

REST Test - Post
    #create session                  AddData             ${Rest_URL}
    #&{body}=        create dictionary   first_name=Testing  middle_name=A   last_name=World     date_of_birth=12/12/1990
    #${response}=    post request     AddData         Api/studentDetails     data=&{body}
    #log to console      ${response}
