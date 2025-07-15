*** Settings ***
Resource    ${CURDIR}/../../resources/imports.robot

*** Keywords ***
Verify user list response structure
    [Documentation]    Verify top-level structure of user list response.
    [Arguments]    ${user_list}
    ${user_list}    Set Variable    ${user_list.json()}
    ${data_list}    Get From Dictionary    ${user_list}    data
    ${support_dict}    Get From Dictionary    ${user_list}    support
    common_keywords.Verify response json has key    ${user_list}    page
    common_keywords.Verify response json has key    ${user_list}    per_page
    common_keywords.Verify response json has key    ${user_list}    total
    common_keywords.Verify response json has key    ${user_list}    total_pages
    common_keywords.Verify response json has key    ${user_list}    data
    common_keywords.Verify response json has key    ${user_list}    support
    common_keywords.Verify response value is integer    ${user_list}    page
    common_keywords.Verify response value is integer    ${user_list}    per_page
    common_keywords.Verify response value is integer    ${user_list}    total
    common_keywords.Verify response value is integer    ${user_list}    total_pages
    common_keywords.Verify response value is list    ${data_list}    data
    common_keywords.Verify response value is dictionary    ${support_dict}    support

Verify user list pagination metadata
    [Arguments]    ${user_list}    ${expected_page}    ${expected_per_page}    ${expected_total}    ${expected_total_pages}
    ${user_list}    Set Variable    ${user_list.json()}
    common_keywords.Verify response contains key value    ${user_list}    page           ${expected_page}
    common_keywords.Verify response contains key value    ${user_list}    per_page       ${expected_per_page}
    common_keywords.Verify response contains key value    ${user_list}    total          ${expected_total}
    common_keywords.Verify response contains key value    ${user_list}    total_pages    ${expected_total_pages}

Verify user data list content
    [Arguments]    ${user_list}    ${expected_data_count}
    ${data_list}    Get From Dictionary    ${user_list.json()}    data
    ${data_count}    Get Length    ${data_list}
    Should Be Equal    ${data_count}    ${expected_data_count}    msg=Incorrect 'data_count' value. Expected ${expected_data_count}, but got ${data_count}. Response data list: ${data_list}
    FOR    ${user}    IN    @{data_list}
        common_keywords.Verify response json has key    ${user}    id
        common_keywords.Verify response json has key    ${user}    email
        common_keywords.Verify response json has key    ${user}    first_name
        common_keywords.Verify response json has key    ${user}    last_name
        common_keywords.Verify response json has key    ${user}    avatar
        common_keywords.Verify response value is integer    ${user}    id
        common_keywords.Verify response value is string    ${user}    email
        common_keywords.Verify response value is email    ${user}    email
    END

Verify user list support section
    [Arguments]    ${user_details}    ${expected_support_url}    ${expected_support_text}
    ${support}    Get From Dictionary    ${user_details.json()}    support
    common_keywords.Verify response json has key    ${support}    url
    common_keywords.Verify response json has key    ${support}    text
    common_keywords.Verify response value is string    ${support}    url
    common_keywords.Verify response value is string    ${support}    text
    common_keywords.Verify response contains key value    ${support}    url    ${expected_support_url}
    common_keywords.Verify response contains key value    ${support}    text    ${expected_support_text}

Verify when error 401
    [Arguments]    ${response}    ${expected_error}    ${expected_how_to_get_one}
    ${response}    Set Variable   ${response.json()}
    common_keywords.Verify response json has key    ${response}    error
    common_keywords.Verify response json has key    ${response}    how_to_get_one
    common_keywords.Verify response value is string    ${response}    error
    common_keywords.Verify response value is string    ${response}    how_to_get_one
    common_keywords.Verify response contains key value    ${response}    error    ${expected_error}
    common_keywords.Verify response contains key value    ${response}    how_to_get_one    ${expected_how_to_get_one}

Verify user id response structure
    [Documentation]    Verify top-level structure of user id response.
    [Arguments]    ${user_details}
    ${user_details}    Set Variable    ${user_details.json()}
    ${data_dict}    Get From Dictionary    ${user_details}    data
    ${support_dict}    Get From Dictionary    ${user_details}    support
    common_keywords.Verify response json has key    ${user_details}    data
    common_keywords.Verify response json has key    ${user_details}    support
    common_keywords.Verify response value is dictionary    ${data_dict}    data
    common_keywords.Verify response value is dictionary    ${support_dict}    support

Verify user data details content
    [Arguments]    ${user_details}    ${expected_user_id}    ${expected_user_email}    ${expected_user_first_name}    ${expected_user_last_name}    ${expected_user_avatar}
    ${data_details}    Get From Dictionary    ${user_details.json()}    data
    common_keywords.Verify response json has key    ${data_details}    id
    common_keywords.Verify response json has key    ${data_details}    email
    common_keywords.Verify response json has key    ${data_details}    first_name
    common_keywords.Verify response json has key    ${data_details}    last_name
    common_keywords.Verify response json has key    ${data_details}    avatar
    common_keywords.Verify response value is integer    ${data_details}    id
    common_keywords.Verify response value is string    ${data_details}    email
    common_keywords.Verify response value is email    ${data_details}    email
    common_keywords.Verify response contains key value    ${data_details}    id    ${expected_user_id}
    common_keywords.Verify response contains key value    ${data_details}    email    ${expected_user_email}
    common_keywords.Verify response contains key value    ${data_details}    first_name    ${expected_user_first_name}
    common_keywords.Verify response contains key value    ${data_details}    last_name    ${expected_user_last_name}
    common_keywords.Verify response contains key value    ${data_details}    avatar    ${expected_user_avatar}

Verify user id support section
    [Arguments]    ${user_detils}    ${expected_support_url}    ${expected_support_text}
    ${support}    Get From Dictionary    ${user_detils.json()}    support
    common_keywords.Verify response json has key    ${support}    url
    common_keywords.Verify response json has key    ${support}    text
    common_keywords.Verify response value is string    ${support}    url
    common_keywords.Verify response value is string    ${support}    text
    common_keywords.Verify response contains key value    ${support}    url    ${expected_support_url}
    common_keywords.Verify response contains key value    ${support}    text    ${expected_support_text}
