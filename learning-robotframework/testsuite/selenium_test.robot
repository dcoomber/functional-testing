*** Settings ***
Documentation   Selenium test using Robot Framework
Library         SeleniumLibrary

*** Variables ***
${base_url}     http://www.google.co.za

*** Test Cases ***
First Selenium Test
    Open Browser                ${base_url}     googlechrome
    Set Browser Implicit Wait   5
    Input Text                  name=q              RobotFramework for dummies
    Press Keys                  name=q              ENTER
    Sleep                       2
    Close Browser
    Log                         Test complete
