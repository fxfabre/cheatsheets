# Create a private python package repository

Ressources :
- https://pypi.org/project/pypiserver/
- PEP 517
- https://packaging.python.org/


## Using pypiserver
`pip install pypiserver`                # Or: pypiserver[passlib,watchdog]

Create user with credentials
`htpasswd -Bc htpasswd.txt hlx_user`

Start
`mkdir ./packages`
`pypi-server -p 8080 $PWD/packages`

go to http://localhost:8080/



## Set up environment
`sudo apt-get update && sudo apt-get install docker docker-compose`
`wget https://raw.githubusercontent.com/pypiserver/pypiserver/master/docker-compose.yml`
update image version (replace :latest with :v1.3.2 for ex)

Create a new user :
`mkdir -p auth packages`
`htpasswd -B auth/.htpasswd user_name`
-> will ask for password for user user_name and generate the file auth/.htpasswd

## Start server
Start the pypi server + monitoring web app
`docker-compose up -d pypiserver-https traefik`

## Client config
`vim ~/.pip/pip.conf`
Write inside :
```
[global]
extra-index-url = http://localhost:8080/simple/
trusted-host = localhost
```

python3 -m pip install twine
python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*

python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps example-pkg-YOUR-USERNAME-HERE



####### Obsolete !!!!

## Set up pypi server
docker run --rm  mosquito/pypi-server

## Create a package
create files with code


```
python setup.py sdist
mv dist/*.tar.gz ~/packages/
```

# set up users
```
apt-get update
apt-get install apache2
pip install passlib
htpasswd -sc htpasswd.txt new_user
mv htpasswd.txt ~/packages/

```




