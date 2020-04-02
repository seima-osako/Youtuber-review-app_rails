# メモ
- **Dockerコンテナ上でコマンドを実行する方法**
```bash
$ docker exec -it app_container bash
$ bundle exec rails c
```
ここで、app_containerは`docker ps`で起動中のコンテナを指定する。

- **resourcesメソッドのネスト**
どのproductに対するreviewなのかを表すためにresourcesメソッドを入れ子構造にする必要がある。

また、**collection**は、Rails7つのアクション以外のアクション名を定義する時に必要。

`config/routes.rb`

```ruby
TechReviewSite::Application.routes.draw do
  resources :products, only: :show do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  root 'products#index'

end
```
![](./screenshot/2.png)