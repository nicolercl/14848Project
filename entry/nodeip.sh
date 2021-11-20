#!bin/sh

# Assign the filename
filename="/usr/share/nginx/html/index.html"
# search string
search="POD_IP"
# replace string
replace=$MY_POD_IP
 
sed -i "s/$search/$replace/" $filename