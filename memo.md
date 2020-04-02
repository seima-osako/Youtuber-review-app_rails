# メモ
- Dockerコンテナ上でコマンドを実行する方法
```bash
$ docker exec -it app_container bash
$ bundle exec rails c
```
ここで、app_containerは`docker ps`で起動中のコンテナを指定する。