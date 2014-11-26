# Heroku Java Docker Image

This Docker project is used to test Java applications on [Heroku's cedar-14 stack](https://devcenter.heroku.com/articles/cedar).
It can be used to run any kind of Java-based application (Java, Scala, Groovy, etc), regardless of the Buildpack used on Heroku.

## Usage

Build the Heroku cedar-14 image:

```
./build.sh
```

This will build a Docker image with the tag "heroku/java".

Then, from your application directory run this to start a container:

```
$ docker run --publish 5000:5000 -it -v `pwd`:/app --rm heroku/java
```

The command above will detect your project's `Procfile` and run the `web` process.

Browse to `http://localhost:5000` in you are on Linux, or `http://boot2docker-ip:5000` on Mac.

## Running Other Process Types

To run process types (in your `Procfile`) other than `web`, just add the name
of process type to the `run` command like this:

```
$ docker run -it -v `pwd`:/app --rm heroku/java worker
```

## Build the image with only one JDK

By default, the image will install JDK 6, 7, and 8 (and then decided which one
  to use based on your application's settings). But if you know you will only
  need one version of the JDK, you can define it in a `system.properties` in the
  root directory of this project. For example, the file might contain:

```
java.runtime.version=1.7
```
