
"""Function for creating reference of parts of speech
"""


def _generate_word_options():
    worddict = {}

    noun = {
        "descriptors": ["noun", "noun phrase"],
        "wordtype": "noun",
        "regex": "\{[nN]oun\}",
    }

    repeatnoun = {
        "descriptors": ["noun", "noun phrase"],
        "wordtype": "noun",
        "regex": "\{[nN]oun\d\}",
    }

    adverb = {"descriptors": ["adverb"], 
        "wordtype": "adverb", 
        "regex": "\{[aA]dverb\}"}

    repeatadverb = {"descriptors": ["adverb"], 
        "wordtype": "adverb", 
        "regex": "\{[aA]dverb\d\}"}

    plural = {"descriptors": ["plural"], 
        "wordtype": "plural",
        "regex": "\{[pP]lural\}"}

    repeatplural = {"descriptors": ["plural"], 
        "wordtype": "plural",
        "regex": "\{[pP]lural\d\}"}

    verb = {
        "descriptors": ["verb (transitive)", "verb"],
        "wordtype": "verb",
        "regex": "\{[vV]erb\}",
    }

    repeatverb = {
        "descriptors": ["verb (transitive)", "verb"],
        "wordtype": "verb",
        "regex": "\{[vV]erb\d\}",
    }

    adjective = {
        "descriptors": ["adjective"],
        "wordtype": "adjective",
        "regex": "\{[aA]djective\}", 
    }

    repeatadjective = {
        "descriptors": ["adjective"],
        "wordtype": "adjective",
        "regex": "\{[aA]djective\d\}", 
    }

    interjection = {
        "descriptors": ["interjection"],
        "wordtype": "interjection",
        "regex": "\{[iI]nterjection\}",
    }

    repeatinterjection = {
        "descriptors": ["interjection"],
        "wordtype": "interjection",
        "regex": "\{[iI]nterjection\d\}",
    }

    place = {
        "descriptors": ["city", "state", "country", "region", "place"],
        "wordtype": "place",
        "regex": "\{[pP]lace\}",
    }

    repeatplace = {
        "descriptors": ["city", "state", "country", "region", "place"],
        "wordtype": "place",
        "regex": "\{[pP]lace\d\}",
    }

    celebrity = {
        "descriptors": ["celebrity", "president", "hero", "character"],
        "wordtype": "celebrity",
        "regex": "\{[cC]elebrity\}",
    }
    
    repeatcelebrity = {
        "descriptors": ["celebrity", "president", "hero", "character"],
        "wordtype": "celebrity",
        "regex": "\{[cC]elebrity\d\}",
    }

    worddict = {
        "noun": noun,
        "repeatnoun": repeatnoun,
        "adverb": adverb,
        "repeatadverb": repeatadverb,
        "plural": plural,
        "repeatplural": repeatplural,
        "verb": verb,
        "repeatverb": repeatverb,
        "adjective": adjective,
        "repeatadjective": repeatadjective,
        "interjection": interjection,
        "repeatinterjection": repeatinterjection,
        "place": place,
        "repeatplace": repeatplace,
        "celebrity": celebrity,
        "repeatcelebrity": repeatcelebrity,
    }

    return worddict
