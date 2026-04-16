# Terraform AWS構築テスト

## 概要
Terraformを用いて、AWS上に基本的なWebサーバ環境を構築しました。
VPC、Subnet、Internet Gateway、Route Table、EC2を作成し、user_dataを利用してApacheの自動セットアップまで行っています。

## 構成
Internet→ALB→EC2(Apache)

## 使用リソース
- VPC
- Subnet (Public/Private)
- Internet Gateway
- Route Table
- EC2
- ALB (Application Load Balancer)
- Security Group

## 特徴
- module分割（network / compute / alb）
- Terraformによるインフラ構築
- output / variable を使ったmodule間の値受け渡し
- user_dataを使いWebサーバを自動セットアップ
- ALBを用いたリクエストの分散処理

## 実施したこと
- VPC、Subnet、Internet Gateway、Route Tableの作成
- EC2インスタンスの作成
- Security GroupによるSSH / HTTP通信の許可
- Apacheのインストールと起動 (user_data)
- ブラウザからのWebページ表示確認
- ALBの作成
- Target Group / Listenerの設定
- EC2をターゲットとして登録
- ネットワークを役割でpublicとprivateに分割

## ALBの役割
- ALBを使用することで、クライアントからのHTTPリクエストをEC2に転送する構成としました。直接EC2へアクセスさせるのではなくALBを経由させることで、可用性・拡張性・セキュリティの向上を意識しています。

## 学習中に詰まったこと
- EC2のインターネット接続
  - 原因を切り分けながらルーティングやSecurity Groupを確認
  - 解決日: 2026/04/01

- user_dataの理解
  - スクリプト内容を調査し、自分で記述できるように理解
  - 解決日: 2026/04/07

- ALBのDNSを後で見られるようにしたのにできていない
  - outputファイルの仕様を確認、ルートのmain.tfにもoutput記載
  - 解決日: 2026/04/13 

## 今後やりたいこと
- EC2をPrivate Subnetに移動 (外部非公開化)
- NAT Gatewayの導入
- RDS追加 (3層構成)
- Route53によるドメイン設定
- WAF導入 (セキュリティ強化)
