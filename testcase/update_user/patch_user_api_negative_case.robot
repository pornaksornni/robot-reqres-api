*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/patch_user/patch_user_negative.yaml

*** Test Cases ***
Scenario1: Users - Update user details without parameters - Expect 200 OK
    [Tags]    api_patch    update_user    without_parameter    negative
    ${response}    user_api_keyword.Patch update user details    user_id=${scenario_1['request_params']['user_id']}
    ...                                                          expected_status=${scenario_1['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_1['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}

Scenario2: Users - Update user details with non string name parameter only - Expect 200 OK
    [Tags]    api_patch    update_user    with_parameter    negative
    ${response}    user_api_keyword.Patch update user details    user_id=${scenario_2['request_params']['user_id']}
    ...                                                          name=${scenario_2['request_params']['name']}
    ...                                                          expected_status=${scenario_2['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_2['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}
    ...                                                 expected_name=${scenario_2['expected_response']['name']}

Scenario3: Users - Update user details - With missing API key header - Expect 401 Unauthorized
    [Tags]    api_patch    update_user    without_api_key_header    nagative
    ${response}    user_api_keyword.Patch update user details    user_id=${scenario_3['request_params']['user_id']}
    ...                                                          headers=${scenario_3['request_headers']}
    ...                                                          expected_status=${scenario_3['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_3['expected_response']['status_code']}
    common_keywords.Verify error meaasge    ${response}    ${scenario_3['expected_response']['error_reason']}
    user_feature.Verify when error 401    response=${response}
    ...                                   expected_error=${scenario_3['expected_response']['error_message']}
    ...                                   expected_how_to_get_one=${scenario_3['expected_response']['how_to_get_one']}