# LMS
# Language: R
# Input: CSV (abundances)
# Output: CSV (correlations)
# Tested with: PluMA 1.0, R 3.2.5

PluMA plugin that runs the Least Mean Squares (LMS, Widrow and Hoff, 1960) algorithm, for regression analysis.

The plugin
accepts as input a CSV file where rows represent samples and columns represent
observables, and entry (i, j) represents the abundance of observable
j in sample i.

The plugin produces output LMS values between community members
as another CSV file with both rows and columns representing members and entry
(i, j) the LMS value between member i and member j.
