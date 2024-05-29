Survey/ Notification/ Video Call/ Banned Account/ Harmful Contents 

A/B Test 模板： 
1. clarify the question / what is the goal of the experiment? 
2. pick a metric to test: Explain Why I have to pick this metric 
   AA Test for the population 
3. establish hypotheses
   set significance level (typically 5%)
   set statistical power (typically 80%)
   set MDE (typically 1%) (please confirm with the interviewer) 
4. design the experiment: 
   randomization level: 50% vs. 50% test and control, clustering first degree 
   determine population: US users  
   determine sample size: formula variance/MDE 
5. duration of experiment: Two weeks (avoid novelty effect and weekend effect also sample size) 
6. Conclude: p-Value: 0.01 < 5%, significant, may have potential to launch the product

面经 May 29th: 
sql: video_call, 2 题， 找出每天打电话人的比例（需要考虑caller 和recipient） What percentage of daily active users from us were on a video call yesterday?
-- Step 1: Gather the distinct caller and recipient by day
WITH calls AS (
    SELECT DISTINCT caller AS user, ds FROM video_calls
    UNION
    SELECT DISTINCT recipient AS user, ds FROM video_calls
),

-- Step 2: Join with the user table and flag as making a call that day
active_user AS (
    SELECT
        a.user_id,
        a.dau_flag,
        a.ds AS active_day,
        CASE WHEN c.user IS NOT NULL THEN 1 ELSE 0 END AS call_active_flag,
        c.ds AS call_date
    FROM dim_all_users AS a
    LEFT JOIN calls AS c ON a.user_id = c.user AND a.ds = c.ds
)

-- Step 3: Calculate the percentage of users making a call each day
SELECT
    active_day AS call_date,
    SUM(call_active_flag) * 1.0 / COUNT(user_id) AS active_call_percentage
FROM active_user
GROUP BY active_day
ORDER BY active_day;


group by: 
-- Step 1: Select all the active video calls from yesterday in the US
WITH active_call_us AS (
    SELECT DISTINCT a.caller AS user, a.ds
    FROM video_calls AS a
    JOIN dim_all_users AS b ON a.caller = b.user_id
    WHERE b.country = 'US' AND a.ds = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)

    UNION

    SELECT DISTINCT a.recipient AS user, a.ds
    FROM video_calls AS a
    JOIN dim_all_users AS b ON a.recipient = b.user_id
    WHERE b.country = 'US' AND a.ds = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
),

-- Step 2: Select all the DAU = 1 users in the US from yesterday
yesterday_dau AS (
    SELECT user_id
    FROM dim_all_users
    WHERE country = 'US' AND dau_flag = 1 AND ds = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
)

-- Step 3: Calculate the active percentage
SELECT
    COUNT(DISTINCT ac.user) * 1.0 / COUNT(DISTINCT yd.user_id) AS active_perc_yesterday
FROM
    active_call_us ac
JOIN
    yesterday_dau yd ON ac.user = yd.user_id;

#
 how do you find out which group of people are interested in video call feature

 1. What's App Survey (randomly selected)
 2. Demographics Study / Internet Connection 
 3. User Profiling:
    Age
    Gender
    Location (urban/rural)
    Device type (smartphone/tablet)
    Internet connectivity (Wi-Fi/mobile data)
4. Demographics:
* Age: Younger generations (Gen Z, Millennials) are more likely to use video calls.
* Occupation: Remote workers, entrepreneurs, and professionals in tech, marketing, and sales.
* Location: Urban areas with high internet penetration.

  Behavioral indicators:
* Users of video conferencing apps (e.g., Zoom, Skype) for personal or professional purposes.
* Individuals frequently using social media platforms with video calling capabilities (e.g., Facebook, WhatsApp).

  Market trends and analytics:
* Study industry reports, market research papers, and growth projections for video conferencing.
* Analyze user engagement metrics (e.g., time spent on video calls, frequency of use).

How to test the Video Features: 
1.What is the overall goal to accomplish? Engagement? 
2.Do we want aim to specific population or geographic area ? 
3. Where does this call embedded in, a new product, or new feature, in Facebook? 

User Journey Description: 
1. User can scroll the pages in facebook
2. There is a button in the top left/right corner that people can click and do the video calls/ Color pop 

The goal here is to enhance the overall engagement of all the users. 

Break down into the metrics that we are going to talk: 
1. Primary Metric: Over all time spent on the platform
2. Secondary Metric: DAU/ MAU and retention rate on the platform
3. Trade-off: No. of posts / non-video feature/ Ad Revenue

A/B Test: 
Randmization of the Split: Network Effect here: 
Video Call is two way of the testing, there will be inference between two groups of people, First degree of the clustering on the test and control population). 

pick a metric to test: Explain Why I have to pick this metric 
   AA Test for the population (AA) 
3. establish hypotheses
   If we have video feature, there will be no effect of two population 
   If we have video feature, there will be effect of two population 
   set significance level (typically 5%)
   set statistical power (typically 80%)
   set MDE (typically 1%) (please confirm with the interviewer) 
4. design the experiment: 
   randomization level: 50% vs. 50% test and control, clustering first degree 
   determine population: US users  
   determine sample size: formula variance/MDE 
5. duration of experiment: Two weeks (avoid novelty effect and weekend effect also sample size) 
6. Conclude: p-Value: 0.01 < 5%, significant, may have potential to launch the product 

Here is the Improved version for the answer: 
Improvement: 
#The Primary Metric has to be within time period 
#Add the related features on the new feature 
#elaborate specific goal after the overall goal 

Here is the improved answer formatted in Markdown code format:
MarkDown
# How to Test the Video Call Feature on Facebook
=====================================================

## Goal
--------

Our goal is to increase user retention and engagement on Facebook by introducing a seamless video call feature. Specifically, we aim to boost the average time spent per user per day by 10% within the next 6 weeks.

## Metrics
----------

### Primary metric

* Average time spent per user per day (ATSPUD)

### Secondary metrics

* Daily Active Users (DAU)
* Retention rate (percentage of users returning after 7 days)
* Number of video calls initiated per day
* Average duration of video calls

## A/B Test Design
--------------------

### Randomization

* 50% of users will be randomly assigned to the test group (with video call feature) and 50% to the control group (without video call feature)

### Clustering

* We will use first-degree clustering to account for network effects, as users are likely to interact with their friends and family

### Population

* We will test this feature among US users aged 18-45

### Sample size

* We will use a sample size of 1 million users, calculated using the formula variance/MDE (minimum detectable effect) to detect a 10% increase in ATSPUD

### Duration

* The test will run for 2 weeks to account for potential novelty effects and to ensure a representative sample of users

## Hypotheses
-------------

### Null hypothesis (H0)

* The video call feature has no significant effect on ATSPUD (p > 0.05)

### Alternative hypothesis (H1)

* The video call feature has a significant effect on ATSPUD (p < 0.05)

## Statistical Significance
-------------------------

### Significance level

* 5% (α = 0.05)

### Statistical power

* 80% (β = 0.2)

### MDE (Minimum Detectable Effect)

* 1% increase in ATSPUD

## Conclusion
----------

If the p-value is less than 0.05 (e.g., 0.01), we will reject the null hypothesis and conclude that the video call feature has a significant positive effect on user engagement and retention. This will indicate that launching the video call feature may be a good decision to increase user engagement on Facebook.

## Follow-up questions
----------------------

### What if the results are inconclusive?

* We would re-evaluate the test design, consider alternative metrics, and potentially run a follow-up test with adjustments.

### How would you address potential issues with the video feature?

* We would monitor user feedback, address technical issues promptly, and consider iterative improvements to the feature based on user behavior and feedback.


1.面经：May 20th 

sql:
两个表：
一个是 view的table，里面包括每个post 的view metrics，时间和次数. 
一个是post的table，里面包括每个post被predict 成有害内容的概率

INSERT INTO view (id, post_id, view_date, view_count) VALUES
(1, 101, '2024-05-20', 150),
(2, 102, '2024-05-21', 200),
(3, 103, '2024-05-22', 50),
(4, 101, '2024-05-22', 170),
(5, 104, '2024-05-23', 80);

INSERT INTO post (id, content, harmful_probability) VALUES
(101, 'This is a harmless post content.', 0.05),
(102, 'This post might be harmful.', 0.60),
(103, 'Completely safe content here.', 0.02),
(104, 'Potentially harmful content.', 0.85),
(105, 'Another safe post.', 0.10);


两道题：
1） 过去7天，view超过10次数的post数量

SELECT post_id, SUM(view_count) AS sum_views
FROM view
WHERE view_date >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY)
GROUP BY post_id
HAVING SUM(view_count) > 10;

2）daily harmful content view prevalence， harmful content posts views / total views 
#first we have to find the harmful content posts views: 
with harm as (
select 
a.*,
b.harmful_probability 
from view as v 
left join posts as p 
on v.post_id = p.id) 
#harmful posts > 0.75/all the posts as percentage of harmful contents views 
select sum(case when harmful_probability > 0.75 then view_counts else 0 end)*1.0/sum(views) as harmful_views_percentage from harm 


产品题目：Product Case 

1）如果要找到harmful content，你要从哪里开始然后接下来怎么做呢？
2）除了依赖user的feedback之类的办法，有什么更客观的办法吗？
3）如何去衡量这些content的影响范围呢？
4）如果有了metrics以后，怎么找到临界值来界定严重与否？
5）如果launched 了一个新的算法以后，harmful content减少了，但是对应的engagement也降低了，怎么处理？

Clarifying Questions: 
1. What products that we should focus on these harmful content?
2. How to define these harmful contents?
3. What are the purpose of dealing with these harmful contents?

1）如果要找到harmful content，你要从哪里开始然后接下来怎么做呢？
Recommendation System: With the highest scores they may have harmful contents,model fairness and effectivness 
Strategy: Policies 
User Report: Since Harmful Contents are like fraud, they may evolve rapidly, this needs user report for the harmful contents (Monitoring Needs) 
Historical Research: 

Hate Speech's impact on facebook group? 
Higher Goals: Engagement in the Facebook Group 
Metrics: (1) Average Time Spent on the Facebook Group (2) Replies and interaction between the posts 
There are two ways to deal with it. 

A/B Testing / Non- AB Tests Methods 
Seconardy Metrics: (1) DAU/MAU for the facebook group within two weeks of testin window 
                   (2) Retention Rate for the facebook group within two weeks of testing window 
Trade-off: (1) False Positive Rate, Engagment Metrics will descrease like replies 
           (2) Ad Revenue will decrease 

3) 如何衡量这些content 的影响范围：
What product? How to measure this impact?
A/B Testing: 
Null Hypothesis: The Harmful Model can not recognize the harmful events 
Alternative Hypothesis: The HarmModel can effective recoganize harmful events
Randomization Unit

4) 如果launched 了一个新的算法以后，harmful content减少了，但是对应的engagement也降低了，怎么处理？
   Short Term and Long Term Goal (Recommendation of Positive Event)

5）如果有了metrics以后，怎么找到临界值来界定严重与否？
Precision, Recall and F1 Score to measure 
Precision = TP / TP+ FP (A high precision means that overly conversative of the model) 
Recall = TP/ TP+ FN (A high recall means the model is agressive, means there are a lot of benign cases that makes for Hate Speech) 
F1 Score: 

1.Get the model's prediction probabilities: Obtain the predicted probabilities of hate speech for each instance in the population.
2.Sort the probabilities: Sort the predicted probabilities in descending order (highest to lowest).
3.Calculate the cumulative sum: Calculate the cumulative sum of true positives (hate speech instances) and false positives (benign instances) at each probability threshold.
4.Plot the curve: Plot the true positive rate (Recall) against the false positive rate (Fall-out) at each probability threshold.
5.Find the optimal cut-off: Identify the point on the curve where the true positive rate is highest while keeping the false positive rate below a certain tolerance (e.g., 1% or 5%).



5. 面经： May 18th
1. 发起video call 的目的是什么，是仅仅想增加一个feature 还是提高整个平台的用户体验。
2. 如果你说了用ab 实验，那么control group 并没有video call 的情况要怎么衡量。
3. Launch 了video call 会导致哪些metric 下降,以及怎么办. 

SQL题也是围绕着video call 的，之前的帖子里有table.

1. Clarifying Questions:
What kind of product that we ar targeting? What's app
What kind of regions that we want to focus
What is the ultimate goal for the system?

Framework: 
1. Enhance overall engagement of the platform
2. Primary Metric: Average Time spent on the plaform
3. Seconary: DAU/MAU Retention Rate
4. Trade-off: Ad Revnue, non-video call feature engagement
5. A/B testing:
  Goal: Engagement of the overall product
  Metric to test: Average Time Spent on the platform
  Randomization: Network Effect, First Degree Clustering
  5% significant level, 80% of power, MDE with 1%
6. Null Hypothesis:
    1. Video call has no effect on the average time spend
    2. Video call has effect on the average time spend
    P < 0.05, significant level, which means that we have the potential to launch the features.
7. 如果你说了用ab 实验，那么control group 并没有video call 的情况要怎么衡量。
   A/A Test: Run the A/A test to collect the baseline data
   Use a placebo effect: Provide the control group with a mock video call feature that doesn't actually work, but makes them believe they have the feature. This way, both groups think they have the feature, and any differences in behavior or outcomes can be attributed to the actual video call functionality.
8. Launch 了video call 会导致哪些metric 下降,以及怎么办.
   Video Engagement Time (Because of the quality of the video due to the internet connection)
   App Crash 
   Latency Time of the pages loading (Work with Engineer Team to make sure)
   Non-Video Feature Engagement (Prioritize the Short Term and Long Term Goal)
   Ad Revenue
   Retention 

   What we should do:
   (1) User Feedback
   (2) Optimize the performance of the video call quality
   (3) Dashboard Monitoring

Group Call Feature: 

10. 面经： May 15th
sql有两个表一个是banned account另一个是probability with pair of user that could be recidivism
table 1 user_id, banned_reason, date
table 2 user_id1, user_id2, probability
question 1: how would you calculate number of users for each banned reason from last 7 days?
question 2: calculate the percentage of users that have a high probability of recidivism
case:
question1 : what metric would you use to measure recidivism
question2: what could go wrong with your selected metric?.

11. 面经： May 13th
SQL：App Usage那道题。面试官希望你define metrics，估计不是唯一答案，言之有理即可。我就是这metric这拿不定主意，来来回回的说，很不清楚。建议一定想清楚了再说，选定了最好就别随便变化了。 问interviewer问题的环节，我也是脑子有些不清楚，问的坑坑洼洼。。。。
BQ：就是常规题，conflicts，constructive feedback
AE: ads的概率题，地里有的。和SQL后面followup我有一样的问题，拿不准metric来来回回的
AR：有点久了记不清了。好像是比较fb和ins的performance。地里有面经

12. 面经， May 12th 
SQL: Survey response rate
CASE: Notification + Notificaiton of freind attending event near you

13. 面经, Apr
AR: Ins Shop 那题
AE: 面经里bad account算概率的那题，会延伸问一些bad account相关的business insights
SQL: Shop Visibility 那题，前面几个写code的小问不难，用window function可以解决，最后一问开放性问题，需要自己想一个metrics来回答并写出code

14. 面经，Apr.
Case / SQL: Notification

15. 面经 Apr
SQL：
A) What is the response rate to the survey?
B) Do newer users have a better opinion of notifications than more tenured users?
.
16. Product Sense:
1. how to measure success for push notification
2. if event team wants to add a new event realted notification, how would you decide if we should launch or not

10. March:
Products - Notification
1. What data/what metrics would you look for to measure the quality of FB push notifications?
    1. [Follow up] Clear definition of the metrics, why it is important
2. ENG team is deciding to launch a new on-site notification feature, how would you help them to test this feature?
    1. [Clarification] What function of this feature are we testing?
        1. UI, frequency, sound, backend recommendation system .--
    2. [Follow up] If the ENG team want to test the feature with a new backend recommendation system, how would you set up the experiment?

SQL - Survey
A) What is the response rate to the survey?
B) Do newer users have a better opinion of notifications than more tenured users?

SQL: Notification: 
1. Dates Manipulation: Facebook Questions 
   datediff(new_date, old_date) calculate the difference between the two dates
   date_add(date, interval X day) calculate X date after
   date_sub(date,interval X day) calculate X date before
2. Calculate the average/Medium Value: 
   Medium Value is using ntile function, equal cuts of the data and select ntile = 2
3. Reciver and sender (this needs to be deduped, we can use least(reciver_id,sender_id) or greatest(reciver_id,sender_id)
   or distinct(reciver_id,sender_id) as a unique combination of the queries
4. Define the metric first and implement queries
5. If you have use agg function, you have to remember the rest of the terms will appear in the group by function (request center fail rate)
6. Pay attention to Rank function and row_number() function, rank will return tie results but row_number only return top rows in the results.
7. Video Calls:the third question would be a problem:
   (select ac.*, u.country, u.dau_flag, case when (country = 'fr' and dau_flag = 1 and ac.ds = date_sub(current_date, interval 1 day then 1 else 0 end) as fr_active_yesterday from calls as ac left join users as u on ac.caller = user_id)
    SELECT 
    COUNT(DISTINCT CASE WHEN dau = 1 THEN user ELSE NULL END) * 1.0 / 
    (SELECT COUNT(DISTINCT user_id) 
     FROM users 
     WHERE country = 'fr' AND dau_flag = 1 AND ds = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)) AS active_fr_user_percentage
FROM 
    fr_active;
8. Pay attention to the sequence of the order of the sql: From / Where/ Group by/ Having (if you have agg function)/ order by / limit 
   
9. 


   
