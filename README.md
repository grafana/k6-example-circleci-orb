# k6-example-circleci-orb
This is an example repo for how to setup k6 with CircleCI to build load testing into an automation flow.

The full guide describing how to use this repository is located at:
https://k6.io/blog/integrating-load-testing-with-circleci/

## Executing Load tests on terminal

```bash
k6 run loadtests/performance-test.js
```
## Executing Load tests on Cloud
To run tests on the cloud, we first need to add a `K6_CLOUD_TOKEN` environment variable on the command line terminal. This is the token that is used to authenticate with the cloud.

```bash
k6 login cloud # Login to cloud

k6 cloud loadtests/performance-test.js # Run load test on cloud
```

## Executing Extension tests
First we need to build the image
```bash
## Build the docker image
docker build -t xk6-extension:latest .
```

Then we need to execute our extension tests with docker-compose 

```bash
## Execute tests with the k6 image on the docker-compose file
docker-compose run k6
```
