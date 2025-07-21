*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/patch_user/patch_user_negative.yaml

*** Test Cases ***
Scenario1: Users - Update user details with name parameter only - Expect 201 Created
    [Tags]    api_post    create_user    with_parameter    negative
    ${response}    user_api_keyword.Post create user    name=${scenario_1['request_params']['name']}
    ...                                                 expected_status=${scenario_1['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_1['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}
    ...                                                 expected_name=${scenario_1['expected_response']['name']}

Scenario2: Users - Update user details with job parameter only - Expect 201 Created
    [Tags]    api_post    create_user    with_parameter    negative
    ${response}    user_api_keyword.Post create user    job=${scenario_2['request_params']['job']}
    ...                                                 expected_status=${scenario_2['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_2['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}
    ...                                                 expected_job=${scenario_2['expected_response']['job']}

Scenario3: Users - Update user details without parameters - Expect 201 Created
    [Tags]    api_post    create_user    without_parameter    negative
    ${response}    user_api_keyword.Post create user    expected_status=${scenario_3['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_3['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}

Scenario4: Users - Update user details with non string name parameter only - Expect 201 Created
    [Tags]    api_post    create_user    with_parameter    negative
    ${response}    user_api_keyword.Post create user    name=${scenario_4['request_params']['name']}
    ...                                                 expected_status=${scenario_4['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_4['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}
    ...                                                 expected_name=${scenario_4['expected_response']['name']}

Scenario5: Users - Update user details - With missing API key header - Expect 401 Unauthorized
    [Tags]    api_get    create_user    without_api_key_header    nagative
    ${response}    user_api_keyword.Post create user    headers=${scenario_5['request_headers']}
    ...                                               expected_status=${scenario_5['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_5['expected_response']['status_code']}
    common_keywords.Verify error meaasge    ${response}    ${scenario_5['expected_response']['error_reason']}
    user_feature.Verify when error 401    response=${response}
    ...                                   expected_error=${scenario_5['expected_response']['error_message']}
    ...                                   expected_how_to_get_one=${scenario_5['expected_response']['how_to_get_one']}