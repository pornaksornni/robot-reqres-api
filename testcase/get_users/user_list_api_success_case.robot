*** Settings ***
Resource     ${CURDIR}/../../resources/imports.robot
Variables    ${CURDIR}/../../resources/test_data/api/get_users/user_list_success.yaml

*** Test Cases ***
Scenario1: Users - Get user list - Without pagination parameters (default)
    [Tags]    api_get    user_list    without_parameter    success
    ${user_list}    user_api_keyword.Get user list
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

Scenario2: Users - Get user list - With valid page 1
    [Tags]    api_get    user_list    with_page_parameter    success
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

Scenario3: Users - Get user list - With valid page 2
    [Tags]    api_get    user_list    with_page_parameter    success
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

Scenario4: Users - Get user list - With valid per_page 2
    [Tags]    api_get    user_list    with_per_page_parameter    success
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

Scenario5: Users - Get user list - With valid per_page 100
    [Tags]    api_get    user_list    with_per_page_parameter    success
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

Scenario6: Users - Get user list - With valid page 2 and per_page 10
    [Tags]    api_get    user_list    with_page_parameter    with_per_page_parameter    success
    ${user_list}    user_api_keyword.Get user list    page=${scenario_6['request_params']['page']}    per_page=${scenario_6['request_params']['per_page']}
    common_keywords.Verify status code    ${user_list}    ${scenario_6['expected_response']['status_code']}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_6['expected_response']['page']}    
    ...                                                  expected_per_page=${scenario_6['expected_response']['per_page']} 
    ...                                                  expected_total=${scenario_6['expected_response']['total']}     
    ...                                                  expected_total_pages=${scenario_6['expected_response']['total_pages']} 
    user_feature.Verify user data list content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_6['expected_response']['data_count']} 
    user_feature.Verify user list support section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_6['expected_response']['support_url']} 
    ...                                              expected_support_text=${scenario_6['expected_response']['support_text']}

Scenario7: Users - Get user list - With valid page 1 and per_page 10
    [Tags]    api_get    user_list    with_page_parameter    with_per_page_parameter    success
    ${user_list}    user_api_keyword.Get user list    page=${scenario_7['request_params']['page']}    per_page=${scenario_7['request_params']['per_page']}
    common_keywords.Verify status code    ${user_list}    ${scenario_7['expected_response']['status_code']}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_7['expected_response']['page']}    
    ...                                                  expected_per_page=${scenario_7['expected_response']['per_page']} 
    ...                                                  expected_total=${scenario_7['expected_response']['total']}     
    ...                                                  expected_total_pages=${scenario_7['expected_response']['total_pages']} 
    user_feature.Verify user data list content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_7['expected_response']['data_count']} 
    user_feature.Verify user list support section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_7['expected_response']['support_url']} 
    ...                                              expected_support_text=${scenario_7['expected_response']['support_text']}