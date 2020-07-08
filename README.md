这是一个基于cloudflare的涩图api，图源是[laosepi/setu](https://github.com/laosepi/setu)  

使用方法：  
1. 先安装wrangler，具体方法请参考[cloudflare文档](https://developers.cloudflare.com/workers/)  
2. `yarn`安装依赖  
3. 更改wrangler.toml里的accountId，其他配置请看[cloudflare文档](https://developers.cloudflare.com/workers/)  
4. `wrangler publish`  
5. 现在就可以访问`https://你的域名/setu`来获取涩图啦  