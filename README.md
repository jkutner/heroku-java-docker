# Heroku Java Docker Image

This Docker project is used to test Java applications on [Heroku's cedar-14 stack](https://devcenter.heroku.com/articles/cedar).

## Usage

Build the Heroku cedar-14 image:

```
./build.sh
```

The from your application directory run this to start a container:

```
$ docker run --publish 8080:8080 -t -v `pwd`:/app:ro --rm heroku/java
```

The command above will detect your project's `Procfile` and run the `web` process.

Browse to `http://localhost:8080` in you are on Linux, or `http://boot2docker-ip:8080` on Mac.

## Running Other Process Types

To run process types (in your `Procfile`) other than `web`, just add the name
of process type to the `run` command like this:

```
$ docker run -t -v `pwd`:/app:ro --rm heroku/java worker
```
