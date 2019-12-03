*** Settings ***
Documentation   Rest API test using Robot Framework
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

*** Variables ***
${base_url}         https://automationintesting.online

*** Test Cases ***
Get (REST API)
    create session                          ListBookings         ${base_url}
    ${response}=                            get request          ListBookings         /room
    Log                                     ${response.json()}
    dictionary should not contain value     ${response.json()}   101

Post (REST API)
    &{booking_dates}=               create dictionary         checkin=2019-12-19    checkout=2019-12-21
    create session                  CreateBooking             ${base_url}
    &{body}=                        create dictionary         bookingdates=&{booking_dates}     depositpaid=false       email=some@one.com      firstname=David     lastname=Coomber    phone=+12345678901  roomid=1
    ${response}=    post request    CreateBooking         /booking     data=${body}
    Log                             ${response.json()}
