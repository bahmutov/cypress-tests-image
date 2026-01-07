FROM cypress/browsers:node-24.12.0-chrome-143.0.7499.169-1-ff-146.0.1-edge-143.0.3650.96-1

# diagnostics
RUN echo "node -v"
RUN echo "npm -v"

# copy ONLY the package.json and package-lock.json files
WORKDIR /e2e
COPY package.json package-lock.json ./

# install npm dependencies
RUN npm ci

# dummy entry point - we are going to use this image
# for GitHubActions where it will run its own commands
ENTRYPOINT [ "npx", "cypress", "run" ]
