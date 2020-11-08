# テーブル設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birthday         | string | null: false               |

### Association

- has_many :items
- has_many :purchases, though: room_users

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| item_name     | string     | null: false                    |
| item_text     | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| postage       | string     | null: false                    |
| delivery_area | string     | null: false                    |
| delivery_time | string     | null: false                    |
| price         | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル
| Column    | Type       | Options                                      |
| --------- | ---------- | -------------------------------------------- |
| user_id   | references | null: false, foreign_key: true               |
| item_id   | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- has_one    :address

## address テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| zipcode    | string | null: false |
| prefecture | string | null: false |
| city       | string | null: false |
| address    | string | null: false |
| phone      | string | null: false |

### Association
- belongs_to :purchase