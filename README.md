BUILD BASE IMAGE

TAG base

```

docker build --platform linux/amd64 -f base.dockerfile -t marsyang1/bitbucket-ci-builder:base .
docker push marsyang1/bitbucket-ci-builder:base

```

TAG java

```

docker build --platform linux/amd64 -f java.dockerfile -t marsyang1/bitbucket-ci-builder:java .
docker push marsyang1/bitbucket-ci-builder:java

```

TAG java11

```

docker build --platform linux/amd64 -f jdk11.dockerfile -t marsyang1/bitbucket-ci-builder:java11 .
docker push marsyang1/bitbucket-ci-builder:java11

```

TAG java17

```

docker build -f jdk17.dockerfile -t marsyang1/bitbucket-ci-builder:java17 .
docker push marsyang1/bitbucket-ci-builder:java17

```

TAG node

```

docker build --platform linux/amd64 -f node.dockerfile -t marsyang1/bitbucket-ci-builder:node .
docker push marsyang1/bitbucket-ci-builder:node

```

TAG node14

```

docker build --platform linux/amd64 -f node14.dockerfile -t marsyang1/bitbucket-ci-builder:node14 .
docker push marsyang1/bitbucket-ci-builder:node14

```

TAG node-runner

```

docker build --platform linux/amd64 -f node_runner.dockerfile -t marsyang1/bitbucket-ci-builder:node-runner .
docker push marsyang1/bitbucket-ci-builder:node-runner

```

TAG node14-runner

```

docker build --platform linux/amd64 -f node14_runner.dockerfile -t marsyang1/bitbucket-ci-builder:node14-runner .
docker push marsyang1/bitbucket-ci-builder:node14-runner

```

TAG python3 

```

docker build --platform linux/amd64 -f python3.dockerfile -t marsyang1/bitbucket-ci-builder:python3 .
docker push marsyang1/bitbucket-ci-builder:python3

```


TAG node18

```

docker build -f node18.dockerfile --platform linux/amd64 -t marsyang1/bitbucket-ci-builder:node18 .
docker push marsyang1/bitbucket-ci-builder:node18

```

TAG node18-runner

```

docker build --platform linux/amd64 -f node18_runner.dockerfile --platform linux/amd64 -t marsyang1/bitbucket-ci-builder:node18-runner .
docker push marsyang1/bitbucket-ci-builder:node18-runner

```