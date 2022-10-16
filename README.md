# My-Xray-Docker-Compose

I use docker-compose to deploy xray. If your want to use my configuration or create your own, your can refer to the following setps

## Deploy

Firstly, clone this project locally

``` shell
git clone https://github.com/zesty39/xray-docker-compose
```

Secondly, your must set these environment variables

``` shell
export XRAY_DOMAIN="example.com"
export XRAY_UUID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
export XRAY_WS_PATH="/ws-path"
export XRAY_EMAIL="user@example.com"
```

Then, running `gen-xray-config.sh` script to generate xray configuration

``` shell
./gen-xray-config.sh
```

Lastly, deploying by docker-compose

``` shell
docker-compose up
```
