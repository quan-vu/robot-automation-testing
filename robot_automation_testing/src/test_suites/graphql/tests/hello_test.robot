*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Test Cases ***

# Hello Query Response
# ```json
# {
#     "data": {
#         "hello": "Hello, World!"
#     }
# }
# ```
Test Hello Query
    [Documentation]    Test the hello query with name parameter
    Create Session    graphql_session    ${BASE_URL}
    ${query}=    Create Dictionary    query={ hello(name: "World") }
    ${response}=    POST On Session    graphql_session    /graphql    json=${query}
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}=    Collections.Set To Dictionary    ${response.json()}    # Convert the response body to a dictionary
    ${data}=    Get From Dictionary    ${response_body}    data
    ${hello_value}=    Get From Dictionary    ${data}    hello
    Should Be Equal As Strings    ${hello_value}    Hello, World!
