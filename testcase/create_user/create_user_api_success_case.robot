*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/create_user/create_user_success.yaml

*** Test Cases ***
Scenario1: Users - Create user successfully
    [Tags]    api    post    create_user    with_parameter    success
    ${response}    user_api_keyword.Post create user    name=${scenario_1['request_params']['name']}
    ...                                                 job=${scenario_1['request_params']['job']}
    ...                                                 expected_status=${scenario_1['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_1['expected_response']['status_code']}
    user_feature.Verify cerate user response    response=${response}
    ...                                         expected_name=${scenario_1['expected_response']['name']}
    ...                                         expected_job=${scenario_1['expected_response']['job']}