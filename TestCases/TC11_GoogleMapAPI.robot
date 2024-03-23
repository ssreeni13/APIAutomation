*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://maps.googleapis.com
${req_uri}    /maps/api/place/nearbysearch/json?

*** Test Cases ***
GoogleMapPlacesAPITC
    create session  mysession    ${base_url}
    ${params}   create dictionary  Location=33.8670522,151.1957362    radius=500   types=food   name=harbour   key=AIzaSyDfF7_uf-clJxM9SqZcoipto
    ${response}=  get request mysession   ${req_uri}    params=${params}

    log to console  ${response.status_code}
    log to console  ${response.content}

