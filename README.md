# Building a python lambda layer for dependencies

1. Add pip dependencies to `requirements.txt`
2. Run the following:
   1. `DOCKER_BUILDKIT=1 docker build --file Dockerfile --output out . `
3. Copy the `layer.zip` file from `./out/layer.zip` to your serverless repo.