# Create a private python package repository


## Set up pypi server
docker run --rm  mosquito/pypi-server


## Create a package
create files with code



cd /tmp
git clone https://github.com/fxfabre/PyPI_server.git
cd PyPI_server
python setup.py sdist
mv dist/test_package-0.1.tar.gz ~/packages/
rm -r /tmp/PyPI_server


# set up users
apt-get update
apt-get install apache2
pip install passlib 
htpasswd -sc htpasswd.txt new_user
mv htpasswd.txt ~/packages/

apt-get install libapache2-mod-wsgi
a2enmod wsgi


pypi-server -p 8080 ~/packages


go to http://localhost:8080/

