*** Settings ***
Resource    ${CURDIR}/../../resources/imports.robot

*** Keywords ***
Get user list
    [Arguments]    ${page}=${None}    ${per_page}=${None}    ${headers}=${None}    ${expected_status}=200
    ${default_headers}    Create Dictionary    Content-Type=application/json; charset=utf-8    x-api-key=${reqres_x_api_key}
    ${query_params}    Create Dictionary
    Run Keyword If    '${page}' != '${None}'    Set To Dictionary    ${query_params}    page=${page}
    Run Keyword If    '${per_page}' != '${None}'    Set To Dictionary    ${query_params}    per_page=${per_page}
    ${headers}    Set Variable If    ${headers} is None    ${default_headers}    ${headers}
    common_keywords.Create API Session    user_session    ${reqres_base_url}
    ${response}    common_keywords.Get API Request    user_session    /api/users    params=${query_params}    headers=${headers}    expected_status=${expected_status}
    RETURN    ${response}

Get user by id
    [Arguments]    ${user_id}    ${expected_status}=200
    ${headers}    Create Dictionary    Content-Type=application/json; charset=utf-8    x-api-key=${reqres_x_api_key}
    common_keywords.Create API Session    user_session    ${reqres_base_url}
    ${response}    common_keywords.Get API Request    user_session    /api/users/${user_id}    headers=${headers}    expected_status=${expected_status}
    RETURN    ${response}

Post create user
    [Arguments]    ${name}=${None}    ${job}=${None}    ${headers}=${None}    ${expected_status}=200
    ${default_headers}    Create Dictionary    Content-Type=application/json; charset=utf-8    x-api-key=${reqres_x_api_key}
    ${query_params}    Create Dictionary
    Run Keyword If    '${name}' != '${None}'    Set To Dictionary    ${query_params}    name=${name}
    Run Keyword If    '${job}' != '${None}'    Set To Dictionary    ${query_params}    job=${job}
    ${headers}    Set Variable If    ${headers} is None    ${default_headers}    ${headers}
    common_keywords.Create API Session    user_session    ${reqres_base_url}
    ${response}    common_keywords.Post API request    user_session    /api/users    headers=${headers}    body=${query_params}    expected_status=${expected_status}
    RETURN    ${response}

Put update user details
    [Arguments]    ${user_id}    ${name}=${None}    ${job}=${None}    ${headers}=${None}    ${expected_status}=200
    ${default_headers}    Create Dictionary    Content-Type=application/json; charset=utf-8    x-api-key=${reqres_x_api_key}
    ${query_params}    Create Dictionary
    Run Keyword If    '${name}' != '${None}'    Set To Dictionary    ${query_params}    name=${name}
    Run Keyword If    '${job}' != '${None}'    Set To Dictionary    ${query_params}    job=${job}
    ${headers}    Set Variable If    ${headers} is None    ${default_headers}    ${headers}
    common_keywords.Create API Session    user_session    ${reqres_base_url}
    ${response}    common_keywords.Put API request    user_session    /api/users/${user_id}    headers=${headers}    body=${query_params}    expected_status=${expected_status}
    RETURN    ${response}

Patch update user details
    [Arguments]    ${user_id}    ${name}=${None}    ${job}=${None}    ${headers}=${None}    ${expected_status}=200
    ${default_headers}    Create Dictionary    Content-Type=application/json; charset=utf-8    x-api-key=${reqres_x_api_key}
    ${query_params}    Create Dictionary
    Run Keyword If    '${name}' != '${None}'    Set To Dictionary    ${query_params}    name=${name}
    Run Keyword If    '${job}' != '${None}'    Set To Dictionary    ${query_params}    job=${job}
    ${headers}    Set Variable If    ${headers} is None    ${default_headers}    ${headers}
    common_keywords.Create API Session    user_session    ${reqres_base_url}
    ${response}    common_keywords.Patch API request    user_session    /api/users/${user_id}    headers=${headers}    body=${query_params}    expected_status=${expected_status}
    RETURN    ${response}