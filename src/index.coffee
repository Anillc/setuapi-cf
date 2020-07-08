{ Application, Router } = require '@cfworker/web'

setuUrl = 'https://api.github.com/repos/laosepi/setu/git/trees/1383ad40b259f7b73989f62b298e230aa0dc0fdf'
jsd = 'https://cdn.jsdelivr.net/gh/laosepi/setu/pics/'
ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'

random = (min, max) -> parseInt Math.random() * (max - min + 1) + min, 10

router = new Router()

router.get '/setu', ({ res }) ->
  init =
    headers:
      'User-Agent': ua
  setuList = (await (await fetch setuUrl, init).json()).tree
  setuPath = setuList[random 0, setuList.length].path
  setu = await fetch jsd + setuPath
  res.type = 'image/png'
  res.body = await setu.arrayBuffer()

cors = ({ res }, next) ->
  res.headers.set 'access-control-allow-origin', '*'
  await next()

new Application()
  .use cors
  .use router.middleware
  .listen()