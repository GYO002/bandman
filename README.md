# README

# そうだ、バンドやろうぜ！

# 説明
このアプリケーションは、ユーザーがバンドメンバーを募集したり、
興味のあるバンドを探して、バンド結成ができるアプリです。
バンドのメンバーを集めることは難しいことです。
スキルや必要としている楽器、どんな音楽をやりたいかなど千差万別です。
本アプリはユーザーが手軽にバンドメンバーを探して、
バンド活動ができるように支援するアプリとなっています。


# 使い方
本あプリの機能は以下の通りとなっています。

（１）ユーザー管理機能
 アプリを使用するユーザー情報を管理する機能です。管理項目は以下の通りです。
 ①名前
 ②性別
 ③年齢
 ④担当楽器
 ⑤スキル
 ⑥備考(どんな曲を演奏したいか、活動目的などを記載できます。自分のYouTubeのURL)
 
（２）ユーザー情報詳細画面
 上記で記入した情報ページへ遷移することができます。

（３）ユーザー情報、編集と削除機能
 ユーザー情報を編集・削除することができる機能です。

(4) 投稿機能（メンバー募集）

（5）コメント機能
 ユーザー同士でコミュニケーションが取れる機能です。


# テーブル設計

##usersテーブル
| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| email     | string | NOT NULL    | メール
| password  | string | NOT NULL    | パスワード
| name      | string | NOT NULL    | ニックネーム
| gender    | text   | NOT NULL    | 性別
| age       | text   | NOT NULL    | 年齢
| inst      | text   | NOT NULL    | 担当楽器
| skill     | text   | NOT NULL    | スキル
| remarks   | text   | NOT NULL    | 備考

Association
users has_many post
users has_many comments

##postテーブル
| Column      | Type       | Options     |
| --------    | ---------- | ----------- |
| title       | string     | NOT NULL    | 募集タイトル
| description | text       | NOT NULL    | 募集内容
| future      | string     | NOT NULL    | バンドの将来像の説明
| image       |            | NOT NULL    | 
| user        | references | NOT NULL    |

Association
prototype belong_to users
prototype has_many comments

##commentテーブル
| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | references | NOT NULL    | コメント
| user     | references | NOT NULL    |
| post     | references | NOT NULL    |

Association
comment belong_to users
comment belong_to post