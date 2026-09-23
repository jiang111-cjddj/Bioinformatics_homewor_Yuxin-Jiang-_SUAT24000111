- # AI Verification Log

  ## AI-assisted task

  AI was used to guide the construction of the DESeq2 analysis workflow, including data-quality checks, sample metadata verification, construction of the DESeqDataSet with `~ batch + condition`, extraction of the treated-versus-control contrast, apeglm log2 fold-change shrinkage, PCA generation, and result export.

  ## Independent verification

  I independently ran the R commands and checked the resulting outputs. I verified that the count matrix contained 1,000 genes and 12 samples, that the count values were non-negative integers, and that count-matrix columns exactly matched metadata row names. I verified that condition and batch were factors and that control was the reference level. I inspected `resultsNames(dds)` and confirmed that `condition_treated_vs_control` was the relevant coefficient. I independently checked the final DEG counts using `padj < 0.05` and `|shrunken log2FoldChange| >= 1`, obtaining 60 significant genes, including 36 upregulated and 24 downregulated genes. I also inspected the PCA and MA plots before using them in the final interpretation.
