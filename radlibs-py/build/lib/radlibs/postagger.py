"""Function for assigning part of speech to words
"""

import pandas as pd
import feather
import os


def pos_tagger(word_df):

    this_dir, this_filename = os.path.split(__file__)
    DATA_PATH = os.path.join(this_dir, "data", "pos_lexicon.feather")
    wordset = feather.read_dataframe(DATA_PATH)

    tagged_word_df = pd.merge(wordset, word_df, on="word", how="inner")

    return tagged_word_df
