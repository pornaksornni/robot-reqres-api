*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

Variables    ../resources/configs/${env}/api_config.yaml
# Variables    ../resources/test_data/test_data.yaml

Resource    ../keywords/common_keywords.robot
Resource    ../keywords/api/user_api_keyword.robot
Resource    ../keywords/feature/user_feature.robot