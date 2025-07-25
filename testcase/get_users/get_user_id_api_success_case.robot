*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/get_users/user_id_success.yaml

*** Test Cases ***
Scenario1: Users - Get user by id
    [Tags]    api    get    user_id    success
    ${user_details}    user_api_keyword.Get user by id    user_id=${scenario_1['request_params']['user_id']}
    common_keywords.Verify status code    ${user_details}    ${scenario_1['expected_response']['status_code']}
    user_feature.Verify user id response structure    ${user_details}
    user_feature.Verify user data details content    user_details=${user_details}
    ...                                              expected_user_id=${scenario_1['expected_response']['user_id']}
    ...                                              expected_user_email=${scenario_1['expected_response']['user_email']}
    ...                                              expected_user_first_name=${scenario_1['expected_response']['user_first_name']}
    ...                                              expected_user_last_name=${scenario_1['expected_response']['user_last_name']}
    ...                                              expected_user_avatar=${scenario_1['expected_response']['user_avatar']}
    user_feature.Verify user id support section    user_details=${user_details}
    ...                                            expected_support_url=${scenario_1['expected_response']['support_url']}
    ...                                            expected_support_text=${scenario_1['expected_response']['support_text']}