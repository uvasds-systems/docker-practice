# Docker Practice

## Setup

1. Fork this repository.
2. Open your fork in a GitHub Codespace.
3. Within the Codespace, install the necessary Python packages:

    ```
    pip install -r requirements.txt
    ```

## Write an App

4. Modify / update your code as desired.
5. To preview your app:

    ```
    streamlit run app.py
    ```

6. View your app via the opened port. Repeat this process as necessary.

## Containerize your App

7. Review the contents of `Dockerfile` and edit as necessary.
8. To build your container image:

    ```
    docker build -t SOMENAME .
    ```

9. Debug as necessary.

## Run your Container

10. See in-class instructions. Remember there are two modes of running a container:

  - `docker run -d` - detached mode
  - `docker run -it` - interactive/TTY mode

11. Map ports as needed.
12. Inject ENV variables as needed.
13. Mount storage volumes as needed.
