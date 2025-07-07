*** Keywords ***
Create API Session
    [Arguments]    ${session_alias}    ${base_url}
    Create Session    ${session_alias}    ${base_url}

Get API Request
    [Arguments]    ${session_alias}    ${endpoint}    ${params}=${NONE}    ${headers}=${NONE}
    ${response}    GET On Session    ${session_alias}    ${endpoint}    params=${params}    headers=${headers}
    RETURN    ${response}

Verify status code should be 200
    [Arguments]    ${response}
    Should Be Equal    ${response.status_code}   ${200}    msg=Failed to get user list. Expected status code ${200}, but got ${response.status_code}. Response: ${response.text}