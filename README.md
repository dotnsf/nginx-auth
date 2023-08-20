# nginx-auth

## Overview

Sample codeset which runs **nginx** as container wich basic authentication.


## How to use

- Copy your static contents under `docs/` subfolder

- Build docker image with authenticate information:

  - `$ docker build -t yourname/nginx-auth --build-arg BASIC_AUTH_USER="user" --build-arg BASIC_AUTH_PASS="pass" .`

- Run app

  - `$ docker run -d --name nginx-auth -p 8080:8080 yourname/nginx-auth`

  - or

  - `$ docker run -it --name nginx-auth --rm -p 8080:8080 yourname/nginx-auth`

- Browser `http://localhost:8080/`


## References

- https://egashira.dev/blog/basic-auth-nginx-container


## Licensing

This code is licensed under MIT.


## Copyright

2023 [K.Kimura @ Juge.Me](https://github.com/dotnsf) all rights reserved.
