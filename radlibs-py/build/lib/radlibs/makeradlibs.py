"""Function for creating a madlib
"""

import pandas as pd
import feather
import random
import re
import os
from radlibs.generatewordopts import _generate_word_options
from radlibs.postagger import pos_tagger


def make_radlibs(phrase, wordset="NA"):

    word_types = _generate_word_options()

    if wordset == "NA":
        this_dir, this_filename = os.path.split(__file__)
        DATA_PATH = os.path.join(this_dir, "data", "humor_dataset.feather")
        wordset = feather.read_dataframe(DATA_PATH)
        wordset = wordset[wordset["mean"] > 1.2]

        wordset = pos_tagger(wordset)
        wordset["pos"] = wordset["pos"].str.lower()

        this_dir, this_filename = os.path.split(__file__)
        DATA_PATH = os.path.join(this_dir, "data", "proper_nouns.feather")

        propernouns = feather.read_dataframe(DATA_PATH)

        propernouns.columns = ["word", "pos"]
        wordset = pd.concat([wordset, propernouns], sort=False)

    for key in word_types:
        regex = re.compile(word_types[key]["regex"])
        descriptors = word_types[key]["descriptors"]
        word_types[key]["count"] = len(regex.findall(phrase))
        word_types[key]["sample"] = random.sample(
            list(wordset[wordset["pos"].isin(descriptors)]["word"]),
            word_types[key]["count"],
        )
        word_types[key]["valueset"] = regex.findall(phrase)
            
    new_phrase = phrase

    for key in word_types:
        count = word_types[key]["count"]
        sample = word_types[key]["sample"]
        regex = re.compile(word_types[key]["regex"])

        if key.startswith("repeat"):
            valueset = list(set(word_types[key]["valueset"]))
            valuecount = len(valueset)
            valuesub = word_types[key]["sample"][0:valuecount]
            res = {valueset[i]: valuesub[i] for i in range(valuecount)}
            for key in res:
                repetitions = phrase.count(key)
                new_phrase = re.sub(
                    key, res[key], new_phrase, count=repetitions
                )
        elif count > 0:
            for word in sample:
                new_phrase = re.sub(
                    regex, word, new_phrase, count=1
                )
        else:
            next

    return new_phrase.capitalize()
