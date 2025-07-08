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
    common_keywords.Create API Session    get_user_session    ${reqres_base_url}
    ${response}    common_keywords.Get API Request    get_user_session    /api/users    params=${query_params}    headers=${headers}    expected_status=${expected_status}
    RETURN    ${response}