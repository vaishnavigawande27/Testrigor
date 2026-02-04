#!/bin/bash

# Test parameters (replace with actual login details and URLs)
WEBMAIL_URL="https://mail.microproindia.com/webmail/#sign-in"
USER="$EMAIL_USERNAME"  # Correctly reference the environment variable
PASS="$EMAIL_PASSWORD"  # Correctly reference the environment variable

# Send a POST request to simulate login and get the response code
response=$(curl -s -w "%{http_code}" -o /tmp/webmail_response.txt -X POST \
  -d "username=$USER&password=$PASS" \
  $WEBMAIL_URL)

# Check if login was successful based on the HTTP status code
if [ "$response" -eq 200 ]; then
  echo "Login successful!" > report.html
  echo "<p>Status: Test Passed</p>" >> report.html
else
  echo "Login failed with status code $response" > report.html
  echo "<p>Status: Test Failed</p>" >> report.html
  exit 1  # Fail the job if login fails
fi
