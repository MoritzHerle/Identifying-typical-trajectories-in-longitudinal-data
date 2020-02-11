READ ME for MoritzHerle/Indentifiying-typical-trajectories-in-longitudinal-data

This repository holds code associated with the publication titled: "Identifying typical trajectories in longitudinal data: modelling strategies and interpretations" (DOI: XXX-XXX). 
All code written by Moritz Herle and Bianca De Stavola. 
This publication is part of a grant led by Nadia Micali funded by the UK Medical Research Council and the Medical Research Foundation (ref: MR/R004803/1)
Analyses for this project were conducted in MPLUS (Version 8.1). 
****************************
This repository includes the following Mplus, Stata and R scripts to estimate: 

1. Three types of latent trajectory models:

     a) GROWTH MIXTURE MODEL: 
     in Mplus: GrowhtMixtureModel.txt
     in R (using lcmm package):     lcmm_model_examples.R

     b) LATENT CLASS GROWTH ANALYSIS: 
     in Mplus: LatentClassGrowthAnalysis.txt
     in Stata: LatentClassGrowthAnalysis.do

     c) LONGITUDINAL LATENT CLASS ANALYSIS: 
     in Mplus: LongitudinalLatentClassAnalysis.txt

2. Models that relate an explanatory variable to latent trajectory classes using (Mplus only):

     a) 1-step approach for a GROWTH MIXTURE MODEL: LBMI_GMM4_onBW_1step.txt

     b) 3-steps approach for a GROWTH MIXTURE MODEL: LBMI_GMM4_onBW_3steps.txt
     
     c) 1-step approach for a LATENT CLASS GROWTH ANALYSIS MODEL: LBMI_LCGA5_onBW_1step.txt

     d) 3-steps approach for a LATENT CLASS GROWTH ANALYSIS MODEL: LBMI_LCGA5_onBW_3steps.txt

3. Models that relate latent trajectory classes to an outcome using  (Mplus only):

     a) 1-step approach for a GROWTH MIXTURE MODEL: LBMI_GMM4_onY_1step.txt

     b) 3-steps approach for a GROWTH MIXTURE MODEL: LBMI_GMM4_onY_3steps.txt
     
     c) 1-step approach for a LATENT CLASS GROWTH ANALYSIS MODEL: LBMI_LCGA5_onY_1step.txt

     d) 3-steps approach for a LATENT CLASS GROWTH ANALYSIS MODEL: LBMI_LCGA5_onY_3steps.txt
    
 Note  <-- Results obtained in Stata or R are likely to differ from those obtained in MPlus for several reasons.
                 In general, beside differences in maximization algorithms, differences arise because of the 
                 more general specification of the models usually fitted in MPlus.
 


