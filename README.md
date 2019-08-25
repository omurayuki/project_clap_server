# README

- ER図
<img width="1011" alt="Screen Shot 2019-04-19 at 19 24 09" src="https://user-images.githubusercontent.com/39009922/56420529-3d74c980-62d9-11e9-8c8c-28af2a09f8b6.png">

使い方
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。 その後、次のコマンドで必要になる RubyGems をインストールします。
```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。
```
$ rails db:migrate
```
最後に、テストを実行してうまく動いているかどうか確認してください。
```
$ rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。
```
$ rails server
```
