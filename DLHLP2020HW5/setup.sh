#!/bin/bash
# https://zhuanlan.zhihu.com/p/123989641
# set -xeuo pipefail

echo "Install dependencies..."
python3 -m pip install -r requirements.txt

echo "Download language model as evaluator for Yelp..."
wget https://raw.githubusercontent.com/circulosmeos/gdown.pl/master/gdown.pl
perl gdown.pl https://drive.google.com/file/d/1pklyWxzNPPxnKNy_TmA8h_tmGmiZttPN/view ppl_yelp.binary
mv ppl_yelp.binary evaluator/
rm gdown.pl

echo "Setup NLTK..."
python3 -c "import nltk; nltk.download('punkt')"
