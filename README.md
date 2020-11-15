# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to             :user
- has_one                :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_time

## purchases テーブル
| Column    | Type       | Options                                      |
| --------- | ---------- | -------------------------------------------- |
| user      | references | null: false, foreign_key: true               |
| item      | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address テーブル
| Column        | Type       | Options                                      |
| ------------- | ---------- | -------------------------------------------- |
| zip_code      | string     | null: false                                  |
| prefecture_id | integer    | null: false                                  |
| city          | string     | null: false                                  |
| building      | string     |                                              |
| address       | string     | null: false                                  |
| phone         | string     | null: false                                  |
| purchase      | references | null: false, unique: true, foreign_key: true |

### Association
- belongs_to             :purchase
- belongs_to_active_hash :prefecture