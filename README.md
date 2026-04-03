# Terraform AWS構築テスト

## 概要
Terraformを用いて、AWS上に基本的なWebサーバ環境を構築しました。
VPC、Subnet、Internet Gateway、Route Table、EC2を作成し、user_dataを利用してApacheの自動セットアップまで行っています。

## 構成
- VPC
- Subnet
- Internet Gateway
- Route Table
- EC2
- Apache

## 特徴
- module分割（network / compute）
- Terraformによるインフラ構築
- output / variable を使ったmodule間の値受け渡し
- user_dataを使いWebサーバを自動セットアップ

## 実施したこと
- VPC、Subnet、Internet Gateway、Route Tableの作成
- EC2インスタンスの作成
- Security GroupによるSSH / HTTP通信の許可
- Apacheのインストールと起動
- ブラウザからのWebページ表示確認

## 学習中に詰まったこと
- EC2のインターネット接続
  - 原因を切り分けながらルーティングやSecurity Groupを確認
  - 解決日: 2026/04/01

## 今後やりたいこと
- ALB
  - Target Group
  - Listener
  - EC2登録
- サブネット分離
  - Public Subnet (ALB)
  - Private Subnet (EC2)
- RDS追加
- Route53によるドメイン設定
