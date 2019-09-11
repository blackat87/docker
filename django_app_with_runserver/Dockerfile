FROM centos:centos7

# create root directory for our project in the container
RUN mkdir /root_directory

# Set the working directory to /root_directory
WORKDIR /root_directory

# Copy the directory (for current directory use .) contents into the container at /fdh_tracking
ADD django_project_folder/ /root_directory/

COPY run_app.sh /root_directory/run_django.sh

RUN chmod +x /root_directory/run_app.sh

#install all python3 enviroment
RUN yum -y update \ 
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \ 
    && yum -y update \ 
    && yum -y install gcc \
                      gcc-c++ \
                      python36 \
                      python36-devel \
                      python36-pip \
                      python36-libs \ 
    && yum -y update \ 
    && yum clean all && rm -rf /var/cache/yum \
    && python36 -m pip install pip --upgrade \
    && python36 -m pip install  -r requirements.txt
