Docker image for running official [xray](https://github.com/XTLS/Xray-core) server with VLESS protocol.

# Zero Configuration Run
1. Run docker container
```bash
docker run -d --restart=always --name xray-server -p 443:443 ghcr.io/mullakhmetov/mullakhmetov/xray-server:latest
```
2. Get connection details from logs
```bash
docker logs xray-server
```

## Manual Build With Provided Xray Release
```bash
docker build -t xray-server --build-arg RELEASE=v1.10.3 .
```

## Run
```bash
docker run -d --name xray-server -p 443:443 xray-server
```

## Environment Variables
| Name | Description | Default |
| ---- | ----------- | ------- |
|DEBUG|xray reality debug mode {true|false}|true|
|PORT|xray listen port|443|
|UUID|vless user UUID|{xray uuid}|
|DEST|reality dest|portfolio.newschool.edu:443|
|SERVER_NAME|reality server name|portfolio.newschool.edu|
|PRIVATE_KEY|reality private key|{xray x25519}|

> :warning: If reality private key is not provided, xray will generate a new keypair. Corresponding public key will be printed to stdout.
