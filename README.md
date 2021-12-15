BUILD BASE IMAGE

TAG base

```

docker build -f base.dockerfile -t marsyang1/bitbucket-ci-builder:base .
docker push marsyang1/bitbucket-ci-builder:base

```

TAG java

```

docker build -f java.dockerfile -t marsyang1/bitbucket-ci-builder:java .
docker push marsyang1/bitbucket-ci-builder:java

```

TAG java11

```

docker build -f jdk11.dockerfile -t marsyang1/bitbucket-ci-builder:java11 .
docker push marsyang1/bitbucket-ci-builder:java11

```

TAG java17

```

docker build -f jdk17.dockerfile -t marsyang1/bitbucket-ci-builder:java17 .
docker push marsyang1/bitbucket-ci-builder:java17

```

TAG node

```

docker build -f node.dockerfile -t marsyang1/bitbucket-ci-builder:node .
docker push marsyang1/bitbucket-ci-builder:node

```

TAG node-runner

```

docker build -f node_runner.dockerfile -t marsyang1/bitbucket-ci-builder:node-runner .
docker push marsyang1/bitbucket-ci-builder:node-runner

```

TAG python3 

```

docker build -f python3.dockerfile -t marsyang1/bitbucket-ci-builder:python3 .
docker push marsyang1/bitbucket-ci-builder:python3

```