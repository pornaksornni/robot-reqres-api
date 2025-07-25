*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/delete_user/delete_user_success.yaml

*** Test Cases ***
Scenario1: Users - Delete user successfully
    [Tags]    api    delete    delete_user    success
    ${response}    user_api_keyword.delete user    user_id=${scenario_1['request_params']['user_id']}
    ...                                            expected_status=${scenario_1['expected_response']['status_code']}
    common_keywords.Verify status code    ${response}    ${scenario_1['expected_response']['status_code']}