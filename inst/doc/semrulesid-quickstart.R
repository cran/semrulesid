## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(semrulesid)

## ----basic-id-----------------------------------------------------------------
model <- '
  L1 =~ Y1 + Y2 + Y3
  L2 =~ Y4 + Y5 + Y6
  L2 ~ L1
'

id(model, lav_fun = "sem")

## ----cfa, eval=FALSE----------------------------------------------------------
# cfa_model <- '
#   L1 =~ Y1 + Y2 + Y3
#   L2 =~ Y4 + Y5 + Y6
#   L1 ~~ L2
# '
# 
# id(cfa_model, lav_fun = "cfa")

## ----scaling------------------------------------------------------------------
scaling(model, lav_fun = "sem")

## ----fit-model, eval = FALSE--------------------------------------------------
# library(lavaan)
# 
# fit <- sem(model, data = my_data)
# 
# id(fit, lav_fun = NA)
# scaling(fit, lav_fun = NA)

## ----piping, eval=FALSE-------------------------------------------------------
# id(model, lav_fun = "sem") |> scaling()
# # or
# library(magrittr)
# id(model, lav_fun = "sem") %>% scaling

## ----reverse-piping,eval=FALSE------------------------------------------------
# scaling(model, lav_fun = "sem") |> id()
# # or
# library(magrittr)
# scaling(model, lav_fun = "sem") %>% id

## ----two-step-----------------------------------------------------------------
id2(model, lav_fun = "sem")

## ----help, eval = FALSE-------------------------------------------------------
# ?id
# ?scaling
# ?get_rules

## ----get-rules----------------------------------------------------------------
cfa_rules <- get_rules(rule = "*", model_type = "cfa")
names(cfa_rules)

