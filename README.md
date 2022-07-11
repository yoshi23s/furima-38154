# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name-kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------  | ------     | ------------------------------ |
| item_name               | string     | null: false                    |
| item_info               | text       | null: false                    |
| category                | string     | null: false                    |
| status                  | string     | null: false                    |
| shipping_fee_status     | string     | null: false                    |
| item_prefecture         | string     | null: false                    |
| item_scheduled-delivery | string     | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column   | Type       | Options                        |
| -------- | ------     | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| shipping | references | null: false, foreign_key: true |
| seller   | string     | null false                     |
| buyer    | string     | null false                     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column       | Type       | Options                       |
| -------------| -------    | ----------------------------- |
| postal_code  | integer    | null false                    |
| prefecture   | strings    | null false                    |
| city         | strings    | null false                    |
| address      | strings    | null false                    |
| building     | strings    | null false                    |
| phone_number | blight     | null false                    |
| order        | references | null false, foreign_key: true |

### Association

- belongs_to :order