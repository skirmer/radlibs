# Radlibs for Python


Welcome! This is a small, fun package. Remember MadLibs from childhood roadtrips? This is something of
a parody of that, updated a bit. [There is also an R version of this package: https://skirmer.github.io/radlibs/.](https://skirmer.github.io/radlibs/)

To get started immediately, you can use the base function: `radlibs.make_radlibs()`. Just pass a string that
includes any number of the following words, enclosed in curly braces, and it will fill in something (hopefully) funny!

* noun
* plural
* verb
* adjective
* adverb
* interjection
* celebrity
* place

And I hope to add support for more in the future. If you would like to generate RadLibs for your
own use case, using your own sample of words (joke for family, for example), you can pass in your own
pandas dataframe containing, at minimum, a `word` column and a `pos` column indicating its part of speech.
The contents of both columns need to be all lowercase.

## Advanced usage

If you'd like to repeat one of the generated funny words, then you'll just need to include a numeral at the end of the word you want to replace. For example:

```
>>> radlibs.make_radlibs("I {verb1} the {noun} but then a {noun} {verb1}s me!")
'I paste the mayor but then a cat pastes me!'
```


## I need parts of speech help

If you don't know the parts of speech for a dataset you want to use, I am also including a
function that can assign these for you. While it is not hugely comprehensive, `radlibs.pos_tagger()` will match your dataset to slightly more than 250,000 words already tagged with part of speech.

Happy RadLibbing!

```
>>> radlibs.make_radlibs("Playing RadLibs is like {verb}ing with {noun}s! Interjection!")
'Playing radlibs is like tethering with jams! oink!'
```

```
>>> radlibs.make_radlibs("Python package for {verb}ing {noun}s via {adjective} {noun}s of their {noun}s")
'Python package for stoppering rafts via plane tins of their eggplants'
```


## Installation

We're on pypi!

```
pip install radlibs
```

from the command line should get you everything you need.

## Credits

My thanks to https://github.com/tomasengelthaler/HumorNorms for the default dataset of words with
humor ratings. Thanks to https://www.kaggle.com/vered1986/propernames-categories/version/1 for
the list of proper nouns I started with.
