# pick the image to build from
# either the base or the browsers image

# https://hub.docker.com/r/cypress/base/tags
FROM cypress/base:24.12.0

# https://hub.docker.com/r/cypress/browsers/tags
# FROM cypress/browsers:node-24.12.0-chrome-143.0.7499.169-1-ff-146.0.1-edge-143.0.3650.96-1

# diagnostics
RUN echo "node -v"
RUN echo "npm -v"

# copy ONLY the package.json and package-lock.json files
WORKDIR /e2e
COPY package.json package-lock.json ./

# install npm dependencies
# and put the Cypress binary in the local subfolder
# https://on.cypress.io/installation
ENV CYPRESS_CACHE_FOLDER=/e2e/cypress_cache
RUN npm ci

# verify Cypress installation
RUN npx cypress verify

# the Docker image should have all Cypress OS dependencies installed
# plus inside the "/e2e" folder
# we will have
#   - node_modules with Cypress installed
#   - cypress_cache with the Cypress binary
