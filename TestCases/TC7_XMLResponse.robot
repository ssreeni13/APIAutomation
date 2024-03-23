*** Settings ***
Library    XML
Library   OS
Library    Collections

*** Variables ***
${base_URL}    http://thomas-bayer.com

*** Test Cases ***
TestCase1
     create session mysession   ${base_URL}
     ${response}=   get request  mysession     /sqlrest/CUSTOMER/15
     ${xml_string}=   convert to string  ${response.content}
     ${xml_obj}=  parse xml   ${xml_string}

     #Check Single Element Value
     element text should be  ${xml_obj}     15   .//ID

     #Check Multiple Value
     ${child_Elements}=    get child elements    ${xml_obj}
     should not be empty  ${child_Elements}

     ${id}=   get element text  ${child_Elements[0]}
     ${fname}=   get element text  ${child_Elements[1]}
     ${lname}=   get element text  ${child_Elements[2]}
     ${street}=   get element text  ${child_Elements[3]}
     ${city}=   get element text  ${child_Elements[4]}

     should be equal  ${id}  15
     should be equal  ${fname}   Bill
     should be equal  ${lname}   Clancy
     should be equal  ${street}  319 Upland Pl.
     should be equal  ${city}   Seattle
