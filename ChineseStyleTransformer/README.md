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
