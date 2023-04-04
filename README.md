# テーブル設計

## usersテーブル

| Column             | Type   | Option                                  |
| ---------------    | ------ | --------------------------------------- |
| nickname           | string | null: false                             |
| email              | string | unique: true, null: false, default: "@" |
| encrypted_password | string | null: false, default: ""                |
| first_name         | string | null: false                             |
| last_name          | string | null: false                             |
| first_name_kana    | string | null: false                             |
| last_name_kana     | string | null: false                             |
| birthday           | date   | null: false                             |

### Assosiation
- has_many :item
- has_many :history

## itemsテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| situation _id    | integer    | null: false                    |
| load_id          | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| days_id          | integer    | null: false                    |
| price            | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Assosiation
- belongs_to :user
- has_one :history

## historiesテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Assosiation
- belongs_to :user
- belongs_to :item

## deliveries
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false, default: "-"      |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| history          | references | null: false, foreign_key: true |

### Assosiation
- belongs_to :history
