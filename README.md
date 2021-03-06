# README

<br>

# アプリ名 整骨院管理アプリ「BLUE Management」

<br>

# 概要
整骨院向けの管理アプリです。(PCのサイズにのみ)
患者様の登録を行うことで、来院時の施術内容や、使用金額を入力することができます。そして入力した情報は
カレンダーを通して確認することができます。
今後の実装としては、予約システムや来院状況や売り上げを分析できるツールを実装していきたいと思います。

<br>

# 本番環境
https://yu-chan-app.herokuapp.com/


### サイトに入るためのパスワード
- ユーザー名：taiki
- パスワード：1456

### ログイン情報  
- ユーザー：儀武大樹
- Eメール：give.taiki1456@gmail.com  
- パスワード：taiki1456  

<br>

# 制作背景(意図)
整骨院を経営している友人から来院者を管理できるアプリを作って欲しいとの依頼があったため作成しました。
<br>

# DEMO

## トップページ
[![Image from Gyazo](https://i.gyazo.com/f7a28f9e8e8d21dea55785b23a5aa611.gif)](https://gyazo.com/f7a28f9e8e8d21dea55785b23a5aa611)
新患登録、患者様情報、分析ツール、予約ツール、管理者編集、ログアウトのアイコンがあります。
また、直近の来院者を15件まで表示します。(ページネーション)
## USER新規登録ページ
[![Image from Gyazo](https://i.gyazo.com/47bfbf9d44eaa51f86da98e9c3c3a586.gif)](https://gyazo.com/47bfbf9d44eaa51f86da98e9c3c3a586)
新患の情報を入力することができます。基本情報から、既往歴や禁忌(NG治療)、特記事項などを入力することができます。
## USER一覧ページ
[![Image from Gyazo](https://i.gyazo.com/72445cc5553274a7683738445881aca2.png)](https://gyazo.com/72445cc5553274a7683738445881aca2)
患者様の一覧ページです。ID、名前、性別、生年月日(年齢)を一覧表示しています。
## USERの詳細ページ
[![Image from Gyazo](https://i.gyazo.com/cacf28e3473075302504788688a1bf3a.gif)](https://gyazo.com/cacf28e3473075302504788688a1bf3a)
登録した患者様の詳細情報を見ることができます。USER画像は主に患者様の姿勢の写真を登録します。
## USERごとのカレンダーページ
[![Image from Gyazo](https://i.gyazo.com/e2670ce231710322ea97e5103986883d.gif)](https://gyazo.com/e2670ce231710322ea97e5103986883d)
USERごとにそれぞれカレンダーを表示します。日程を選択し、料金、施術内容、特記事項を登録することができます。登録した日にちの枠は黄色になり、使用料金と特記事項を入力した場合はイラストが表示されます。料金と特記事項のイラストをクリックすると、詳細ページに遷移します。
## カレンダー詳細ページ
[![Image from Gyazo](https://i.gyazo.com/01d73a43348cd2275a76f7d23b03c4be.gif)](https://gyazo.com/01d73a43348cd2275a76f7d23b03c4be)
入力した情報を見ることができます。また、編集と削除を行うことができます。
## 予約システム
[![Image from Gyazo](https://i.gyazo.com/1c218f0c758a0c23031df6d5b031e421.png)](https://gyazo.com/1c218f0c758a0c23031df6d5b031e421)
予約がない時間帯は「○」、予約済みの時間帯は「×」を表示しています。「○」の部分を押すと予約入力ページに遷移します。

<br>

# 工夫したポイント
来院者の情報をカレンダーで見られるようにしたところです。

<br>

# 使用技術(開発環境)
## バックエンド
Ruby,Ruby on Rails 

## フロントエンド
HTML,JavaScript,Ajax

## データベース
MySQL,SequelPro

## Webサーバー(本番環境)
heroku

## アプリケーションサーバー(本番環境)
heroku

## ソース管理
GitHub,GitHubDesktop

## テスト
Rspec(未実施)

## エディタ
VScode

<br>

# 課題や今後実装したい機能
課題としては、来院者の情報のデータ（性別、年齢、どこで知ったかなど）や来院時のデータ（どのような施術を行なったか、来院数など）を分析し、集客に繋げるためのツールを作成できていないところです。また、予約システムの導入もできていません。整骨院を経営するにあたって、必要な機能を追加実装して整骨院の経営を助けられるようなアプリを作成したいです。

<br>

今後実装したい機能としては以下の通りです。  

- 予約システム
 - 技術不足により詳細ページに遷移できていないため修正
- 分析システム
 - 月毎、週ごとの売り上げや施術内容をグラフ化
 - 来院者全体の情報を表示し分析できる機能
 - 1ヶ月間来院がない方をリスト化
- javascriptで動きをつける
- Rspecでテスト

<br>

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
| medical_history     | text   |                          |
| contraindication    | text   |                          |

### Association
- has_many :outpatients
- has_many :somatics
- has_one_attached :image

<br>

## outpatients テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------  | -----------------------------  |
| text                | string     |                                |
| price               | string     | null: false                    |
| day                 | datetime   | null: false                    |
| user_id             | references | null: false, foreign_key:true  |

### Association
- belongs_to :user

<br>


## somatics テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------  | -----------------------------  |
| user_id             | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- has_many_attached :images

<br>

## admins テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------  | -----------------------------  |
| name                | string     | null: false                    |
| email               | string     | null: false ,unique: true      |

### Association
- belongs_to :user
- has_many_attached :images



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------  | -----------------------------  |
| day                | date       | null: false                    |
| time               | string     | null: false ,unique: true      |
| start_time         | datetime   | null: false                    |
| user_id            | references | null: false, foreign_key:true  |

### Association
- belongs_to :user