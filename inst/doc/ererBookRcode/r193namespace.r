# Right after R is started
sa <- sessionInfo(); names; sa
listn  # error: object 'listn' not found

# Loading erer library only
loadNamespace("erer")
sb <- sessionInfo(); sb
listn        # error: object 'listn' not found
erer::listn  # work well

# Attaching erer library
library(erer)
sc <- sessionInfo(); sc
listn        # work well
erer::listn  # work well