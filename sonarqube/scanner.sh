# !bin/bash
export PASSWORD="secret"
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "login=admin&password=$PASSWORD&previousPassword=admin" -u admin:admin 127.0.0.1:9000/api/users/change_password
export SONAR_LOGIN=$(curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "name=admin" -u admin:$PASSWORD 127.0.0.1:9000/api/user_tokens/generate)
SONAR_LOGIN=$(python3 get_token.py $SONAR_LOGIN)
sonar-scanner -X -Dsonar.projectKey=project -Dsonar.sources=./prj/ -Dsonar.host.url=http://127.0.0.1:9000 -Dsonar.login=$SONAR_LOGIN