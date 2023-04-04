# テーブル設計

## usersテーブル

| Column          | Type   | Option                              |
| --------------- | ------ | ----------------------------------- |
| nickname        | string | null: false                         |
| email           | string | null: false, default: "@"           |
| password        | string | null: false, default: ""            |
| first_name      | string | null: false                         |
| last_name       | string | null: false                         |
| first_name_kana | string | null: false                         |
| last_name_kana  | string | null: false                         |
| birthday        | date   | null: false                         |

## itemsテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false, default: ""       |
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| detail_category  | string     | null: false                    |
| detail_situation | string     | null: false                    |
| delivery_load    | string     | null: false                    |
| delivery_region  | string     | null: false                    |
| delivery_days    | string     | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

## historiesテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

## deliveries
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false, default: "-"      |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |
| history_id       | references | null: false, foreign_key: true |
