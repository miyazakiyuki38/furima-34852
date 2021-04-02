# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null false |
| email             | string | null false, unique: true |
| encrypted_password  | string | null false |
| family_name       | string | null false |
| family_name_kana  | string | null false |
| first_name        | string | null false |
| first_name_kana   | string | null false |
| birth_day         | date   | null false |

### Association
- has_many :items
- has_many :orders

# items テーブル

| Column            | Type   | Options     |
| ------       | ---------- | ------------------------------ |
| name         | string     | null false |
| introduction | text       | null false |
| category_id     | integer    | null false |
| condition_id    | integer    | null false |
| trading_status_id | integer    | null false |
| price        | integer    | null false |
| prefecture_id   | integer | null false |
| order_date_id   | integer    | null false |
| user         | references | foreign_key: true |


### Association
belongs_to :user
has_one :order



## orders テーブル

| Column            | Type   | Options     |
| ------       | ---------- | ------------------------------ |
| item         | references | foreign_key: true |
| user         | references | foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル
| Column            | Type   | Options     |
| ------       | ---------- | ------------------------------ |
| post_number  | string      | null false   |
| prefecture_id  | integer  | null false   |
| city          | string     | null false   |
| house_number | string    | null false   |
| order          | references | foreign_key: true |
| building_name | string     |
| phone_number  | string     | null false   |

### Association
belongs_to :order
