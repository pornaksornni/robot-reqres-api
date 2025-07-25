*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/delete_user/delete_user_negative.yaml

*** Test Cases ***
Scenario1: Users - Delete user by id - User not found - Expected 404 not found
    [Tags]    api    delete    delete_user    nagative
    ${response}    user_api_keyword.delete user    user_id=${scenario_1['request_params']['user_id']}
    ...                                            expected_status=${scenario_1['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_1['expected_response']['status_code']}

Scenario2: Users - Delete user by id - With missing API key header - Expect 401 Unauthorized
    [Tags]    api    delete    delete_user    without_api_key_header    nagative
    ${response}    user_api_keyword.delete user    user_id=${scenario_2['request_params']['user_id']}
    ...                                            headers=${scenario_2['request_headers']}
    ...                                            expected_status=${scenario_2['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_2['expected_response']['status_code']}
    common_keywords.Verify error meaasge    ${response}    ${scenario_2['expected_response']['error_reason']}
    user_feature.Verify when error 401    response=${response}
    ...                                   expected_error=${scenario_2['expected_response']['error_message']}
    ...                                   expected_how_to_get_one=${scenario_2['expected_response']['how_to_get_one']}