# アプリケーション名
DocRelay

# アプリケーション概要
このプロジェクトは書類管理システムです。ユーザーは書類を登録・確認し進捗状況を管理できます。このアプリケーションでは、ActiveHash を利用した固定データの管理と ActiveRecord を利用したデータベースの管理を組み合わせて利用しています。

# 利用方法
## 書類登録・編集機能・詳細機能
・顧客より預かった書類の詳細情報（受領日、手続き開始可能日、手続き日期日、書類名、件数、担当者名）
・不備の有無、手続きの進捗等進捗状況を更新しステータス管理（手続き中、不備、完了）
## チャット機能
・書類に不備等があった際に、営業担当者と事務担当者がやり取り可能。
## カレンダー機能
・日付ごとに書類を視覚的に一覧表示
## ユーザー管理
・社員番号、氏名でユーザー登録をする

# アプリケーションを作成した背景
現職で使用しているシステムは、営業担当者からの預かった書類の処理希望日が1日分のみ入力できる仕組みにでです。窓口の来客数は、予測が難しいのが現状です。処理希望日に幅を持たせることが可能であれば、窓口の来客者数が少ない日には余裕があるため手続きを進めることもでき、業務効率化が図れると考えました。また、現在不備項目は、付箋や口頭で伝えたりと、当事者同士でしかわからないことが現状です。当事者間以外でも不備事項についてのやりとりがわかりやすく記録に残せるようにチャット機能をつけました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1HlieO-kYB4VnnwI9pG3IavFK8WnPykosnW-SXJaRY48/edit?gid=982722306#gid=982722306

# データベース設計


# テーブル構造


### Usersテーブル

| カラム名           | データ型 | 制約                |
|-------------------|----------|--------------------|
| id           | integer  | PK                      |
| user_name         | string   | null: false        |
| employee_number   | string   | null: false, unique|
| encrypted_password| string   | null: false        |
| role_id           | integer  | null: false        |
| created_at        |datetime  |                    |       
| updated_at        | datetime |                    |

### Association

- has_many :documents
- has_many :comments
- belongs_to_active_hash :role

### Documentsテーブル

| カラム名          | データ型 | 制約                           |
|------------------|----------|-------------------------------|
| id               | integer  | PK                            |
| start_dates      | date     | null: false                   |
| due_date         | date     | null: false                   |
| received_date    | date     | null: false                   |
| customer_name    | string   | null: false                   |
| document_name_id | integer  | null: false                   |
| quantity_id      | integer  | null: false                   |
| user_id          | integer  | null: false, foreign_key: true|
| created_at       | datetime |                               |
| updated_at       | datetime |                               |

### Association
- belongs_to :user
- belongs_to_active_hash :document_name
- belongs_to_active_hash :quantity
- belongs_to_active_hash :progress_status




### Commentsテーブル

| カラム名       | データ型   | 制約                            |
|---------------|------------|--------------------------------|
| comment_id    | integer    | PK                             |
| text          | string     | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |
| document_id   | integer    | null: false, foreign_key: true |
| created_at    | datetime   |                                |
| updated_at    | datetime   |                                |

### Association
- belongs_to :user
- belongs_to :document

## DocumentName（ActiveHash）

| カラム名      | データ型  | 制約 |
|--------------|------------|----|
| id           | integer    | PK |
| name         | string     |    |

### Association
has_many :documents

#### データ
- 契約書
- 同意書
- 申込書
- 本人確認資料

## Role（ActiveHash）

| カラム名      | データ型  | 制約 |
|--------------|------------|----|
| id           | integer    | PK |
| name         | string     |    |
### Association
has_many :users
#### データ
- 管理者
- 担当者

## Quantity（ActiveHash）
|カラム名      | データ型  | 制約  |
|--------------|------------|----|
| id           | integer    | PK |
| value        | string     |    |

### Association
- has_many :documents

#### データ
- 1件
- 2件
- 3件
- 4件
- 5件

## ProgressStatus（ActiveHash）
|カラム名      | データ型    | 制約 |
|--------------|------------|-----|
| id           | integer    | PK  |
| status       | string     |     |

### Association
- has_many :documents
#### データ
- 未処理
- 処理済
- 不備