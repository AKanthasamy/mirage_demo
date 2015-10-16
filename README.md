# Mirage Demo

The docker-compose script in this repo builds a demo environment consisting of the Mirage application, a demo application and a proxy for the demo application.

## Instructions

You need Docker and docker-compose, and a Twitter API key pair.

Set environment variables:

```bash
export TwitterKey=<twitter key>
export TwitterSecret=<twitter secret>
```

Clone the repository:
```bash
git clone https://github.com/SpectoLabs/mirage_demo.git && cd mirage_demo
```

Get the applications:

```bash
git submodule init && git submodule update
```

Launch:

```bash
./up.sh

```

Mirage application: http://{boot2docker-ip}:8001

Demo application: http://{boot2docker-ip}:8080

Proxy UI: http://{boot2docker-ip}:8300/admin  


To update the mirage, twitter-app and twitter-proxy modules:

```bash
git submodule foreach git pull origin master
```
