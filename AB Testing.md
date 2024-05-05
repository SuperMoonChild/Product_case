This is for the note to mark AB Testing: 

https://medium.com/airbnb-engineering/experiments-at-airbnb-e2db3abf39e7#.miqyczkzb
https://medium.com/meta-analytics/estimating-the-long-run-value-we-give-to-our-users-through-experiment-meta-analysis-6ddb9073b29b
https://towardsdatascience.com/the-ultimate-guide-to-cracking-business-case-interviews-for-data-scientists-part-1-cb768c37edf4#0c53

### Network Effect on Testing: 
https://medium.com/@yuhuailin0323/network-effects-in-two-sided-marketplace-a-b-testing-001f94455a76

### Formula
- **Z value:** \( Z = \frac{(x - \text{mean})}{\text{sd}} \) where "sd" stands for standard deviation.

### Sample Size
- **Influential Factors:** Type 1 error impacts sample size significantly (提高对sample size 的影响).

### Type 1 Error
- **Definition:** Failure to reject the Null Hypothesis when it is true. The significance level is influenced by alpha, which is compared with the p-value:
  - If \( p > \alpha \), reject the Null Hypothesis.
  - If \( p < \alpha \), do not reject the Null Hypothesis.
- Alpha is typically set to 5% to limit the tolerance for mistakes.
- **Relationship:** Inverse with sample size (requiring more data for a stricter alpha).

### Type 2 Error
- **Beta:** Often set to 20%. A smaller beta indicates a need for more power, which in turn demands more data.
- **Relationship:** Positive with power and data requirements.

### Balancing Type 1 and Type 2 Errors
- **Question:** Can both errors be minimized simultaneously? If not, which should be prioritized?
- **Cost:** Type 1 error is considered negative; Type 2 error is neutral.

### MDE (Minimum Detectable Effect)
- **Relationship:** Inversely proportional to sample size. Larger effects require smaller sample sizes, whereas smaller effects require larger sample sizes.

### Experiment Design
- **Randomization Unit:** Assignment to control (Group A) or test (Group B) group helps balance confounding variables.
  - **Question:** How to ensure full randomization before testing?
- **Bias:** Assessed via p-value comparison to alpha.

### A/A Test
- **Purpose and Expectations:** Understanding baseline variations.

### Experiment Duration
- **Typical Length:** Often two weeks, to capture weekly effects and different user behaviors between weekdays and weekends.

### Novelty Effect
- **Longer Experiments:** Analyze data from Day 8-14 to assess true performance after initial novelty wears off.

### Evaluation Metrics
- **Primary Metrics:** Whether testing a primary metric requires comparison with other metrics.
- **Conflicting Results:** How to handle contradictions between metrics.
- **Trade-Off Analysis:** Quantitative and qualitative evaluations.
- **Company Goals:** Align metrics with monetary and strategic objectives.

### P-Value
- **Definition:** Likelihood of an observed difference occurring by chance (if significant, do not accept the Null Hypothesis).

### No Significance
- **Factors:** (1) Sample size and power (2) Implementation quality

### Goal Metrics: 
-  ** Goal Metrics should be stable for a period of time
-  ** Easy to communicate with the customers
-  ** Overall Success of the company
-  ** Not senstive enough to product changes

### Driver Metrics: 
-  ** Short Term Progress
-  ** A/B Testing Compability
-  ** Short Term goals

https://towardsdatascience.com/the-ultimate-guide-to-cracking-business-case-interviews-for-data-scientists-part-1-cb768c37edf4#0c53

### Guardrail Metrics: 
-  ** Organizational Guardrail Metrics: Loading time in the page 
-  ** Page Loading Time 
-  ** Trustworthy of the experiments: Assumption of the experiments (Randomized Units or Sample Ratio Mismatched)
-  Use in context (Any product changes do not increase latency)

## Metrics Criteria: (Suitable for experiment) 
-  ** Measureable
-  ** Senstitive and in a timely manner
-  How about one mertic goes up and one metric goes down?
-  Choose no more than 5 metrics

- ## Example of running a test:
- Steps to take:
- pre-ab test: Objective and key metrics/ Variants/ Randomized Units
- 



