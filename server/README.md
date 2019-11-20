# README

サーバ班向けのREADME

## 起動/実行方法

クローンする場所は, /Users/rails/Work/TkmtLabGo を想定.

それ以外の場所にインストールする場合は,
plist, shを更新してください.

## Launchd 起動方法


cd /Users/rails/Work/TkmtLabGo/server
launchctl load TkmtLabGO.plist
launchctl start TkmtLabGO

## 終了時に
launchctl stopを使用すると異常終了になる可能性があるので,
docker-compose -f docker/docker-compose.yml downの使用を推奨.

