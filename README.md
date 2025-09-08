BUILD BASE IMAGE

TAG base

```

docker build --platform linux/amd64 -f base.dockerfile -t marsyang1/bitbucket-ci-builder:base .
docker push marsyang1/bitbucket-ci-builder:base

```

TAG ubi10 base

```

docker build --platform linux/amd64 -f ubi10.base.dockerfile -t marsyang1/bitbucket-ci-builder:ubi10-base .
docker push marsyang1/bitbucket-ci-builder:ubi10-base

```

TAG ubi10 base java

```

docker build --platform linux/amd64 -f ubi10.base.java.dockerfile -t marsyang1/bitbucket-ci-builder:ubi10-base-java .
docker push marsyang1/bitbucket-ci-builder:ubi10-base-java

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

docker build --platform linux/amd64 -f jdk17.dockerfile -t marsyang1/bitbucket-ci-builder:java17 .
docker push marsyang1/bitbucket-ci-builder:java17

```

TAG java21

```

docker build --platform linux/amd64 -f jdk21.dockerfile -t marsyang1/bitbucket-ci-builder:java21 .
docker push marsyang1/bitbucket-ci-builder:java21

```

TAG ubi10-jdk8

```

docker build --platform linux/amd64 -f jdk8.ubi10.dockerfile -t marsyang1/bitbucket-ci-builder:ubi10-jdk8 .
docker push marsyang1/bitbucket-ci-builder:ubi10-jdk8

```

TAG ubi10-jdk11

```

docker build --platform linux/amd64 -f jdk11.ubi10.dockerfile -t marsyang1/bitbucket-ci-builder:ubi10-jdk11 .
docker push marsyang1/bitbucket-ci-builder:ubi10-jdk11

```

TAG ubi10-jdk17

```

docker build --platform linux/amd64 -f jdk17.ubi10.dockerfile -t marsyang1/bitbucket-ci-builder:ubi10-jdk17 .
docker push marsyang1/bitbucket-ci-builder:ubi10-jdk17

```

TAG ubi10-jdk21

```

docker build --platform linux/amd64 -f jdk21.ubi10.dockerfile -t marsyang1/bitbucket-ci-builder:ubi10-jdk21 .
docker push marsyang1/bitbucket-ci-builder:ubi10-jdk21

```

TAG node14

```

docker build --platform linux/amd64 -f node14.dockerfile -t marsyang1/bitbucket-ci-builder:node14 .
docker push marsyang1/bitbucket-ci-builder:node14

```

TAG node14-runner

```

docker build --platform linux/amd64 -f node14_runner.dockerfile -t marsyang1/bitbucket-ci-builder:node14-runner .
docker push marsyang1/bitbucket-ci-builder:node14-runner

```

TAG node18

```

docker build --platform linux/amd64 -f node18.dockerfile -t marsyang1/bitbucket-ci-builder:node18 .
docker push marsyang1/bitbucket-ci-builder:node18

```

TAG node18-runner

```

docker build --platform linux/amd64 -f node18_runner.dockerfile -t marsyang1/bitbucket-ci-builder:node18-runner .
docker push marsyang1/bitbucket-ci-builder:node18-runner

```

TAG python3 

```

docker build --platform linux/amd64 -f python3.dockerfile -t marsyang1/bitbucket-ci-builder:python3 .
docker push marsyang1/bitbucket-ci-builder:python3

```