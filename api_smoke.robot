*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com


*** Test Cases ***
GET /posts/1 returns valid JSON and id=1
    Create Session    api    ${BASE_URL}
    ${resp}=    Get On Session    api    /posts/1
    Should Be Equal As Integers    ${resp.status_code}    200
    ${ct}=    Get From Dictionary    ${resp.headers}    Content-Type
    Should Start With    ${ct}    application/json
    ${body}=    To Json    ${resp.text}
    Dictionary Should Contain Key    ${body}    userId
    Dictionary Should Contain Key    ${body}    id
    Dictionary Should Contain Key    ${body}    title
    Dictionary Should Contain Key    ${body}    body
    Should Be Equal As Integers    ${body['id']}    1

GET /users returns a list of 10 users with basic fields
    Create Session    api    ${BASE_URL}
    ${resp}=    Get On Session    api    /users
    Should Be Equal As Integers    ${resp.status_code}    200
    ${users}=    To Json    ${resp.text}
    Length Should Be    ${users}    10
    ${first}=    Get From List    ${users}    0
    Dictionary Should Contain Key    ${first}    id
    Dictionary Should Contain Key    ${first}    name
    Dictionary Should Contain Key    ${first}    email

GET /posts filtered by userId returns only that user’s posts
    Create Session    api    ${BASE_URL}
    ${params}=    Create Dictionary    userId=1
    ${resp}=    Get On Session    api    /posts    params=${params}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${posts}=    To Json    ${resp.text}
    ${count}=    Evaluate    len($posts)
    Should Be True    ${count} > 0
    FOR    ${p}    IN    @{posts}
        Should Be Equal As Integers    ${p['userId']}    1
    END
# Negative: unknown path should return 404 on JSONPlaceholder
GET /this-does-not-exist returns 404 (negative test)
    Create Session    api    ${BASE_URL}
    ${resp}=    Get On Session    api    /this-does-not-exist    expected_status=404
    Should Be Equal As Integers    ${resp.status_code}    404


