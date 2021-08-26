  
FROM python:3.7-slim

RUN apt-get update
RUN apt-get install -y wget unzip libzbar0 git
ENV AccessToken=
ENV Secret=
ENV Nohead=TRUE
ENV Sourcepath=https://github.com/vincywindy/TechXueXi.git
# RUN rm -f /xuexi/config/*; ls -la
COPY requirements.txt /xuexi/requirements.txt
COPY run.sh /xuexi/run.sh 

RUN pip install -r /xuexi/requirements.txt
RUN cd /xuexi/; wget https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_92.0.4515.159-1_amd64.deb; dpkg -i google-chrome-stable_92.0.4515.159-1_amd64.deb; apt-get -fy install; google-chrome --version; rm -f google-chrome-stable_92.0.4515.159-1_amd64.deb
RUN cd /xuexi/; wget -O chromedriver_linux64_92.0.4515.107.zip http://npm.taobao.org/mirrors/chromedriver/92.0.4515.107/chromedriver_linux64.zip; unzip chromedriver_linux64_92.0.4515.107.zip; chmod 755 chromedriver; ls -la; ./chromedriver --version

WORKDIR /xuexi
RUN chmod +x ./run.sh
RUN mkdir code
WORKDIR /xuexi/code
RUN git clone $Sourcepath
WORKDIR /xuexi
ENTRYPOINT ["/bin/bash", "./run.sh"]