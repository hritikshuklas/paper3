# Generational Dynamics, Gender and Politics in the US - Predicting 2020 US Presidential Voting Preferences

## Overview

This study investigates voting patterns in the 2020 US presidential election, analyzing how political preferences are influenced by a person's gender and the generation they're born in. With the help of exploratory data analysis, logistic regression and data from the 2020 CES Common Consent dataset, it is observed that younger generations tend to favor Biden over Trump. As generations get older, Biden loses more and more support. It is also found that women tend to favor Biden more heavily than the men of the same generation as them.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from CCES2020 entry on dataverse.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted model. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data, and fit the model.


## Statement on LLM usage

ChatGPT 3.5 was used to write aspects of the Results section of the paper. LLM Usage is documented in 'other/llm/usage.txt'
