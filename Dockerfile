FROM rocker/binder

USER root

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite(c("impute", "globaltest", "GlobalAncova", "Rgraphviz", "preprocessCore", "SSPA", "sva", "pcaMethods", "KEGGgraph", "genefilter", "limma", "siggenes"))'
RUN Rscript -e 'install.packages(c("Rserve", "ellipse", "scatterplot3d", "Cairo", "randomForest", "caTools", "e1071", "som", "RJSONIO", "ROCR", "pheatmap", "Rcpp", "pROC", "data.table", "car", "fitdistrplus", "lars", "Hmisc", "magrittr", "methods", "xtable", "pls", "caret", "lattice", "igraph", "gplots", "reshape", "RColorBrewer", "tibble", "plotly"))'
RUN apt-get update && apt-get install -y curl && apt-get clean
RUN Rscript -e 'install.packages("devtools"); devtools::install_github("xia-lab/MetaboAnalystR", build_vignettes=TRUE)'

USER ${NB_USER}
