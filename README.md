# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、次の教材で作られたサンプルアプリケーションです。
[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
（第7版）
[Michael Hartl](https://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードはMITライセンスとBeerwareライセンスのもとで公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ gem install bundler -v 2.3.14
$ bundle _2.3.14_ config set --local without 'production'
$ bundle _2.3.14_ install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事にパスしたら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

詳しくは、[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
を参考にしてください。


## 以下，学んだことを書いていく
### コントローラーの作成，削除
```
コントローラーを作成
$ rails g controller Sample
コントローラーの作成を取り消し
$ rails destroy controller sample
```

### モデルの作成，削除
```
モデルの作成
$ rails g model Sample
モデルの作成を取り消し
$ rails destroy model Sample
```

### データベースのマイグレーション
```
マイグレーション
$ rails db:migrate
マイグレーションの取り消し
$ rails db:rollback
```

### HTTPメソッドについて
HTTPには4つの基本的な操作がある．
- GET:
  - Web上のデータを読み取るとき
- POST:
  - ページ上のフォームに入力した値をブラウザから送信するとき
- PATCH:
  - サーバー上の何かを更新するとき
- DELETE:
  - サーバー上の何かを削除するとき
