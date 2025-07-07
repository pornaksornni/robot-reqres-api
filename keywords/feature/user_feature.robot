*** Settings ***
Resource    ${CURDIR}/../../resources/imports.robot

*** Keywords ***
Verify user list response structure
    [Documentation]    Verify top-level structure of user list response.
    [Arguments]    ${user_list}
    ${user_list}    Set Variable    ${user_list.json()}
    Dictionary Should Contain Key    ${user_list}    page         msg=Response is missing 'page' key.
    Dictionary Should Contain Key    ${user_list}    per_page     msg=Response is missing 'per_page' key.
    Dictionary Should Contain Key    ${user_list}    total        msg=Response is missing 'total' key.
    Dictionary Should Contain Key    ${user_list}    total_pages  msg=Response is missing 'total_pages' key.
    Dictionary Should Contain Key    ${user_list}    data         msg=Response is missing 'data' key.
    Dictionary Should Contain Key    ${user_list}    support      msg=Response is missing 'support' key.
    Should Be True    isinstance(${user_list['page']}, int)           msg='page' is not an integer.
    Should Be True    isinstance(${user_list['per_page']}, int)       msg='per_page' is not an integer.
    Should Be True    isinstance(${user_list['total']}, int)          msg='total' is not an integer.
    Should Be True    isinstance(${user_list['total_pages']}, int)    msg='total_pages' is not an integer.
    ${data_list}       Get From Dictionary    ${user_list}    data
    ${support_dict}    Get From Dictionary    ${user_list}    support
    Should Be True    isinstance(${data_list}, list)       msg='data' is not a list.
    Should Be True    isinstance(${support_dict}, dict)    msg='support' is not a dictionary.

Verify user list pagination metadata
    [Arguments]    ${user_list}    ${expected_page}    ${expected_per_page}    ${expected_total}    ${expected_total_pages}
    ${user_list}    Set Variable    ${user_list.json()}
    Should Be Equal    ${user_list['page']}    ${expected_page}    msg=Incorrect 'page' value.
    Should Be Equal    ${user_list['per_page']}    ${expected_per_page}    msg=Incorrect 'per_page' value.
    Should Be Equal    ${user_list['total']}    ${expected_total}    msg=Incorrect 'total' value.
    Should Be Equal    ${user_list['total_pages']}    ${expected_total_pages}    msg=Incorrect 'total_pages' value.

Verify User Data List Content
    [Arguments]    ${user_list}    ${expected_data_count}
    ${user_list}    Set Variable    ${user_list.json()}
    ${data_list}       Get From Dictionary    ${user_list}    data
    ${data_count}    Get Length    ${data_list}
    Should Be Equal    ${data_count}    ${expected_data_count}    msg=Incorrect 'data_count' value. Expected ${expected_data_count}, but got ${data_count}. Response data list: ${data_list}
    FOR    ${user}    IN    @{data_list}
        Dictionary Should Contain Key    ${user}    id
        Dictionary Should Contain Key    ${user}    email
        Dictionary Should Contain Key    ${user}    first_name
        Dictionary Should Contain Key    ${user}    last_name
        Dictionary Should Contain Key    ${user}    avatar
        Should Be True    isinstance(${user['id']}, int)    msg=User ID is not an integer.
        Should Be True    isinstance('${user['email']}', str)    msg=User email is not a string.
        Should Match Regexp    ${user['email']}    ^\\S+@\\S+\\.\\S+$    msg=Invalid email format for user: ${user['email']}
    END

Verify User List Support Section
    [Arguments]    ${user_list}    ${expected_support_url}    ${expected_support_text}
    ${user_list}    Set Variable    ${user_list.json()}
    ${support}       Get From Dictionary    ${user_list}    support
    Dictionary Should Contain Key    ${support}    url         msg=Response is missing 'url' key.
    Dictionary Should Contain Key    ${support}    text      msg=Response is missing 'text' key.
    Should Be True    isinstance('${support['url']}', str)           msg='url' is not an string.
    Should Be True    isinstance('${support['text']}', str)       msg='url' is not an string.
    Should Be Equal    ${support['url']}    ${expected_support_url}    msg=Incorrect 'support url' value.
    Should Be Equal    ${support['text']}    ${expected_support_text}    msg=Incorrect 'support text' value.