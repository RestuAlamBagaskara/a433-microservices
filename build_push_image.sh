#!/bin/bash

# Hentikan script jika terjadi error
set -e

# Variabel konfigurasi
GITHUB_USERNAME="restualambagaskara"  # Ganti dengan username GitHub Anda
REPO_NAME="item-app"                    # Nama repository GitHub
IMAGE_TAG="v1"
LOCAL_IMAGE_NAME="$REPO_NAME:$IMAGE_TAG" 
IMAGE_NAME="ghcr.io/$GITHUB_USERNAME/$REPO_NAME:$IMAGE_TAG"

# Build Docker image
echo "Membuat Docker image: $LOCAL_IMAGE_NAME..."
docker build -t $LOCAL_IMAGE_NAME .

# Menampilkan daftar image di lokal
echo "Daftar Docker image lokal:"
docker images

# Mengubah nama Image
echo "Menandai ulang image ke format Docker Hub..."
docker tag $LOCAL_IMAGE_NAME $IMAGE_NAME

# Login ke GitHub Container Registry (ghcr.io)
echo "Login ke GitHub Packages..."
echo $PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push Docker image ke GitHub Packages
echo "Mengunggah image ke GitHub Packages..."
docker push $IMAGE_NAME

echo "Image berhasil diunggah ke GitHub Packages: $IMAGE_NAME"
