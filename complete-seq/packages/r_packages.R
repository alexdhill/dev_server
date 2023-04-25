install.packages(c(
	'devtools',
	'tidyverse',
	'here',
	'ggplot',
	'ggsci',
	'ggthemes',
	'ggpubr',
	'ggsignif',
	'ggforce',
	'ggupset',
	'ggrepel',
	'ggmisc',
	'extrafont',
	'viridis',
	'rjson',
	'patchwork',
	'languageserver'
))

install.packages("BiocManager", repos="https://cran.rstudio.com")
BiocManager::install(update=TRUE, ask=FALSE)
BiocManager::install(c(
	'devtools',
	'tximeta',
	'summarizedExperiment',
	'SingleCellExperiment',
	'seurat',
	'HDF5Array',
	'DESeq2',
	'ComplexHeatmap',
	'survival',
	'survminer',
	'rGREAT',
	'GenomicRanges',
	'BSgenome.Hsapiens.UCSC.hg38',
	'BSgenome'
))
