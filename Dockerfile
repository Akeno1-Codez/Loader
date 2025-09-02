# set base image (host OS)
FROM python:3.9

# set the working directory in the container
WORKDIR /app/

RUN apt -qq update
RUN apt -qq install -y --no-install-recommends \
    curl \
    git \
    gnupg2 \
    unzip \
    wget \
    ffmpeg

# copy the content of the local src directory to the working directory
COPY . .

# install dependencies
RUN pip install -r requirements.txt

# command to run on container start
CMD [ "bash", "./run" ]
