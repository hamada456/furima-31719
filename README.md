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
* has_one :user


## buysテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
## アソシエーション
* belongs_to :item
* has_one :address


## addressesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post        | string     | null: false                    |
| add_area_id | integer    | null: false                    |
| city        | text       | null: false                    |
| block       | string     | null: false                    |
| build       | text       |                                |
| tel         | string     | null: false                    |
| buy         | references | null: false, foreign_key: true |
## アソシエーション
* belongs_to :buy
