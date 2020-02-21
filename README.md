# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_furigana|string|null: false|
|last_furigana|string|null: false|
|birthday|integer|null: false|
|emil|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :items
- has_many :orders
- has_one :credit_card
- has_one :address

---------------------------------------------------------------

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false, index: true|
|stock_status|boolean|null: false, default: true|
|condition_id|integer|null: false, foreign_key: true|
|shipping_fee_who_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|shipping_days_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- has_many :item_images
- has_one :order
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_who
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_days

---------------------------------------------------------------

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

---------------------------------------------------------------

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

---------------------------------------------------------------

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

### Association
- has_many :items
- has_ancestry

---------------------------------------------------------------

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

---------------------------------------------------------------

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

---------------------------------------------------------------

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|address1|string|null: false|
|address2|string|null: false|
|building_name|string|
|phone_number|integer|
|prefecture_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture
