# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birth      | date   | null: false |

### アソシエーション

-has_many :items
-has_many :orders

## items テーブル

| Column           | Type       | Options           |
| -----------------| -----------| ----------------- |
| item_name        | string     | null: false       |
| item_description | text       | null: false       |
| item_price       | text       | null: false       |
| user             | references | foreign_key: true |


### アソシエーション

-belongs_to :user
-has_one    :order

## orders テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ------------------|
| user      | references | foreign_key: true |
| prototype | references | foreign_key: true |

### アソシエーション

-belongs_to :user
-belongs_to :item

## orders_address テーブル

| Column       | Type       | Options           |
| -------------| -----------| ------------------|
| postal_code  | integer    | null: false       |
| city         | string     | null: false       |
| address      | string     | null: false       |
| building     | string     |                   |
| phone_number | integer    | null: false       |
| order        | references | foreign_key: true |

### アソシエーション

-belongs_to :order