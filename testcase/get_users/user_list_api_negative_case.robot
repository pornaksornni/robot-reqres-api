*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/user_list_negative.yaml

*** Test Cases ***
Scenario1: Users - Get user list - With non existent page number - Expect 200 ok but empty data
    [Tags]    api_get    user_list    with_page_parameter    nagative
    ${user_list}    user_api_keyword.Get user list    page=${scenario_1['request_params']['page']}
    common_keywords.Verify status code    ${user_list}    ${scenario_1['expected_response']['status_code']}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_1['expected_response']['page']}
    ...                                                  expected_per_page=${scenario_1['expected_response']['per_page']}
    ...                                                  expected_total=${scenario_1['expected_response']['total']}
    ...                                                  expected_total_pages=${scenario_1['expected_response']['total_pages']}
    user_feature.Verify user data list content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_1['expected_response']['data_count']}
    user_feature.Verify user list support section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_1['expected_response']['support_url']}
    ...                                              expected_support_text=${scenario_1['expected_response']['support_text']}

Scenario2: Users - Get user list - With negative page number - Expect 200 ok but empty data
    [Tags]    api_get    user_list    with_page_parameter    nagative
    ${user_list}    user_api_keyword.Get user list    page=${scenario_2['request_params']['page']}
    common_keywords.Verify status code    ${user_list}    ${scenario_2['expected_response']['status_code']}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_2['expected_response']['page']}
    ...                                                  expected_per_page=${scenario_2['expected_response']['per_page']}
    ...                                                  expected_total=${scenario_2['expected_response']['total']}
    ...                                                  expected_total_pages=${scenario_2['expected_response']['total_pages']}
    user_feature.Verify user data list content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_2['expected_response']['data_count']}
    user_feature.Verify user list support section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_2['expected_response']['support_url']}
    ...                                              expected_support_text=${scenario_2['expected_response']['support_text']}

Scenario3: Users - Get user list - With non numeric page parameter - Expect 200 ok and default first page
    [Tags]    api_get    user_list    with_page_parameter    nagative
    ${user_list}    user_api_keyword.Get user list    page=${scenario_3['request_params']['page']}
    common_keywords.Verify status code    ${user_list}    ${scenario_3['expected_response']['status_code']}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_3['expected_response']['page']}
    ...                                                  expected_per_page=${scenario_3['expected_response']['per_page']}
    ...                                                  expected_total=${scenario_3['expected_response']['total']}
    ...                                                  expected_total_pages=${scenario_3['expected_response']['total_pages']}
    user_feature.Verify user data list content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_3['expected_response']['data_count']}
    user_feature.Verify user list support section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_3['expected_response']['support_url']}
    ...                                              expected_support_text=${scenario_3['expected_response']['support_text']}

Scenario4: Users - Get user list - With per_page 0 parameter - Expect 200 ok and return default per_page
    [Tags]    api_get    user_list    with_per_page_parameter    nagative
    ${user_list}    user_api_keyword.Get user list    per_page=${scenario_4['request_params']['per_page']}
    common_keywords.Verify status code    ${user_list}    ${scenario_4['expected_response']['status_code']}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_4['expected_response']['page']}
    ...                                                  expected_per_page=${scenario_4['expected_response']['per_page']}
    ...                                                  expected_total=${scenario_4['expected_response']['total']}
    ...                                                  expected_total_pages=${scenario_4['expected_response']['total_pages']}
    user_feature.Verify user data list content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_4['expected_response']['data_count']}
    user_feature.Verify user list support section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_4['expected_response']['support_url']}
    ...                                              expected_support_text=${scenario_4['expected_response']['support_text']}

Scenario5: Users - Get user list - With non numeric per_page parameter - Expect 200 ok and return default per_page
    [Tags]    api_get    user_list    with_per_page_parameter    nagative
    ${user_list}    user_api_keyword.Get user list    per_page=${scenario_5['request_params']['per_page']}
    common_keywords.Verify status code    ${user_list}    ${scenario_5['expected_response']['status_code']}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_5['expected_response']['page']}
    ...                                                  expected_per_page=${scenario_5['expected_response']['per_page']}
    ...                                                  expected_total=${scenario_5['expected_response']['total']}
    ...                                                  expected_total_pages=${scenario_5['expected_response']['total_pages']}
    user_feature.Verify user data list content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_5['expected_response']['data_count']}
    user_feature.Verify user list support section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_5['expected_response']['support_url']}
    ...                                              expected_support_text=${scenario_5['expected_response']['support_text']}

Scenario6: Users - Get user list - With Missing API Key Header - Expect 401 Unauthorized
    [Tags]    api_get    user_list    without_api_key_header    nagative
    ${user_list}    user_api_keyword.Get user list    headers=${scenario_6['request_headers']}
    ...                                               page=${scenario_6['request_params']['page']}
    ...                                               expected_status=${scenario_6['expected_response']['status_code']}
    common_keywords.Verify status code    ${user_list}    ${scenario_6['expected_response']['status_code']}
    common_keywords.Verify error meaasge    ${user_list}    ${scenario_6['expected_response']['error_reason']}
    user_feature.Verify when error 401    response=${user_list}
    ...                                   expected_error=${scenario_6['expected_response']['error_message']}
    ...                                   expected_how_to_get_one=${scenario_6['expected_response']['how_to_get_one']}