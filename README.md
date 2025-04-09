# Docker Practice

## Setup

1. Fork this repository.
2. Open your fork in a GitHub Codespace.
3. Within the Codespace, install the necessary Python packages:

    ```
    pip install -r requirements.txt
    ```
4. Verify your software is installed by running the `streamlit` command. If that fails, `pip uninstall streamlit` and then install it again.

## Write an App

5. Modify / update your code as desired.
6. To preview your app:

    ```
    streamlit run app.py
    ```

7. View your app via the open port. Repeat this process as necessary as you edit your app.

## Containerize your App

8. Review the contents of `Dockerfile` and edit as necessary.
9. To build your container image:

    ```
    docker build -t SOMENAME .
    ```

10. Debug as necessary.
11. If you are building a container to be shared, you need to TAG it properly for the container registry you will use. I recommend the GitHub Container Registry, which uses this form of tag:

    ```
    docker build -t ghcr.io/ACCOUNT/IMAGE-NAME:TAG-NAME
    ```

12. (Optional) If you are building a container to share or run elsewhere, you must now push it to the registry:

    ```
    docker push ghcr.io/ACCOUNT/IMAGE-NAME:TAG-NAME
    ```

    Generally, in order to push to a registry you must first log into that registry through `docker`:

    ```
    docker login
    # logs you into the Docker Hub

    docker login ghcr.io
    # logs you into the GitHub Container Registry
    ```

## Run your Container

1.  There are two modes of running a container:

    - `docker run -d` - detached mode
    - `docker run -it` - interactive/TTY mode

    ```
    docker run -d -p 8080:80 nginx
    # runs a service independently from your shell.
    ```

    ```
    docker run -it ubuntu /bin/bash
    # requires you pass in a command to run
    docker run -it ubuntu date
    docker run -it ubuntu whoami
    ```

2.  Map ports as needed. To map a port, use the `-p` flag. The host machine's port is to the left of the `:` and the container port is to the right:

    ```
    docker run -d -p 8080:80 nginx
    ```

    You could now open a browser (if working on your own laptop) to http://127.0.0.1:8080/ to preview your app. Or use the opened port in your GitHub Codespace.

3.  Inject ENV variables as needed. This is a KEY-VALUE mapping using the `-e` flag:

    ```
    docker run -d -e MYKEY="somevalue" MY-IMAGE
    ```

4.  Mount storage volumes as needed. This is a mapping of a host directory path to the left of the colon and the container path to the right, using the `-v` flag:

    ```
    docker run -d -v /home/data1:/mnt/data1 MY-IMAGE
    ```

## Work with your Containers

### List

To view all running containers:

```
$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED      STATUS      PORTS     NAMES
7a60cfb1c377   ubuntu    "/bin/bash"   6 minutes ago   Up 6 days             priceless_bell
```

### Stop

To stop a running container, find the container ID:

```
docker stop 7a60
```

### Interact With

To effectively "shell" into an already-running container, use `docker exec` with the container ID of your target container. You must also give the process/command you want to run:

```
docker exec -it 7a60 /bin/bash
```
At this point you will be root "within" the container, and can inspect any logs, `env` values, etc. that you wish to.

### Logs

To watch the `stdout` logs of your dockerized application:

```
docker logs 7a60
```
or
```
docker logs --follow 7a60
```

## :white_check_mark: Test Your Skills! 

**TRY THIS**: Run a container in interactive mode, passing in an environment variable, while running a command that will print out that variable to the screen.

