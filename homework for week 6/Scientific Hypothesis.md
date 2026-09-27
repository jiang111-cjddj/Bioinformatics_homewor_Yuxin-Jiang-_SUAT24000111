### Scientific Hypothesis

**Hypothesis:**
The gut microbiome composition and diversity are significantly altered in patients with Inflammatory Bowel Disease (IBD) compared to healthy controls, and these changes are characterized by a loss of overall microbial richness and a specific shift in the abundance of key bacterial species (e.g., *Bacteroides* and *Escherichia* species).

Specifically, IBD patients (both IBS and UC groups) will exhibit lower Alpha diversity (Shannon, Chao1, and Simpson indices) and distinct Beta diversity clustering compared to the "NA" (healthy/control) group. Furthermore, the relative abundance of beneficial or commensal bacteria will be reduced, while potentially pathogenic or pro-inflammatory species will be enriched in the disease groups.

------

### Supporting Parameters (Data Used to Support the Hypothesis)

To support this hypothesis, you must point to the specific visualizations and parameters you generated. Here is how you can describe them:

1. **Alpha Diversity Parameters (Richness and Evenness):**
   - **Parameters Used:** Shannon index, Chao1 index, Simpson index, and ACE index.
   - **Support:** The boxplots (e.g., `02_alpha_shannon_boxplot.pdf`, `02_alpha_chao1_boxplot.pdf`) show that the median Alpha diversity in the "NA" group (control) is higher than in the "IBS_before" and "UC_before" groups. The "UC_after" and "IBS_after" groups show intermediate levels. This suggests a dysbiosis (microbial imbalance) associated with the disease state.
2. **Beta Diversity Parameters (Community Structure):**
   - **Parameters Used:** Bray-Curtis distance matrix, PCoA (Principal Coordinates Analysis), and NMDS (Non-metric Multidimensional Scaling).
   - **Support:** The scatter plots (`03_beta_pcoa_scatter.pdf`, `03_beta_nmds_scatter.pdf`) show that the "NA" (control) samples cluster separately from the "IBS" and "UC" samples. The 95% confidence ellipses for the disease groups overlap with each other but are distinct from the control group, indicating that the overall microbial community structure is significantly different between healthy and diseased states. The PCoA plot shows the "NA" group clustering on the far left, separated by PC1 (23.2%).
3. **Taxonomic Composition Parameters (Specific Bacteria):**
   - **Parameters Used:** Relative abundance (Top 15 features barplot) and Z-scored heatmap (Top 40 variable features).
   - **Support:** The `04_top15_barplot.pdf` shows that the "NA" group is dominated by a different set of species compared to the IBD groups. For example, the "NA" group has a higher proportion of the salmon-colored taxon (`s__`), while the disease groups show increased abundance of dark blue taxa (e.g., `s__aefaciens`) and red taxa (e.g., `s__uniformis`). The heatmap (`04_top40_heatmap.pdf`) further confirms that specific species like `s__adolescentis`, `s__muciniphila`, and `s__copri` have distinct abundance patterns that differentiate the disease groups from the control group.

------

### How to Write This in Your Submission:

You can copy and paste this into your homework submission:

> **Scientific Hypothesis:**
> The gut microbiome of IBD patients (IBS and UC) exhibits significant dysbiosis compared to healthy controls (NA), characterized by reduced Alpha diversity and distinct Beta diversity clustering. Specifically, we hypothesize that the disease state is associated with a depletion of beneficial commensal bacteria (e.g., *Akkermansia muciniphila* or *Bifidobacterium*) and an enrichment of pro-inflammatory taxa (e.g., *Bacteroides* or *Escherichia*).
>
> **Supporting Parameters:**
>
> - **Alpha Diversity:** Shannon, Chao1, and Simpson indices (from `02_alpha_*_boxplot.pdf`) show lower median diversity in disease groups compared to the NA control.
> - **Beta Diversity:** PCoA and NMDS plots based on Bray-Curtis distances (`03_beta_*_scatter.pdf`) demonstrate clear separation between the NA control group and the IBD groups.
> - **Taxonomic Composition:** Relative abundance barplots (`04_top15_barplot.pdf`) and Z-scored heatmaps (`04_top40_heatmap.pdf`) reveal specific shifts in the abundance of key bacterial species (e.g., *s__uniformis*, *s__aefaciens*) that distinguish the disease groups from the healthy controls.