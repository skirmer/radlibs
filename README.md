[![Build Status](https://travis-ci.org/skirmer/radlibs.svg?branch=master)](https://travis-ci.org/skirmer/radlibs) 
[![codecov](https://codecov.io/gh/skirmer/radlibs/branch/master/graph/badge.svg)](https://codecov.io/gh/skirmer/radlibs)

# RadLibs

Welcome! This is a small, fun package. Remember MadLibs from childhood roadtrips? This is something of 
a parody of that, updated a bit.

To get started immediately, you can use the base function: `makeRadlibs()`. Just pass a string that
includes any number of the following words, wrapped in curly braces, and it will fill in something (hopefully) funny!

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
data.table containing, at minimum, a `word` column and a `pos` column indicating its part of speech. 
The contents of both columns need to be all lowercase.

## I need parts of speech help

If you don't know the parts of speech for a dataset you want to use, I am also including a 
function that can assign these for you. While it is not hugely comprehensive, `POSTagger()` will match your dataset to slightly more than 250,000 words already tagged with part of speech. 

Happy RadLibbing!

```
> spongebob::spongebobsay(radlibs::makeRadlibs("Playing RadLibs is like {verb}ing with {noun}s! {Interjection}!"))
 ------------------------------------- 
| PlaYInG RAdlIbs iS LIke cONcrEteInG |
| wItH STrinGS! NonSenSe!             |
 ------------------------------------- 
  \\
   \\    *
          *
     ----//-------
     \..C/--..--/ \   `A
      (@ )  ( @) \  \// |w
       \          \  \---/
        HGGGGGGG    \    /`
        V `---------`--'
            <<    <<
           ###   ###
           
```

```
> cowsay::say(radlibs::makeRadlibs("R package for {verb}ing {noun}s via {adjective} {noun}s of their {noun}s"), by = "pig")


 ----- 
R package for swishing boogies via adept boots of their mooses 
 ------ 
    \   
     \
       _//| .-~~~-.
     _/oo  }       }-@
    ('')_  }       |
     `--'| { }--{  }
          //_/  /_/ [nosig]
```
PS: download `spongebob` or `cowsay` from CRAN to make things extra fun!

## Advanced Usage

If you'd like to repeat one of the generated funny words, then you'll just need to include a numeral at the end of the word you want to replace. For example:

```
> radlibs::makeRadlibs("I {verb1} the {noun} but then a {noun} {verb1}s me!")

'I paste the mayor but then a cat pastes me!'
```

## Installing

Radlibs is available on CRAN, please enjoy! You can also use the Python version via `pip install radlibs-py`. 


## Credits

My thanks to https://github.com/tomasengelthaler/HumorNorms for the default dataset of words with 
humor ratings. Thanks to https://www.kaggle.com/vered1986/propernames-categories/version/1 for 
the list of proper nouns I started with.
