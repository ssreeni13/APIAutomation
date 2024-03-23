*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    create session  mysession    ${base_url}
    ${response}=  get request mysession    /photos

    log to console  ${response.headers}

    ${contentTypeValue} = get from dictionary ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}   application/json;  charset=utf-8

    ${contentEncodeValue} = get from dictionary ${response.headers}  Content-Encoding
    should be equal  ${contentEncodeValue}   gzip

TestCookies
    create session  mysession    ${base_url}
    ${response}=  get request mysession    /photos

    log to console  ${response.cookies}  #Display all the cookies from response

    ${cookieValue} =   get from dictionary ${response.cookies}  __cfduid
    log to console  ${cookieValue}   #Display specify cookie value
