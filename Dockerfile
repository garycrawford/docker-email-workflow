FROM node

MAINTAINER Gary Crawford "gary.crawford@akqa.com"

# Update aptitude with new repo
RUN apt-get update

# Install software 
RUN apt-get install -y git

RUN git clone https://github.com/garycrawford/grunt-email-workflow.git

RUN mkdir -p /grunt-email-workflow/src/css/scss /grunt-email-workflow/src/data /grunt-email-workflow/src/emails /grunt-email-workflow/src/img

WORKDIR /grunt-email-workflow

RUN npm install

RUN npm install -g grunt-cli

RUN npm install -g grunt-parallel --save-dev

EXPOSE 4000

ADD /conf/secrets.json secrets.json

# ENTRYPOINT ["grunt"]
CMD ["grunt"]
