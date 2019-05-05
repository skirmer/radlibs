[![Build Status](https://travis-ci.org/skirmer/radlibs.svg?branch=master)](https://travis-ci.org/skirmer/radlibs) 
[![codecov](https://codecov.io/gh/skirmer/radlibs/branch/master/graph/badge.svg)](https://codecov.io/gh/skirmer/radlibs)

# RadLibs

Welcome! This is a small, fun package. Remember MadLibs from childhood roadtrips? This is something of 
a parody of that, updated a bit.

To get started immediately, you can use the base function: `makeRadlibs()`. Just pass a string that
includes any number of the following words, and it will fill in something (hopefully) funny!

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
> spongebob::spongebobsay(radlibs::makeRadlibs("Playing RadLibs is like verbing with nouns! Interjection!"))
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
> cowsay::say(radlibs::makeRadlibs("R package for verbing nouns via adjective nouns of their nouns"), by = "pig")


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

## Installing

We aren't on CRAN yet, but it's in the works. For the moment, please clone this repo and then 
run `devtools::install` from inside the main folder.

## Credits

My thanks to https://github.com/tomasengelthaler/HumorNorms for the default dataset of words with 
humor ratings. Thanks to https://www.kaggle.com/vered1986/propernames-categories/version/1 for 
the list of proper nouns I started with.
