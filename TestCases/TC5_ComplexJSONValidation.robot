*** Settings ***
Library    JSONLibrary
Library   os
Library    Collections
Library   RequestsLibrary

*** Variables ***
${base_url}    https://restcountries.eu

*** Test Cases ***
Get_countryInfo
    create session mysession    ${base_url}
    ${response}=  get request mysession    /rest/v2/alpha/IN

    ${json_object}=   to json  ${response.content}

    #Single data validation
    ${country_Name}= get value from json   ${json_object}    $.name
    log to console  ${country_Name[0]}
    should be equal  ${country_Name[0]}    India

    #Single data validation in array
    ${border}= get value from json   ${json_object}    $.borders[0]
    log to console  ${border[0]}
    should be equal  ${border[0]}    AFG

    #Multiple data validation in array
    ${borders}= get value from json   ${json_object}    $.borders
    log to console  ${borders[0]}
    should contain any  ${borders[0]}    AFG  BGD  BTN  MMR  ABC
    should not contain any  ${borders[0]}   abc  xyz