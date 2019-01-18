#!/bin/bash

echo -n "Please enter your first name and last aname:  "
read firstname lastname 
echo "Hello, $firstname.  How is the $lastname family?"

echo "Relevant environment variables: "
set|grep "name="
