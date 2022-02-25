terraform {
  required_providers {
    google = {
      // 使用するプロバイダーの決定。Terraform Registryの hashicorp/google を使用する
      source = "hashicorp/google"
      // versionはオプショナルだが使用が推奨
      version = "3.5.0"
    }
  }
}

// provider(gcp)を使用するための設定など
provider "google" {
  // GCPプロジェクトのサービスアカウントキー
  credentials = file("../../Developer/TerraformTutorial/ServiceAccountKey/terraform-tutorial-342404-0f01196fb921.json")

 // プロジェクトID
  project = "terraform-tutorial-342404"
  region  = "us-central1"
  zone    = "us-central1-c"
}

// 実際に使用するリソース
// リソースタイプ、リソース名の順でブロックの前に書かれている。そして、リソースタイプ.リソース名でIDが作られる
resource "google_compute_network" "vpc_network" {
  // リソースは引数をとり必須のものオプショナルなものそれぞれ存在する。https://registry.terraform.io/providers/hashicorp/google/latest/docs
  name = "terraform-network"
}



// 上記ファイル作成後にやること

// terraform init  - providersをダウンロード。.terraformディレクトリが作成される

// terraform fmt　　- フォーマット

// terraform validate  - 文法や一貫性があるかなどのチェック

// terraform apply  - 実際にリソースの作成。リソースを管理するための terraform.tfstate が作成される。これはクレデンシャルを含むので取扱注意

// terraform show  - リソースの確認