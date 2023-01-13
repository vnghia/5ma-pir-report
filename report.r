## ---- init ----

library(reticulate)
library(ggplot2)
library(scico)
library(dplyr, quietly = T)
library(tidyverse, quietly = T)
library(reshape2, quietly = T)
library(kableExtra)

knitr::opts_chunk$set(dev = "tikz", echo = F, cache = T)
options(tikzDefaultEngine = "luatex")

## ---- renderer-comparison ----

renderer_tbl <- data.frame(
  renderer = c("Blender", "Libigl", "Pyrender", "Three.js", "Open3D"),
  api = c("Python", "C++", "Python", "Javascript", "Python and C++"),
  headless = c("x", "x", "x", "x", "only in C++"),
  buffer = c("", "x", "x", "x", "x"),
  independent = c("", "x", "x", "x", "x"),
  skinning = c("x", "x", "", "x", "")
)

renderer_tbl %>%
  kbl(
    booktabs = T, escape = F,
    caption = "Rendering engine comparison",
    col.names = c(
      "Rendering engine",
      "API language",
      "Headless",
      "Return buffer",
      "Independent",
      "Support for skinning"
    )
  ) %>%
  kable_styling(latex_options = c("hold_position", "scale_down"))
