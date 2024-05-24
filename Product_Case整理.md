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




1. 面经：May 20th 

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
. 1point3acres.com
SQL - Survey
A) What is the response rate to the survey?
B) Do newer users have a better opinion of notifications than more tenured users?
