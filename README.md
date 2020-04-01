# レビューサイト

## 概要
DockerとRuby on Railsを用いて簡易なレビューサイトを開発する。(開発中...)

## 環境
- Docker 19.03.8
- Ruby 2.4.5
- Ruby on Rails 5.2.2
- MySQL 5.7

## 開発環境の構築

### 1. webサービスのコンテナ（=railsのコンテナ）上で後ろのコマンドを実行するコマンド + 新しいRailsプロジェクトをDockerfileで定義したappディレクトリに作成

```bash
# --forceは既存ファイルを上書きするオプション
$ docker-compose run web rails new . --force --database=mysql
$ docker-compose build # 再度Dockerfileからイメージをビルドする
```
### 2. config/database.ymlにデータベースに接続するための設定を書き、コンテナ（仮想環境）を起動させる
passwordはMY_SQL_ROOT_PASSWORD環境変数、hostはMYSQLサーバのコンテナのサービス名を追記

現在のディレクトリにあるdocker-compose.ymlに基づいてRails・MySQLコンテナを起動する
```bash
$ docker-compose up
```
### 3. 開発環境用のデータベースを作成
Rails環境にインストールされているrakeコマンドを実行し、`rake db:create`でRailsで使用するデータベースをMySQLサーバ上に作成してくれる。
```bash
$ docker-compose run web bundle exec rake db:create
```

![](./screenshot/1.png)

## 開発手順
### 1. データベースにYoutuberの情報を格納
まず、Youtuberの情報として「名前」と「画像」を扱うためのProductモデルを作るマイグレーションファイルを生成する。

> マイグレーションファイルとはデータベースにテーブルを作成したり、既存のテーブルの定義を変更する場合などに使用する。
```bash
$ docker-compose run web bundle exec rails g model product name:string image_url:text
```
`app/models/product.rb `ではproductsテーブルで作成されたカラムデータを扱える。命名規則により、Productモデルはproductsテーブルと関連付いており、テーブルのレコードをProductモデルのオブジェクトとして利用できる。(O/Rマッパー)
```ruby
# アプリケーションレコードを継承したプロダクトクラスが定義されていることで、モデルとして機能させている。
class Product < ApplicationRecord
end
```
マイグレーションを実行する。
```
$ docker-compose run web bundle exec rake db:migrate
```