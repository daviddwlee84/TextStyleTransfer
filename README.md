# Text Style Transfer

Style Transfer in Text

## Projects / Dataset

* Non-parallel
  * NTU Hung-yi Lee DLHLP2020 HW5
    * Yelp
  * Chinese Articles

### NTU Hung-yi Lee DLHLP2020 HW5

> [Github - DLHLP2020](https://github.com/DLHLP2020)

* Course
  * [Slide](http://speech.ee.ntu.edu.tw/~tlkagk/courses/DLHLP20/UnsupervisedNLP%20(v2).pdf)
  * [Video](https://youtu.be/WROBoprE0js)
* Homework
  * [HW5-1](https://docs.google.com/presentation/d/1biEDjNL-0wkuizq7GyGU0ec7hn-0dugc3knksdWf_lI/edit?usp=sharing)
  * HW5-2 (not found yet)
  * HW5-3 (not found yet)
  * [Video](https://youtu.be/IBjCkt4eJCg)
  * [Starter Code](https://github.com/MarvinChung/HW5-TextStyleTransfer)
    * It is based on this paper: [Style Transformer](https://arxiv.org/abs/1905.05621) => Text version of [StarGAN](https://arxiv.org/abs/1711.09020)
* Other
  * [Yelp Dataset](https://www.yelp.com/dataset)
    * [Yelp Dataset | Kaggle](https://www.kaggle.com/yelp-dataset/yelp-dataset)
    * [Exploring yelp reviews dataset | Kaggle](https://www.kaggle.com/vksbhandary/exploring-yelp-reviews-dataset)

HW5-1: Understand and train a Text Style Transfer model

1. Modified configurations
   1. show what's different from default
2. Show training curves
   1. plot the three loss in style transformer
   2. plot the discriminator loss
3. Evaluation
   1. report best model's
      1. accuracy
      2. ref-BLEU
      3. perplexity
   2. generate model's output on the 1000 yelp testing data
   3. show some results on sentences (case study)
      1. good examples
      2. bad (problematic) examples
      3. observation

> Baseline: (positive + negative) / 2
>
> accuracy: 0.7
> ref-BLEU: 17
> perplexity: 150

HW5-2: Understand the modules of Sylte Transformer

1. Problem 1
   1. sample one sentence and apply style transfer
   2. show the attention maps and explaination
2. Problem 2
   1. apply style transfer on test data and collect the sentence embedding
   2. visualize the distribution of embedding by T-sne
3. Problem 3
   1. sample one sentence, mask one position at a time and do style transfer
   2. show the results and explaination

```sh
# code has already done (just load the model trained in HW5-1)
python3 main.py --part2 --part2_model_dir=<trained_model_dir> --part2_step=<trained_step>

# all the results could be found under ./part2_output
```

HW5-3

1. Improve your model
   * add dataset (e.g. IMDB dataset) => need to [train an evaluator](https://hackmd.io/NgYXPtOqRCWKHV33L1NofQ?view) (for calculating perplexity and accuracy)
     * Gender: http://tts.speech.cs.cmu.edu/style_models/gender_data.tar
     * Political: http://tts.speech.cs.cmu.edu/style_models/political_data.tar
   * experiment at the discrete part
2. Add more styles
   * styles are not related to positive and negative style
3. Try other models

### Resources of Chinese Corpus

Pre-trained Language Model

* [ymcui/Chinese-BERT-wwm: Pre-Training with Whole Word Masking for Chinese BERT（中文BERT-wwm系列模型）](https://github.com/ymcui/Chinese-BERT-wwm)
* [brightmart/roberta_zh: RoBERTa中文预训练模型: RoBERTa for Chinese](https://github.com/brightmart/roberta_zh)

Corpus

* THUCNews
  * [THUCTC: 一个高效的中文文本分类工具](http://thuctc.thunlp.org/)
  * [Download THUCNews](http://thuctc.thunlp.org/message)
  * Related project
    * [gaussic/text-classification-cnn-rnn: CNN-RNN中文文本分类，基于TensorFlow](https://github.com/gaussic/text-classification-cnn-rnn)

## Model and Code

### Style Transformer

#### DLHLP2020HW5

> Based on the starter code of the [NTU Hung-yi Lee DLHLP2020 HW5](#NTU-Hung-yi-Lee-DLHLP2020-HW5)

Files under `DLHLP2020HW5`

> This will need the fasttext to be exact the version `0.8.3`.

```sh
cd DLHLP2020HW5

# Quick setup (do the Requirements part)
bash setup.sh
# if you face any compilation error while install dependencies
# maybe you need to execute this first
# sudo apt install python3-dev
```

#### Chinese Article

> I use the latest version of fasttext (`0.9.2`)

TODO:

* [ ] Rename some variable names (if we want to keep using this model...), currently I keep using the `pos` and `neg` nameing but for two different domain articles.
* [ ] We might want to keep some information like date unchange while doing style transfer.
  * Found it might be very hard for a style transfer model because of the generator tends to change the "keywords" to pass the discriminator, which might be the information that we want.
