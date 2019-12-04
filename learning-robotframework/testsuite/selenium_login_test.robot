*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com
@{CREDENTIALS}  Admin   admin123
&{LOGINDATA}    username=Admin  password=admin123

*** Test Cases ***
LoginTest
    [Documentation]   Sample login test (from the Robot Framework Udemy course)
    [Documentation]   Scalar:       ${VARNAME}  Value
    [Documentation]   List:         @{VARNAME}  Value1  Value2
    [Documentation]   Dictionary:   &{VARNAME}  Key1=Value1     Key2=Value2
    Open Browser      ${URL}            chrome
    Set Browser Implicit Wait   5
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button      id=btnLogin
#    Click Element     id=welcome
#    Click Element     name=Logout
    Go To             ${URL}/index.php/auth/logout
    Close Browser
    Log               Test complete
    Log               This test was executed by %{LOGNAME}