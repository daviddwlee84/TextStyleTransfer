#!/bin/bash
# https://zhuanlan.zhihu.com/p/123989641
# set -xeuo pipefail

echo "Install prerequisite..."
# sudo apt install -y python3-dev
# sudo apt install -y build-essential libboost-all-dev cmake zlib1g-dev libbz2-dev liblzma-dev
# sudo apt install -y wget unzip

# with root user
apt install -y python3-dev
apt install -y build-essential libboost-all-dev cmake zlib1g-dev libbz2-dev liblzma-dev
apt install -y wget unzip

echo "Install dependencies..."
python3 -m pip install -r requirements.txt

echo "Setting up kenlm..."
wget -O - https://kheafield.com/code/kenlm.tar.gz | tar xz
mkdir kenlm/build
cd kenlm/build
cmake ..
make -j2

echo "Download THUCNews and Unzip..."
wget https://thunlp.oss-cn-qingdao.aliyuncs.com/THUCNews.zip
# https://www.zhihu.com/question/20523036
# unzip -O cp936 -q THUCNews.zip -d data
unzip -q THUCNews.zip -d data
rm -r data/__MACOSX

echo "Setup NLTK..."
python3 -c "import nltk; nltk.download('punkt')"
