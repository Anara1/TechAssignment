
QA Assignment:
For this assignment, JumpCloud has implemented a password hashing application in Golang and we have intentionally left bugs in it. The assignment is to write the test cases needed to test the application, explain your choices for coverage, execute the test cases and report the bugs you find.
 Deliverables should be submitted along with a README in a GitHub repo that
you share with us.
The style, depth, scope and type of tests and bug reports you write are up to you. Use them to demonstrate your style and strengths. Show your test plan. 
JumpCloud uses test automation, so consider demonstrating some of your automation skills as well. If you use automation, explain how to run the automation.
Obtaining the Password Hashing Application
We are storing the password hashing application in a public S3 bucket. You can get it in the following manner:
Mac/Linux example:
$ wget --no-check-certificate --no-proxy
‘https://qa-broken-hashserve-jc.s3.amazonaws.com/broken-hashserve.tar
’
Windows example:
On modern Windows systems with PowerShell 3.x, curl/wget/iwr are just aliases for
Invoke-WebRequest. It has equivalent curl/wget/iwr parameters and output; they are just named different things. On Windows 10, you will also need to install 7zip or equivalent  
extraction tool to unpack the *.tar archive.
C:/> iwr -Uri
https://qa-broken-hashserve-jc.s3.amazonaws.com/broken-hashserve.tar
-UseBasicParsing -o ./broken-hashserve.tar

Password Hashing Application Execution
The broken-hashserve.tar archive contains binaries for Linux, Windows & an installer for Mac OS operating systems. Unpack and use/install the binary corresponding to your OS of choice.
** JumpCloud Confidential, please do not distribute this document in any form.**
You must set a PORT environment variable before executing the application. It will crash otherwise.
Mac/Linux example:
Note: the binary will be installed to /usr/local/bin
$ export PORT=8088
Windows example:
1. C:/> SET PORT=8088
2. Use the Control Panel to set a System or User variable for
PORT. Remember to reopen your cmd window after doing this.
Password Hashing Application Specification
The following is the requirement specification that was used in building the password hashing
application. It describes what the application should do.
● When launched, the application should wait for http connections.
● It should answer on the PORT specified in the PORT environment variable.
● It should support three endpoints:
○ A POST to /hash should accept a password. It should return a job identifier
immediately. It should then wait 5 seconds and compute the password hash.
The hashing algorithm should be SHA512.
○ A GET to /hash should accept a job identifier. It should return the base64
encoded password hash for the corresponding POST request.
○ A GET to /stats should accept no data. It should return a JSON data structure
for the total hash requests since the server started and the average time of a
hash request in milliseconds.
● The software should be able to process multiple connections simultaneously.
● The software should support a graceful shutdown request. Meaning, it should allow any in-flight password hashing to complete, reject any new requests, respond with a 200 and shutdown.
● No additional password requests should be allowed when shutdown is pending.
Interacting with the Password Hashing Application. You can interact/test the application using curl. The following are examples that would/should
generate similar returns - the job identifier does not need to conform to a specification.
● Post to the /hash endpoint
$ curl -X POST -H "application/json" -d '{"password":"angrymonkey"}'
http://127.0.0.1:8088/hash
** JumpCloud Confidential, please do not distribute this document in any form.**
> 42
● Get the base64 encoded password
$ curl -H "application/json" http://127.0.0.1:8088/hash/1
> zHkbvZDdwYYiDnwtDdv/FIWvcy1sKCb7qi7Nu8Q8Cd/MqjQeyCI0pWKDGp74A1g==
● Get the stats
$ curl http://127.0.0.1:8088/stats
> {"TotalRequests":3,"AverageTime":5004625}
● Shutdown
$ curl -X POST -d 'shutdown' http://127.0.0.1:8088/hash
> 200 Empty Response
** JumpCloud Confidential, please do not distribute this document in any form.**