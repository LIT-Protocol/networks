Cayenne has 3 nodes. You can use it in the SDK with this config:

```
const litNodeClient = new LitJsSdk.LitNodeClient({
    alertWhenUnauthorized: false,
    litNetwork: "cayenne",
    debug: true,
  });
```
