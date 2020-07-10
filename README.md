# 金数据接口

与金数据对接数据接口，官方文档请查阅 <https://help.jinshuju.net/articles/api-intro>

## 安装

1. 在你的 `shard.yml` 中增加依赖:

   ```yaml
   dependencies:
     jinshuju:
       github: your-github-user/jinshuju
   ```

2. 运行 `shards install`

## 使用

```crystal
require "jinshuju"

api = Jinshuju::API.new(host: "somedomain.jinshuju.com", key: "apikey", secret: "apisecret")
puts api.all_entries("Ex2t1y")
```

## 贡献

1. Fork it (<https://github.com/your-github-user/jinshuju/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## 贡献者

