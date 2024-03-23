*** Settings ***
Library    XML
Library   OS
Library    Collections

*** Test Cases ***
TestCase1
     ${xml_obj}=    parse xml     C:/SeleniumPractice/xmldata/employees.xml

     #Validations
     #Vali- Check the Single Element Value
     #Approach1
     ${emp_firstname}=    get element text    ${xml_obj}   .//employee[1]/firstname
     should be equal  ${emp_firstname}    John

     #Approach2
     ${emp_firstname}=    get element   ${xml_obj}   .//employee[1]/firstname
     should be equal  ${emp_firstname.text}    John

     #Approach3
     element text should be equal  ${xml_obj}   John   .//employee[1]/firstname

     #Val2 - Check Number of Elements
     ${count}=    get element count    ${xml_obj}   .//employee
     should be equal as integers  ${count}    6

     #Val3 - Check Attribute Presence
     element attribute should be   ${xml_obj}  id  be129  .//employee[1]
     element attribute should be   ${xml_obj}  id  be135  .//employee[6]

     #Val4 - Check Values of Child Elements
     ${child_Elements}=    get child elements    ${xml_obj}   .//employee[1]
     should not be empty  ${child_Elements}

     ${fname}=   get element text  ${child_Elements[0]}
     ${lname}=   get element text  ${child_Elements[1]}
     ${title}=   get element text  ${child_Elements[2]}

     log to console  ${fname}
     log to console  ${lname}
     log to console  ${title}

     should be equal  ${fname}  John
     should be equal  ${lname}   Doe
     should be equal  ${title}   Engineer