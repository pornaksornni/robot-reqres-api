*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/get_users/user_id_negative.yaml

*** Test Cases ***
Scenario1: Users - Get user by id - User not found - Expected 404 not found
    [Tags]    api    get    user_id    nagative
    ${user_details}    user_api_keyword.Get user by id    user_id=${scenario_1['request_params']['user_id']}
    ...                                                   expected_status=${scenario_1['expected_response']['status_code']}
    common_keywords.Verify status code    ${user_details}    ${scenario_1['expected_response']['status_code']}
    common_keywords.Verify response body is empty JSON    ${user_details}