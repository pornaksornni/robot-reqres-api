🌟 Project Overview
This project showcases API test automation skills using Robot Framework. It is designed as a portfolio piece to demonstrate robust test automation practices, project structuring, and comprehensive API validation techniques.

🎯 What This Project Does
This project focuses on automated testing of RESTful APIs. It aims to ensure the reliability, functionality, and data integrity of an API by implementing various test scenarios.

The core objectives include:
- API Validation: Verifying that API endpoints respond correctly and return expected data.
- Test Case Coverage: Designing and executing tests for different scenarios, including:
  - Success Cases: Validating successful API responses under normal conditions.
  - Negative Cases: Testing how the API handles invalid inputs, missing parameters, or error conditions.
- Data Validation: Thoroughly checking the structure and content of the API response data.
Specifically, this project demonstrates testing for the [reqres.in](https://reqres.in).

✨ Key Features & Demonstrated Skills
This project highlights the following automation testing skills:
- Project Structure: A well-organized and scalable project layout, making tests easy to manage and expand.
- Modular Test Design: Breaking down complex test flows into reusable keywords for better maintainability.
- Test Case Management: Structuring test cases effectively to cover different scenarios (e.g., success, negative).
- Data-Driven Testing: Utilizing external data sources (e.g., YAML files) to make tests flexible and reusable.
- API Request Handling: Sending various types of HTTP requests (GET, POST, PUT, DELETE) and handling responses.
- Response Data Validation: Verifying JSON response bodies, status codes, headers, and specific data fields.
- Environment Configuration: Managing different testing environments (SIT, UAT, Production) using configuration files.

🛠️ Technologies Used
Robot Framework: The core automation framework.
- RequestsLibrary: For making HTTP requests to APIs.
- Python: For custom keywords and utility functions.
- YAML: For managing test data.
- Visual Studio Code: As the Integrated Development Environment (IDE).
- Git: For version control.	

🚀 How to Get Started
To run this project locally, follow these steps:
1. Clone the Repository:
```bash
git clone https://github.com/pornaksornni/robot-reqres-api
cd robot-reqres-api
```
2. Install Dependencies:
```bash
pip install -r requirements.txt
```
3. Run Tests:
You can run all tests using the following command:
```bash
robot -v env:prod -d results testcase/
```