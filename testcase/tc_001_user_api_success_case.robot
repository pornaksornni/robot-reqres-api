*** Settings ***
Resource     ${CURDIR}/../resources/imports.robot
Variables    ${CURDIR}/../resources/test_data/api/tc_001_user_success.yaml

*** Test Cases ***
Scenario1: Users - Get user list - Without pagination parameters (default)
    [Tags]  get_user
    ${user_list}    user_api_keyword.Get user list
    common_keywords.Verify status code should be 200    ${user_list}
    user_feature.Verify user list response structure    ${user_list}
    user_feature.Verify user list pagination metadata    user_list=${user_list}
    ...                                                  expected_page=${scenario_1['expected_response']['page']}    
    ...                                                  expected_per_page=${scenario_1['expected_response']['per_page']} 
    ...                                                  expected_total=${scenario_1['expected_response']['total']}     
    ...                                                  expected_total_pages=${scenario_1['expected_response']['total_pages']} 
    user_feature.Verify User Data List Content    user_list=${user_list}
    ...                                           expected_data_count=${scenario_1['expected_response']['data_count']} 
    user_feature.Verify User List Support Section    user_list=${user_list}
    ...                                              expected_support_url=${scenario_1['expected_response']['support_url']} 
    ...                                              expected_support_text=${scenario_1['expected_response']['support_text']} 