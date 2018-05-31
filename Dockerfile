# REFERENCES:
# Waldek's script: https://blog.mastykarz.nl/sharepoint-framework-docker/
# docker run -h spfx -it --rm --name spfx-azurecdn-deploy -v /c/Users/paulsumm/Documents/dev/spfx/deployment/azurecdn:/usr/app/spfx -p 5432:5432 -p 4321:4321 -p 35729:35729
FROM node:8

# Pulled from Waldek's script
EXPOSE 5432 4321 35729

RUN npm i -g npm && \
    npm i -g gulp yo @microsoft/generator-sharepoint && \
    npm cache clean

VOLUME /usr/app/spfx
WORKDIR /usr/app/spfx
RUN useradd --create-home --shell /bin/bash spfx &&\
    usermod -aG sudo spfx && \
    chown -R spfx:spfx /usr/app/spfx

USER spfx

CMD /bin/bash

