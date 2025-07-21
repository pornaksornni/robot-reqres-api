*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/put_user/put_user_success.yaml

*** Test Cases ***
Scenario1: Users - Update user details successfully
    [Tags]    api_put    update_user    with_parameter    success
    ${response}    user_api_keyword.Put update user details    user_id=${scenario_1['request_params']['user_id']}
    ...                                                        name=${scenario_1['request_params']['name']}
    ...                                                        job=${scenario_1['request_params']['job']}
    ...                                                        expected_status=${scenario_1['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_1['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}
    ...                                                 expected_name=${scenario_1['expected_response']['name']}
    ...                                                 expected_job=${scenario_1['expected_response']['job']}

Scenario2: Users - Update user details with name parameter only - Expect 200 OK
    [Tags]    api_put    update_user    with_parameter    negative
    ${response}    user_api_keyword.Put update user details    user_id=${scenario_2['request_params']['user_id']}
    ...                                                        name=${scenario_2['request_params']['name']}
    ...                                                        expected_status=${scenario_2['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_2['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}
    ...                                                 expected_name=${scenario_2['expected_response']['name']}

Scenario3: Users - Update user details with job parameter only - Expect 200 OK
    [Tags]    api_put    update_user    with_parameter    negative
    ${response}    user_api_keyword.Put update user details    user_id=${scenario_3['request_params']['user_id']}
    ...                                                        job=${scenario_3['request_params']['job']}
    ...                                                        expected_status=${scenario_3['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_3['expected_response']['status_code']}
    user_feature.Verify update user details response    response=${response}
    ...                                                 expected_job=${scenario_3['expected_response']['job']}
