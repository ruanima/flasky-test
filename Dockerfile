FROM ubuntu:latest
MAINTAINER tenxcloud.com

# Install Python Setuptools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install python-setuptools
RUN easy_install pip

ADD requirements/common.txt  /src/requirements.txt
RUN cd /src; pip install -r requirements.txt

ADD . /src

# Expose
EXPOSE  5000
 
# Run
CMD ["python", "/src/manage.py", "runserver"]