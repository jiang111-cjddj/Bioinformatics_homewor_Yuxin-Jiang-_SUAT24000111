# Week 5 Homework
# DESeq2 differential expression analysis

# -----------------------------
# 1. Load packages
# -----------------------------

library(DESeq2)
library(apeglm)

# -----------------------------
# 2. Import data
# -----------------------------

counts <- read.csv(
  "Week5_Homework_Count_Matrix.csv",
  row.names = 1,
  check.names = FALSE
)

metadata <- read.csv(
  "Week5_Homework_Sample_Metadata.csv",
  row.names = 1,
  check.names = FALSE
)

# -----------------------------
# 3. Verify input data
# -----------------------------

stopifnot(!any(is.na(counts)))
stopifnot(!any(counts < 0))
stopifnot(all(counts == floor(counts)))

stopifnot(identical(colnames(counts), rownames(metadata)))

metadata$condition <- factor(metadata$condition)
metadata$batch <- factor(metadata$batch)

metadata$condition <- relevel(
  metadata$condition,
  ref = "control"
)

# -----------------------------
# 4. Pre-filter genes
# At least 10 counts in at least 3 samples
# -----------------------------

keep <- rowSums(counts >= 10) >= 3

counts_filtered <- counts[keep, ]

# -----------------------------
# 5. Construct DESeq2 object
# -----------------------------

dds <- DESeqDataSetFromMatrix(
  countData = counts_filtered,
  colData = metadata,
  design = ~ batch + condition
)

# -----------------------------
# 6. Run DESeq2
# -----------------------------

dds <- DESeq(dds)

# Inspect coefficient names
print(resultsNames(dds))

# -----------------------------
# 7. Extract treated vs control
# -----------------------------

res <- results(
  dds,
  contrast = c("condition", "treated", "control")
)

# -----------------------------
# 8. LFC shrinkage with apeglm
# -----------------------------

resLFC <- lfcShrink(
  dds,
  coef = "condition_treated_vs_control",
  type = "apeglm"
)

# -----------------------------
# 9. Significant DEGs
# padj < 0.05 and |log2FC| >= 1
# -----------------------------

sig <- resLFC[
  !is.na(resLFC$padj) &
    resLFC$padj < 0.05 &
    abs(resLFC$log2FoldChange) >= 1,
]

n_sig <- nrow(sig)

n_up <- sum(
  !is.na(resLFC$padj) &
    resLFC$padj < 0.05 &
    resLFC$log2FoldChange >= 1
)

n_down <- sum(
  !is.na(resLFC$padj) &
    resLFC$padj < 0.05 &
    resLFC$log2FoldChange <= -1
)

print(n_sig)
print(n_up)
print(n_down)

# -----------------------------
# 10. PCA
# -----------------------------

vsd <- varianceStabilizingTransformation(
  dds,
  blind = FALSE
)

pca_plot <- plotPCA(
  vsd,
  intgroup = c("condition", "batch")
)

png(
  "week5_pca.png",
  width = 2100,
  height = 1800,
  res = 300
)

print(pca_plot)

dev.off()

# -----------------------------
# 11. MA plot
# -----------------------------

png(
  "week5_de_plot.png",
  width = 2100,
  height = 1800,
  res = 300
)

plotMA(
  resLFC,
  ylim = c(-4, 4)
)

dev.off()

# -----------------------------
# 12. Export complete shrunken results
# -----------------------------

results_df <- as.data.frame(resLFC)

results_df$gene <- rownames(results_df)

results_df <- results_df[, c(
  "gene",
  "baseMean",
  "log2FoldChange",
  "lfcSE",
  "pvalue",
  "padj"
)]

write.csv(
  results_df,
  "week5_deseq2_results.csv",
  row.names = FALSE
)

# -----------------------------
# 13. Save DESeq2 object
# -----------------------------

saveRDS(
  dds,
  "week5_deseq2_object.rds"
)

# -----------------------------
# 14. Save session information
# -----------------------------

sink("session_info.txt")
sessionInfo()
sink()