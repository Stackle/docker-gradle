# Docker Gradle 2.10 on JDK1.8

## How to use
To start build, mount project at /app eg. `docker run --rm -v /path/to/app:/app gradle <command>`
You may encounter problem that gradle don't cache downloaded jar file. 
So, you have to create data container `docker create --name gradle_cache gradle:latest`
and start build with this command `docker run --rm --volumes-from=gradle_cache -v /path/to/app:/app gradle:latest build`
