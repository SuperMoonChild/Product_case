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
- **Definition:** Failure to reject the Null Hypothesis when it is true. The significance level is influenced by alpha, which is compared with the p-value: Mistakenly reject the true hypthesis 
  - If \( p > \alpha \), reject the Null Hypothesis.
  - If \( p < \alpha \), do not reject the Null Hypothesis.
- Alpha is typically set to 5% to limit the tolerance for mistakes.
- **Relationship:** Inverse with sample size (requiring more data for a stricter alpha).
- **Example**: In statistical terms, a Type I error is when a study or test concludes that a certain effect or difference exists when in reality, it doesn’t. This is like the smoke alarm thinking it detects smoke when there’s none; it's being overly cautious and alerting you unnecessarily.

### Type 2 Error
- **Beta:** Often set to 20%. A smaller beta indicates a need for more power, which in turn demands more data.Fail to reject a false hypthesis 
- **Relationship:** Positive with power and data requirements.
- **Example**: Suppose you have a carbon monoxide detector in your home that's supposed to alert you to dangerous levels of carbon monoxide, a harmful gas that you can't see or smell. A Type II error is like having this detector in your home but it fails to go off when there actually is carbon monoxide present. Essentially, it misses the danger.
In statistical terms, a Type II error occurs when a study or test fails to detect an effect or difference that is actually there. It's like the detector being too insensitive or not working correctly, so it doesn't alert you to a real problem.

### P Value: 
Imagine the teacher has two classrooms. One classroom uses the new method, and the other sticks with the old one. After a semester, the teacher looks at the final grades and initially assumes that there will be no difference in performance between the two methods.

Here, the p-value is like a tool to measure whether the observed difference in grades is just by random chance or if it's likely caused by the new teaching method. If the p-value is very small (like less than 0.05, which is a common threshold), it suggests that such a difference in grades would be very rare if the new method didn't actually have an effect. This might convince the teacher that the new method is indeed better.

In simpler terms, a low p-value tells the teacher, "It's pretty unlikely you'd see this much improvement just by chance. The new teaching method might really be working!"

### Power: 
Imagine you're playing a game of hide and seek. In this game, "statistical power" represents your ability to find someone who is actually hiding. If you have high power in this game, it means you’re really good at finding the people who are hiding, and it's unlikely that you’ll miss them. On the other hand, if your power is low, you might walk right past someone hiding without even noticing them.

In statistical terms, power is the probability that you will correctly detect an effect or difference when there really is one. For example, if a new medicine is truly effective, high power means you are more likely to see that effectiveness in your study's results. Low power means there’s a higher chance you might miss seeing the medicine's effectiveness, even if it is there.




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

### Power: 
- ** The liklihood to detect an effect
- ** effectively reject the Null Hypothesis
- ** Avoid Type II Error, probability to correctly reject the null hypothesis



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
- What metrics that you should capture?
- After the metrics, sample size = 16*(standard deviation)^2 / (treatment - control)^2
- We launch the features because they are practically and statistically significant
- If there is not enough statistical power but have MDE:
- The test didn't have enough data or duration to detect a statistically significant difference between
- The control and treatment groups.
However, the MDE suggests that there is a potentially meaningful effect worth exploring further.
In this scenario, consider the following options:
Run the test longer: If possible, extend the test duration to collect more data, increasing the statistical power to detect a significant difference.
Increase sample size: If the test is limited by the number of users or samples, consider increasing the sample size to achieve more robust results.
Use a more sensitive test: If the test is underpowered, consider using a more sensitive testing approach, such as a sequential testing method.
Accept the MDE: If the MDE is practically significant (e.g., a 2% increase in conversions), consider implementing the change, even if it's not statistically significant.
Run a follow-up test: Design a new test to validate the results, using the insights gained from the initial test to inform the follow-up experiment.

## What we observe there is no MDE but statiscal significance: 
Don't implement the change: If the statistically significant result doesn't meet the MDE threshold, it may not be worth implementing the change, as the impact may be too small to matter.
Run a follow-up test: Design a new test to validate the results and potentially identify a larger effect size.
Re-evaluate the test goals: Consider whether the test goals were too aggressive or if the MDE threshold was too high.
Analyze secondary metrics: Examine secondary metrics to see if there are any other meaningful effects or insights.
Consider the cost of implementation: If implementing the change would be resource-intensive or costly, it may not be worth it if the effect size is small.
Run a cost-benefit analysis: Weigh the costs of implementation against the potential benefits to determine if it's worth proceeding.

![image](https://github.com/SuperMoonChild/Product_case/assets/167145755/ffe03245-5d48-47be-b621-e373ec9e1d58)

### Network Effect on A/B testing: 
- ** Airbnb, Lyft, Uber (Shared resources among control and treatment group, new product for the treatment group) 
- ** Linkedin and Facebook
- User will be impacted by others
- the effect can be spilled over by controlled group
- the difference underestiamted by the treatment effect
- Ineterference:(Two sided Market) 
- Isolations: Geo Based Randomization (big variance will be unique) 
- Time based Randonmization (last a short amount of time)
- Social Network:
- Clusters of the Groups
- Or each user will have this feature or not

- https://towardsdatascience.com/how-user-interference-may-mess-up-your-a-b-tests-f29abfcfccf8

### EGO- Network Testing: 
Step 1: Identify Ego Clusters
Each cluster consists of a central user (the ego) and all of their direct connections (alters). For instance:

Ego Cluster 1: User A (ego) is directly connected to User B and User C (alters).
Ego Cluster 2: User D (ego) is directly connected to User E, User F, and User G (alters).
Ego Cluster 3: User H (ego) is directly connected to User I (alter).
Step 2: Randomization
To ensure the integrity of the test and to control for network effects, entire clusters are randomized to either the control or treatment group, rather than individual users. This helps to avoid situations where a user in the control group sees the feature because their friends in the treatment group are using it.

Treatment Group: Ego Cluster 1 and Ego Cluster 3
Cluster 1: Users A, B, C get the new emoji feature.
Cluster 3: Users H, I get the new emoji feature.
Control Group: Ego Cluster 2
Cluster 2: Users D, E, F, G do not get the new emoji feature and continue using the old reaction options.
Step 3: Implementation
Deploy the feature to the clusters in the treatment group and monitor both individual and cluster-level interactions. For example, you can track:

How often each user in the treatment clusters uses the emoji reactions compared to the baseline reaction options in the control cluster.
The spread of usage within the treatment clusters (e.g., if one user starts using emojis, do their friends start using them more often too?).
Step 4: Measurement and Analysis
Collect data on user engagement with the new feature and compare it between the treatment and control groups. Use statistical methods suitable for clustered data to analyze:

Direct Effects: Are users in the treatment group more engaged because of the new feature?
Indirect (Network) Effects: Is there an increase in engagement among the alters when their connected ego uses the new feature?
Conclusion
This approach helps to capture both the direct impact of the feature on users who have access to it and the indirect impact on their network, providing a more comprehensive understanding of the feature's effectiveness in a socially connected environment. By using cluster randomization, the platform minimizes contamination across groups, ensuring that the observed effects are due to the intervention itself.

### Switch Back Tests: 
https://doordash.engineering/2020/06/08/improving-experimental-power-through-control-using-predictions-as-covariate-cupac/

To mitigate the network interference, Doordash chooses a higher level of analysis and randomize the treatment at distinct geography and time window (below), which is called a Switchback design. It toggles the treatment on and off at the distinct geography-time level and checks the changes in the target metric (User Retention).
![image](https://github.com/SuperMoonChild/Product_case/assets/167145755/682a4b54-172b-4fca-8a2a-d3a435c4b632)

Let's explore a concrete example of using CUPED (Controlled Pretest Utilization for Experimental Design) in an A/B testing scenario for a hypothetical online platform. Assume the platform is testing a new feature designed to increase user engagement, measured as the number of daily clicks per user.

### Context and Setup
The platform plans to roll out a new personalized content recommendation feature. The goal of the A/B test is to determine whether this feature increases user engagement compared to the current version of the site.

### Step 1: Collect Pre-Experiment Data
Before starting the experiment, the platform collects data on each user’s average daily clicks for the week prior to the test. This historical data will serve as the covariate because it reflects each user's baseline engagement level, which is expected to influence their engagement during the experiment.

- **User A**: 100 clicks/day (pre-experiment average)
- **User B**: 150 clicks/day
- **User C**: 90 clicks/day
- **Overall average (mean)**: 113.3 clicks/day

### Step 2: Conduct the A/B Test
The users are randomly assigned to either the control group or the treatment group. After the experiment, the number of daily clicks per user during the test period is recorded:

- **Control Group**: 
  - User A: 95 clicks/day
- **Treatment Group**: 
  - User B: 160 clicks/day
  - User C: 120 clicks/day

### Step 3: Calculate Covariates and Adjust Outcomes
Calculate the covariate for each user:

- \( X - \bar{X} \) (where \( X \) is pre-experiment clicks, \( \bar{X} \) is the mean pre-experiment clicks):
  - User A: \( 100 - 113.3 = -13.3 \)
  - User B: \( 150 - 113.3 = 36.7 \)
  - User C: \( 90 - 113.3 = -23.3 \)

Next, calculate \(\theta\), assuming from pre-experiment data that the covariance between pre and post clicks is 300 and the variance of pre clicks is 800:

\[
\theta = \frac{300}{800} = 0.375
\]

Adjust the post-experiment outcomes using the formula \( Y_{\text{adjusted}} = Y - \theta \times (X - \bar{X}) \):

- **Control Group**:
  - User A: \( 95 - 0.375 \times (-13.3) = 95 + 5 = 100 \)
- **Treatment Group**:
  - User B: \( 160 - 0.375 \times 36.7 = 160 - 13.75 \approx 146.25 \)
  - User C: \( 120 - 0.375 \times (-23.3) = 120 + 8.74 \approx 128.74 \)

### Step 4: Analyze Adjusted Data
Now compare the adjusted results:

- **Control Group Average**: 100 clicks/day
- **Treatment Group Average**: \( \frac{146.25 + 128.74}{2} \approx 137.5 \) clicks/day

### Conclusion
With the adjusted outcomes, we see a clearer effect of the treatment on user engagement, with the treatment group showing a higher adjusted average of clicks per day compared to the control group. The use of CUPED reduced variance due to pre-existing differences in user behavior, making it easier to detect the effect of the new feature.

This example highlights how CUPED helps control for baseline variations and enhances the sensitivity of A/B tests, allowing more precise measurement of the treatment effects.






