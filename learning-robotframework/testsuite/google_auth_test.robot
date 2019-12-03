*** Settings ***
Documentation   Google authorisation test using Robot Framework
Library         RequestsLibrary
Library         JSONLibrary
Library         OperatingSystem
Library         Collections

*** Variables ***
${auth_url}         https://www.googleapis.com
${auth_endpoint}    oauth2/v4/token
${content_type}     application/x-www-form-urlencoded
${client_id}        %{GOOGLE_AUTH_CLIENT_ID}
${client_secret}    %{GOOGLE_AUTH_CLIENT_SECRET}
${grant_type}       refresh_token
${refresh_token}    %{GOOGLE_AUTH_REFRESH_TOKEN}

*** Test Cases ***
Google Authentication
    &{header}=          create dictionary       Content-Type=${content_type}
    &{body}=            create dictionary       client_id=${client_id}     client_secret=${client_secret}       grant_type=${grant_type}      refresh_token=${refresh_token}
    
    create session      Authenticate            ${auth_url}         ${header}
    ${response}=        post request            Authenticate        ${auth_endpoint}     data=${body}
    ${access_token}=    get from dictionary     ${response.json()}  access_token

    should be equal as strings  ${response.status_code}     200
    
    