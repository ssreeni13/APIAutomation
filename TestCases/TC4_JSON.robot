*** Settings ***
Library    JSONLibrary
Library   os
Library    Collections


*** Test Cases ***
Testcase1:
     ${json_obj}=   load json from file    C:/SeleniumPractice/jsondata/jsondata.json

     ${name_value}= get value from json   ${json_obj}    $.firstName
     should be equal  ${name_value[0]}    John

     ${street_value}= get value from json   ${json_obj}    $.address.streetAddress
     should be equal  ${street_value[0]}    21 2nd Street

     ${faxnumb_value}= get value from json   ${json_obj}    $.phoneNumber[1].number
     log to console  ${faxnumb_value[0]}
     should be equal  ${faxnumb_value[0]}    646 555-4567