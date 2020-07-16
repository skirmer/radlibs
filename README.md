# Radlibs for Python or R

Welcome! This is a small, fun package. Remember MadLibs from childhood roadtrips? This is something of
a parody of that, updated a bit.

Please visit the subfolders here to find the R or Python versions as you prefer.

## Quick Start
Just pass the main function a string that includes any number of the following words, enclosed in curly braces, and it will fill in something (hopefully) funny!

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

We're on pypi and CRAN!

```
pip install radlibs
```

```
install.packages(radlibs)
```

## Versions

| Language | Package | Available From |
|-|-|-|
| Python | [`radlibs`](https://github.com/skirmer/radlibs/tree/master/radlibs-py) | [![PyPI version](https://badge.fury.io/py/radlibs.svg)](https://badge.fury.io/py/radlibs) |
| CLI | [`radlibs`](https://github.com/skirmer/radlibs/tree/master/radlibs-cli) | Currently just github |
| R | [`radlibs`](https://github.com/skirmer/radlibs/tree/master/radlibs-r) | [![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version-last-release/radlibs)](https://cran.r-project.org/package=radlibs) [![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/grand-total/radlibs)](https://cran.r-project.org/package=radlibs) ||

[![Build Status](https://travis-ci.org/skirmer/radlibs.svg?branch=master)](https://travis-ci.org/skirmer/radlibs)
[![codecov](https://codecov.io/gh/skirmer/radlibs/branch/master/graph/badge.svg)](https://codecov.io/gh/skirmer/radlibs)

## Credits

My thanks to https://github.com/tomasengelthaler/HumorNorms for the default dataset of words with
humor ratings. Thanks to https://www.kaggle.com/vered1986/propernames-categories/version/1 for
the list of proper nouns I started with.
