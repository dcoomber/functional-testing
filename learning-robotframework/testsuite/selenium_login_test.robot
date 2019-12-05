*** Settings ***
Library         SeleniumLibrary

Suite Setup      Log     Test suite setup
Suite Teardown   Log     Test suite teardown
Test Setup       Log     Test setup
Test Teardown    Log     Test teardown

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com
@{CREDENTIALS}  Admin   admin123
&{LOGINDATA}    username=Admin  password=admin123

*** Test Cases ***
LoginTest
    # Sample login test (from the Robot Framework Udemy course)
    # Scalar:       ${VARNAME}  Value
    # List:         @{VARNAME}  Value1  Value2
    # Dictionary:   &{VARNAME}  Key1=Value1     Key2=Value2
    Open Browser      ${URL}            chrome
    Set Browser Implicit Wait   5
    Login
    Logout
    Close Browser
    Log               Test complete
    Log               This test was executed by %{LOGNAME}

*** Keywords ***
Login
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button      id=btnLogin

Logout
#    Click Element     id=welcome
#    Click Element     name=Logout
    Go To             ${URL}/index.php/auth/logout