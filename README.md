# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| nickname   | string | null: false               |
| name       | string | null: false               |
| birthday   | string | null: false               |
## アソシエーション
* has_many :items
* has_many :buys


## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| exp         | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| send_price  | string     | null: false                    |
| send_area   | string     | null: false                    |
| send_day    | string     | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
## アソシエーション
* has_one :buys


## buysテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| time       | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
## アソシエーション
* belongs_to :items
* has_one :addresses


## addressesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer_add  | text       | null: false                    |
| post       | string     | null: false                    |
| area       | string     | null: false                    |
| tel        | string     | null: false                    |
| buy        | references | null: false, foreign_key: true |
## アソシエーション
* belongs_to :buys
