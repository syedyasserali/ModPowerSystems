FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

WORKDIR Modci/

RUN apt-get update && apt-get install -y sudo 
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y gnupg 

RUN apt-get -qq -y install \
    software-properties-common  \
    python3 \
    python3-pip  \
    python3-dev  \
    git-core  \
    wget

# Install OpenModelica
RUN for deb in deb deb-src; do echo "$deb http://build.openmodelica.org/apt `lsb_release -cs` nightly"; done | sudo tee /etc/apt/sources.list.d/openmodelica.list
RUN wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- | sudo apt-key add -
RUN apt-key fingerprint
RUN apt-get update
RUN apt-get -qq -y --allow-unauthenticated install openmodelica

# Install pip python packages
ADD requirements.txt .
RUN pip3 install -r requirements.txt

# Install packages from acs git repos
ADD dataprocessing ./dataprocessing
RUN cd dataprocessing && python3 setup.py develop
ADD python-for-modelica ./python-for-modelica
RUN cd python-for-modelica/Py4Mod && python3 setup.py develop
ADD reference-results ./reference-results

# Add and switch to OpenModelica user
RUN useradd -ms /bin/bash openmodelica
USER openmodelica
ENV USER openmodelica
CMD ["OMShell-terminal"]

