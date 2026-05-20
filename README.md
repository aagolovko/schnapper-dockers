Start ngrok with:

```
docker run -d \
  --name ngrok_vpn_tunnel \
  -e NGROK_AUTHTOKEN=$NGROK_AUTHTOKEN \
  -v $(pwd)/configs/ngrok.yml:/ngrok.yml \
  ngrok/ngrok:latest \
  tcp \
  --config /ngrok.yml \
  host.docker.internal:1194
```

```
docker run -d \
  --name ngrok-tunnel \
  -e NGROK_AUTHTOKEN=$NGROK_AUTHTOKEN \
  --network host \
  ngrok/ngrok:latest \
  /usr/local/bin/ngrok http --url=eveline-ahistoric-malisa.ngrok-free.app 80
```