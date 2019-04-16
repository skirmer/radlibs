# RadLibs

Welcome! This is a small, fun package. Remember MadLibs from childhood roadtrips? This is that, but
updated a bit.

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

If you don't know the parts of speech for a dataset you want to use, I am also including two 
functions that can assign these for you. `makeWordset()` does it the long/hard way, using NLP 
to assign the part of speech. This function is powerful, but it can be slow.

For the easier, quicker, but less powerful way, you can just match up to the default words list from the 
`lexicon` package using the `fastPOStagger()` function. 

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
PS: download `spongebob` or `cowsay` from CRAN to make things extra fun!
