FROM python:3.6-slim
#Build args
ARG VCS_REF
ARG BUILD_DATE
# Setting resource quota
ARG MIN_MEM=2G
ARG MAX_MEM=2G
#Adding Labels of build
LABEL maintainer="Peter Clemenko <github.com/peter-clemenko>"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/peter-clemenko/namegen-docker"
LABEL org.label-schema.vcs-ref=$VCS_REF

COPY ./src /src
WORKDIR /src
RUN pip install -r requirements.txt
#Execution
#CMD python namegen.py

ENTRYPOINT ["python","./namegen.py"]