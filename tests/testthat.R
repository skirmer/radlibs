Sys.setenv("R_TESTS" = "")

library(radlibs)

testthat::test_check('radlibs')
