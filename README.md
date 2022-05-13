# DB設計
## users テーブル

| Column              | Type   | Options                  |
| ------------------  | ------ | ------------------------ |
| name                | string | null: false              |
| kana                | string | null: false              |
| gender_id           | integer| null: false              |
| phone_number        | string | null: false              |
| postal_code         | string | null: false              |
| prefecture_id       | integer| null: false              |
| city                | string | null: false              |
| street              | string | null: false              |
| building            | string |                          |
| know_id             | integer| null: false              |
| email               | string | null: false ,unique: true|
| birthday            | date   | null: false              |
| text                | text   |                          |

### Association
- has_many :outpatients



## outpatients テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------  | -----------------------------  |
| text                | string     |                                |
| price               | string     | null: false                    |
| day_id              | datetime   | null: false                    |
| user_id             | references | null: false, foreign_key:true  |

### Association
- belongs_to :user