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

### DRY(Don't Repeat Yourself)
RubyにはDRYという原則がある．  
重複してしまっている分はERBによって取り除く．

### パーシャル(Partial)
パーシャルとは，ビュー画面を共通化するために用いられる．  
ビュー内のコードを各機能に分割して書き出し，他のテンプレートでも使い回すことができる機能．  
- 使用方法
  - `_header.html.erb`のように先頭に`_`をつけたファイルを使う
  - `<%= render 'layouts/header' %>`のように呼び出す

### Railsのルーティング
Railsでは，以下のような名前付きルーティングを使用するのが慣例
```html
<a href="about_path">About</a>

<%= link_to "About", about_path %>
```
上のコードは意味的には同じであるが，Railsでは下のコードを用いる．  
これを用いることで，`about_path`や`about_url`といった名前付きルーティングを使えるようになる．  


### Asset Pipeline
詳細については[Railsガイド](https://railsguides.jp/asset_pipeline.html)を参照．  
RailsのAsset Pipelineはデフォルトでは，LESSとよく似たSass言語をサポートする．  
以下の3つの主要な機能が理解の対象になる．
- アセットディレクトリ  
  静的ファイルを目的に分類する標準的な3つのディレクトリが使われている．
  - `app/assets`: 現在のアプリケーション固有のアセット
  - `lib/assets`: 開発チームによって作成されたライブラリ用アセット
  - `vendor/assets`: サードパーティのアセット
- マニフェストファイル
  - Railsではアセットパイプラインの中で読み込み時間を減らすためにCSSやJSを連結している
  - マニフェストファイルを使うことで，アセットをフォのように1つのファイルにまとめるのかをRailsに指示することができる
  - 実際にアセットをまとめる処理を行うのはSprocketsというgem
  - 
- プリプロセッサエンジン
  - 必要なアセットをディレクトリに配置してまとめた後，様々なプリプロセッサエンジンを実行して結合する

**アセットパイプラインの最大のメリット**
> 本番のアプリケーションで効率的になるように最適化されたアセットを自動的に生成できる!
- アセットパイプラインが全てのスタイルシートを結合して1つのcssファイルにまとめる
- それらのファイルに対して不要な空白やインデントを取り除く処理をする
- ファイルを最小化する  
**→ 開発環境と本番環境のどちらにもベストな環境を提供できる**

### Sass
Sassはスタイルシートを記述するための言語で，CSSよりも多くの点が強化されている．  
Sassは`.scss`という拡張子が採用される．　　

Sassが提供する2つの重要な機能
**ネスト**
- スタイルシート内に共通なパターンがあるときは要素をネストできる

例)
```scss
.center {
  text-align: center;
}

.center h1 {
  margin-bottom: 10px;
}

/* 上記をSassを使って書き換える */
.center {
  text-align: center;
  h1 {
    margin-bottom: 10px;
  }
}
```

```scss
#logo {
  ...
}

#logo:hover {
  ...
}

/* 上記をScssを使って書き換える */
#logo {
  ...
  &:hover {
    ...
  }
}
```

**変数**
- 冗長なコードを削除しより自由な表現を可能にするために定義できる

```scss
h2 {
  color: #777;
}
footer {
  color: #777;
}
```
このように同じカラーコードが出てくる場合などは冗長的であるため，変数を用いて以下のように書き直すことができる．
```scss
$light-gray: #777
h2 {
  color: $light-gray;
}
footer {
  color: $light-gray;
}
```

**統合テスト(Integration Test)**


### Active Record
- データベースとやりとりをするデフォルトのRailsライブラリ
- データオブジェクトの作成/保存/検索のためのメソッドを持つ
- SQLを意識する必要がない

### マイグレーション
- データの定義をRubyで記述することができる
- SQLのDDL(Data Definition Language)が必要ない
  - DDL: データ定義言語と呼ばれ，SQLの命令(CREATE, DROP, ALTER...)などのこと

> モデルのレコードを.destroyしても削除されたオブジェクトはメモリ上にまだ残っている

### 検証(Validation)と有効性(Validity)
モデルのバリデーション機能はテスト駆動開発(TDD)の方が相性が良い
検証のよく使われるケースを以下に示す
- 存在性(presence)
  - `validates :(変数名), presence: true`
- 長さ(length)
  - `validates :(変数名), length: { maximum: 50 }`
- フォーマット(format)
  - `validates :(変数名), format: { with: (正規表現) }`
- 一意性(uniqueness)
- 確認(confirmation)


### データベースのインデックス
RailsのWebサイトでは，トラフィックが多い時に一意性の検証を行なっているのにも関わらず重複するレコードが作成されてしまうことがある．  
このような問題に対してデータベース上のカラムに*インデックス*を追加し，そのインデックスが一意であるようにする．  
- 検索(find)したい時インデックスがないとそのデータを上から全探索する必要がある
- このような方法を全表スキャンと呼ぶ
- インデックスがあると効率的に検索可能になる

インデックスを追加するには，マイグレーションする必要がある．  
`rails g migrate ~`でマイグレーションを作成する．

### パスワードの設定
ユーザー認証を行うときに必須なのがパスワード．  
ユーザーの認証は以下のように進む．
1. パスワードの送信
1. ハッシュ化
1. データベース内のハッシュ化された値との比較

セキュアなパスワードの実装は簡単で，モデルクラス内で`has_secure_password`を呼び出すだけで良い．　　
呼び出すと以下の機能が使えるようになる．
- セキュアにハッシュ化したパスワードをデータベース内の`password_diget`属性に保存可能
- 仮想的な属性(`password`と`password_confirmation`)が使える
- 存在性と値が一致するかのバリデーションも追加される
- `authenticate`メソッドが使える(引数の文字列がパスワードと一致すればUserオブジェクトを返し，一致しなければfalseを返す)

**ただし，`has_secure_password`を使えるようにするには，モデル内に`password_digest`という属性が含まれていなければならない**  
**また，最先端のハッシュ関数である`bcrypt`ライブラリが必要**  


### RESTfulなアクション
routesファイルに`resources :users`を追加するだけで，RESTfulなリソースにするために必要なアクションが作成できる．  

### Strong Parameters

### 認証システム
- ログインの基本的な仕組み
  - ブラウザがログインしている状態を保持
  - ユーザーによってブラウザが閉じられたら状態を破棄する

このような制限や制御の仕組みを**認可モデル(Authorization Model)**という．

### セッション
セッションとは，アクセスの開始から終了までの一連の通信のこと．  
サイトにアクセスしてから一定時間経過することで通信が終了し，これを「1セッション」としてカウントする．  
Railsでセッションを実装する方法として最も一般的なのは，**cookies**を使う方法．　 
- cookies
  - ユーザーのブラウザに保存される小さなテキストデータ
  - あるページから別のページに移動した時にも破棄されない
  - ユーザーIDなどの情報を保存できる


### セッションハイジャック
- 攻撃者があるユーザーのセッションIDのコピーを手に入れてそのユーザーとしてログインする
- この手順は**セッションリプレイ攻撃**と呼ばれる

### セッション固定
- 攻撃者が既にもっているセッションIDをユーザーに使わせるように仕向ける
- 攻撃者がユーザーとセッションを共有する
- ユーザーがログインする直前にセッションを必ず即座にリセットすることで対策可能
- `reset_session`メソッドで可能

### fixture(フィクスチャ)
- テスト時に登録済みユーザーとしてログインしておく必要がある場合がある
- データベースにそのためのユーザーが登録されていなければならない
- Railsではこのようなテスト用のデータを**fixture(フィクスチャ)**で作成できる
- fixtureを使ってテストに必要なデータをtestデータベースに読み込んでおくことができる
- `test/fixtures/~.yml`に記載する．`erb`も使える．