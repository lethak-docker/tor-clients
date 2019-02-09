# tor-clients

Inspired by https://github.com/osminogin/docker-tor-simple

Run minimalist containers to connect with the Tor network with multiple circuits on different local ports


### Manual run (optional)

@see https://docs.docker.com/engine/reference/commandline/run/

```bash
docker run --rm --name tor1 --publish "127.0.0.1:11050:11050" "lethak/tor-clients:latest"
docker run --rm --name tor2 --publish "127.0.0.1:11052:11050" "lethak/tor-clients:latest"
docker run --rm --name tor3 --publish "127.0.0.1:11054:11050" "lethak/tor-clients:latest"
docker run --rm --name tor4 --publish "127.0.0.1:11056:11050" "lethak/tor-clients:latest"
```

The last exemple binds port 11050 of the container to TCP port 11056 on 127.0.0.1 of the host machine. You can also specify udp and sctp ports like `127.0.0.1:11056:11050/tcp`. 


### Docker compose (optional)

Start detached:

```bash
cd compose && docker-compose up -d && cd ..
```

Down containers:

```bash
cd compose && docker-compose down && cd ..
```


### Check your Tor IPs

From the host machine: replace 11050 with the desired published port from your Tor containers

```bash
curl --socks5 127.0.0.1:11050 http://checkip.amazonaws.com
curl --socks5 127.0.0.1:11052 http://checkip.amazonaws.com
curl --socks5 127.0.0.1:11054 http://checkip.amazonaws.com
curl --socks5 127.0.0.1:11056 http://checkip.amazonaws.com
```

### Docker image build commands (for contributor)

To build a docker image

```bash
docker build ./images/tor-client -t lethak/tor-clients:latest
```

To push a new tag to this repository (requiring login):

```bash
docker login
docker push lethak/tor-clients:latest
```


### Resources

* https://medium.com/@rdsubhas/docker-image-with-tor-privoxy-and-a-process-manager-under-15-mb-c9e344111b61
* https://stackoverflow.com/questions/14321214/how-to-run-multiple-tor-processes-at-once-with-different-exit-ips?answertab=oldest#tab-top
* https://askubuntu.com/questions/499995/how-to-change-the-ip-address-which-is-given-by-tor-using-the-terminal
* https://gist.github.com/stephonchen/7647575d6a2f063a9973f398ef281db8
* https://github.com/apifytech/apify-js
* https://github.com/talmobi/tor-request#readme