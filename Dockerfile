FROM cypress/browsers:node-24.12.0-chrome-143.0.7499.169-1-ff-146.0.1-edge-143.0.3650.96-1

# copy cypress folder
# and package.json, package-lock.json files
# and cypress.config.js file
WORKDIR /e2e
COPY . .

# install npm dependencies
RUN npm ci
