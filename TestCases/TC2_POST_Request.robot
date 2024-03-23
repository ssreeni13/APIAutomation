*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}=    http://restapi.demoqa.com

*** Test Cases ***
Put_CustomerRegistration
    create session  mysession    ${base_url}
    ${body}=  create dictionary  FirstName=Sreeni1234  LastName=Sreeni1234  UserName=Sreeni1234  Password=Sreeni1234  Email=Sreeni1234@gmail.com
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=  post request  mysession    /register  data=${body}   headers=${header}
    log to console ${response.status_code}
    log to console ${response.content}

    #VALIDATIONS
    ${status_code} = convert to string  ${response.status_code}
    should be equal  ${status_code}   200

    ${res_body} = convert to string  ${response.content}
    should contain ${res_body}   OPERATION_SUCCESS
    should contain ${res_body}   Operation completed successfully

