# nebula-action-step
connect to a nebula network in your actions workflow

# setup

You will need the following secrets set up in your repo:

  - NEBULA_CA_CRT: the ca crt from your lighthouse node
  - NEBULA_NODE_CONF: the node conf file, base64 encoded (`cat config.yml | base64 -w 0`)
  - NEBULA_NODE_CRT: the node crt file
  - NEBULA_NODE_KEY: the node key file

# usage

Add the following step in your GHA workflow:

```
- id: set up nebula
  uses: rssnyder/nebula-action-step@0.1.0
  env:
    NEBULA_CA_CRT: ${{ secrets.NEBULA_CA_CRT }}
    NEBULA_NODE_CONF: ${{ secrets.NEBULA_NODE_CONF }}
    NEBULA_NODE_CRT: ${{ secrets.NEBULA_NODE_CRT }}
    NEBULA_NODE_KEY: ${{ secrets.NEBULA_NODE_KEY }}
```