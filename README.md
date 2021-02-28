概要：フリーマーケットのアプリケーションです、会員登録をすると商品の出品、購入、編集、削除が出来ます。</br>
AWSを使用してますので商品画像が消えずに残ります（2021/2/28より課金終了の為、一時停止中...）

Herokuにて公開しております</br>
URL:https://furima-31719.herokuapp.com/

#使用技術</br>
Ruby/Ruby on Rails/MySQL/RSpec/Github/Visual Studio Code/Javascript

#ER図は「furimaER.dio」にあります（Draw.io Integrationを使用しました）

#RSpecでテストコードを書いてあります。

#N+1問題が起こらないようにコードを記述してあります。

# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |
## アソシエーション
* has_many :items
* has_many :buys

## itemsテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| exp            | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| send_burden_id | integer    | null: false                    |
| send_area_id   | integer    | null: false                    |
| send_day_id    | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
## アソシエーション
* has_one :buy
* belongs_to :user

## buysテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
## アソシエーション
* belongs_to :item
* has_one :address
* belongs_to :user

## addressesテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post         | string     | null: false                    |
| send_area_id | integer    | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| build        | string     |                                |
| tel          | string     | null: false                    |
| buy          | references | null: false, foreign_key: true |
## アソシエーション
* belongs_to :buy
