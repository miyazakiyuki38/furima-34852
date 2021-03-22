# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null false |
| email             | string | null false |
| password          | string | null false, unique: true|
| family_name       | string | null false |
| family_name_kana  | string | null false |
| first_name        | string | null false |
| birth_year        | string | null false |
| birth_month       | string | null false |
| birth_day         | string | null false |
| number_phone      | integer| null false |
| address           | integer| null false |

### Association
- has_many :items
- has_one :orders

# items テーブル

| Column            | Type   | Options     |
| ------       | ---------- | ------------------------------ |
| name         | string     | null false |
| introduction | text       | null false |
| category     | integer    | null false |
| condition    | integer    | null false |
| trading_status | integer    | null false |
| price        | integer    | null false |
| seller_addresses   | string     | null false |
| order_date   | integer    | null false |


### Association
belongs_to :user
has_one :order


## orders テーブル

| Column            | Type   | Options     |
| ------       | ---------- | ------------------------------ |
| item_id      | references | null false   |
| user_id      | references | null false   |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル
| Column            | Type   | Options     |
| ------       | ---------- | ------------------------------ |

| post_number  | integer    | null false   |
| prefectures  | string     | null false   |
| city         | string     | null false   |
|street number | integer    | null false   |

### Association
belongs_to :oder
