*** Keywords ***
Create API session
    [Arguments]    ${session_alias}    ${base_url}
    Create Session    ${session_alias}    ${base_url}

Get API request
    [Arguments]    ${session_alias}    ${endpoint}    ${expected_status}    ${params}=${NONE}    ${headers}=${NONE}
    ${response}    GET On Session    ${session_alias}    ${endpoint}    params=${params}    headers=${headers}    expected_status=${expected_status}
    RETURN    ${response}

Verify status code
    [Arguments]    ${response}   ${expected_status_code}
    Should Be Equal As Strings    ${response.status_code}   ${expected_status_code}    msg=Expected status code ${expected_status_code}, but got ${response.status_code}. Response: ${response.text}

Verify error meaasge
    [Arguments]    ${response}   ${error_reason}
    Should Be Equal As Strings    ${response.reason}   ${error_reason}    msg=Expected reason ${error_reason}, but got ${response.reason}. Response: ${response.text}

Verify response json has key
    [Arguments]    ${response}    ${key}
    Dictionary Should Contain Key    ${response}    ${key}    msg=Response is missing '${key}' key.

Verify response value is integer
    [Arguments]    ${response}    ${key}
    Should Be True    isinstance(${response['${key}']}, int)    msg='${key}' is not an integer.

Verify response value is string
    [Arguments]    ${response}    ${key}
    Should Be True    isinstance('${response['${key}']}', str)    msg='${key}' is not an string.

Verify response value is list
    [Arguments]    ${response}    ${key}
    Should Be True    isinstance(${response}, list)       msg='data' is not a list.

Verify response value is dictionary
    [Arguments]    ${response}    ${key}
    Should Be True    isinstance(${response}, dict)    msg='support' is not a dictionary.

Verify response contains key value
    [Arguments]    ${response}    ${key}    ${expected_value}
    Should Be Equal    ${response['${key}']}    ${expected_value}    msg=Incorrect '${key}' value.

Verify response value is email
    [Arguments]    ${response}    ${key}
    Should Match Regexp    ${response['${key}']}    ^\\S+@\\S+\\.\\S+$    msg=Invalid email format : ${response['${key}']}
