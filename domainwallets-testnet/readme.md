This network has 3 nodes. You can use it in the SDK with this config:

```
const litNodeClient = new LitJsSdk.LitNodeClient({
    alertWhenUnauthorized: false,
    litNetwork: "custom",
    bootstrapUrls: [
      "http://polygon-mumbai.litgateway.com:7470",
      "http://polygon-mumbai.litgateway.com:7471",
      "http://polygon-mumbai.litgateway.com:7472",
    ],
    debug: true,
    minNodeCount: 2,
  });
```
