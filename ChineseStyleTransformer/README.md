# Style Transformer: Unpaired Text Style Transfer without Disentangled Latent Representation

## Before Running

> Just run `setup.sh` and this part will be done automatically

```sh
bash setup.sh
```

Data Preprocessing

```sh
jupyter nbconvert --to notebook --inplace --execute preprocess_for_data_and_evaluator.ipynb
```

## Usage

The hyperparameters for the Style Transformer can be found in `main.py` or with `python main.py -h`.

- To train:

    ```shell
    python main.py --do_train
    ```

- To inference on test set:

    ```shell
    SAVE=./save/Feb15141010/ckpts/2000 # just example
    python main.py --do_test \
    -test_out ./submission.txt \
    -preload_F ${SAVE}_F.pth \
    -preload_D ${SAVE}_D.pth
    ```

    You can modify other parameters to suit your need.

---

## Evaluator

### Fasttext Classifier

Test on 科技 vs. 財經 (dev set)

| Data Count | Precision on one | Recall on one |
| ---------- | ---------------- | ------------- |
| 4000       | 0.87825          | 0.87825       |

---

> Install PyTorch for Cuda 10.1 on linux with pip `pip install torch==1.5.1+cu101 torchvision==0.6.1+cu101 -f https://download.pytorch.org/whl/torch_stable.html`

## Trouble Shooting

locale problem

- [Perl warning Setting locale failed in Debian - Thomas-Krenn-Wiki](https://www.thomas-krenn.com/en/wiki/Perl_warning_Setting_locale_failed_in_Debian)
- [Perl: warning: Setting locale failed in Debian and Ubuntu - nixCraft](https://www.cyberciti.biz/faq/perl-warning-setting-locale-failed-in-debian-ubuntu/)
- [How to solve locale problem in Gnu/Linux (and Docker images) | Emin Mastizada](https://mastizada.com/blog/how-to-solve-locale-problem-in-linux-powered-servers/)
- [12.04 - Cannot set LC_CTYPE to default locale: No such file or directory - Ask Ubuntu](https://askubuntu.com/questions/599808/cannot-set-lc-ctype-to-default-locale-no-such-file-or-directory)

Chinese encoding

- [Reloading a file using a different encoding | Vim Tips Wiki | Fandom](https://vim.fandom.com/wiki/Reloading_a_file_using_a_different_encoding)
- [linux乱码问题:LANG变量的秘诀 - 黄鹏 - 博客园](https://www.cnblogs.com/huangpeng/archive/2009/02/20/1394882.html)
- [environment variables - What does "LC_ALL=C" do? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do)
