​:bird:
`!proxy-list.txt` cooperate with `*site.dat` file used on remote vps. **ONLY** for proxying some **restricted websites**, such as openai.
- ' direct ' --> geosite:cn --> route to cloudflare-warp
    > webs that I've once met IP block. **remote only**
- ' proxy ' --> geosite:geolocation-!cn --> proxy
    > webs send to remote **local only**
- ' reject ' --> geosite:category-ads-all --> route to block
    > ads, trackings, scams... **local or remote**

Usage:
```json 
 "routing": {
    "domainStrategy": "IPIfNonMatch", //或使用AsIs(请删除)
    "rules": [
        {
            "type": "field",
            "domain": [
                "geosite:cn"//,
                //"full:cloudflare.com",
                //"domain:openai.com",
                //"domain:ai.com",
                //"domain:vpsfree.es",
                //"domain:verycloud.fr",
                //"full:cdn.wzfou.com",
                //"full:dns.pub",
                //"full:p.cfnode1.xyz"
            ],
            "outboundTag": "cloudfare-warp"
        },
        {
            "ip": [
              "geoip:private"
            ],
            "outboundTag": "blocked",
            "type": "field"
        },
        {
            "domain": [
              "geosite:category-ads-all"
            ],
            "outboundTag": "blocked",
            "type": "field"
        }
    ]
 }
```