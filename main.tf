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
  # credentials = file("../../Developer/TerraformTutorial/ServiceAccountKey/terraform-tutorial-342404-0f01196fb921.json")
  credentials = file(var.credentials_file) // variablesで定義した値を使用

  // プロジェクトID
  # project = "terraform-tutorial-342404"
  # region  = "us-central1"
  # zone    = "us-central1-c"
  project = var.project
  region = var.region
  zone = var.zone
}

// 実際に使用するリソース
// リソースタイプ、リソース名の順でブロックの前に書かれている。そして、リソースタイプ.リソース名でIDが作られる
resource "google_compute_network" "vpc_network" {
  // リソースは引数をとり必須のものオプショナルなものそれぞれ存在する。https://registry.terraform.io/providers/hashicorp/google/latest/docs
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
      # image = "debian-cloud/debian-9"
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}



// 上記ファイル作成後にやること

// terraform init  - providersをダウンロード。.terraformディレクトリが作成される

// terraform fmt　　- フォーマット

// terraform validate  - 文法や一貫性があるかなどのチェック

// terraform apply  - 実際にリソースの作成。リソースを管理するための terraform.tfstate が作成される。これはクレデンシャルを含むので取扱注意

// terraform show  - リソースの確認

// terraform destroy - リソース削除
