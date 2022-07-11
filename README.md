# sql_learning

sql学習用

## ルール

練習のためになるべくコマンドはコピーせずに入力すること

## 起動方法

```
// docker-compose.ymlファイルに従ってコンテナ作成、起動
docker compose up -d

// MySqlの起動を確認
docker ps -a

// dockerコンテナに入る(実行中のコンテナでコマンドを実行する)
docker-compose exec db bash

// コンテナから抜ける
exit

// MySqlに接続(コンテナに入っている状態で入力)
mysql -h 127.0.0.1 -P 3306 -u root -p

```

## MySqlコマンド

```
https://qiita.com/CyberMergina/items/f889519e6be19c46f5f4
```

## sql pazzles

http://mickindex.sakura.ne.jp/database/db_support_sqlpuzzle.html#LocalLink-p1

https://msbiskills.com/tsql-puzzles-asked-in-interview-over-the-years/


## sql 問題

https://qiita.com/_hiro_dev/items/ece39759879c5d1f8536