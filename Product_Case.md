### Summary: Business Model Goals and Metrics

1. **Business Type Impact on Features and Metrics**
   - Different business types prioritize different features and metrics.
   - Social media companies focus on driving engagement.

2. **B2C (Business-to-Customer) Models**
   - **Netflix Example**
     - **Objective**: Convert free trial users to paying users.
     - **Focus**: User acquisition and engagement during the free trial period.
   - **Amazon Prime Example**
     - **Objective**: Increase the number of orders and overall investment in the Amazon ecosystem.
     - **Focus**: Measuring the success of Amazon Prime in driving user activity.

3. **Marketplace Businesses**
   - **Examples: Uber, Airbnb**
     - **Objective**: Increase revenue with a focus on long-term user retention.
     - **Focus**: Metrics that enhance the lifetime value of customers, vendors, and all marketplace participants.

4. **Startups and Growth-Focused Companies**
   - **Growth as Main Objective**
     - Features and metrics prioritize growth to gain market share and traction.
     - Sharing features or non-core business features may be implemented to drive growth.

This summary outlines how different types of businesses focus on specific goals and metrics to achieve their objectives.

## Success Metrics for Measuring Product Success

### Strategies for Formulating Metrics

#### Define Objects
Defining the objects of the problem helps structure a thought process for creating metrics. In our example scenario, our objects are attendees, events, and hosts. Hosts must create events, which then get attended by our users or attendees. These relationships are the basis for Facebook Events and give us everything we need to create metrics off of them.

Within complex products, there can be even more granularity that is reached, but we want to start from the top and then work our way down. For example, if users post on an event, maybe we want to track posts per event. But this metric in itself is a proxy for something bigger, which is just an attribute of event activity. Therefore, by starting at the top, we can slowly work our way down.

This relates to the MECE framework. If we’re analyzing a problem, we don’t want to immediately jump into one of the bottom nodes in a tree, versus slowly traversing through each branch / problem and deciding how deep we should investigate.

#### How the Product Works
Specifically, within Facebook Events, we must also be sure to note exactly how the product works. Facebook Events allows a user to create an event with a date, description, and public or private permission. Each event will allow a host to invite friends or make it open to the public to attend, in which the invite list and attendee list can be public or private. Each event will also hold posts and comments, and attendees/invitees will be able to share these posts and pictures.

#### User Journey Flows
Mapping out the user journey helps us understand how to formulate metrics that will inevitably measure the core health of the product. Like the Investigative Metrics chapter, user journeys allow us to understand the product a little deeper, and give us more contextual knowledge about how it relates to the larger platform as a whole.

Each individual behavior and user flow helps account for edge cases we might not have thought about in the beginning, and helps with discovering which behaviors matter more than others in order to prioritize metrics.

We can subdivide user flows into a couple of parts:

- **Acquisition**
  - Creating an understanding of how users discover the feature and land on the feature is important from the perspective of each object. In this case, it would be:
    - **Attendees**
      - Browsing events on the events page
      - Being invited to a Facebook event
      - Seeing a public event on the newsfeed
    - **Hosts**
      - Where can organizers create events? On the events page, or is it scattered across different platforms on Facebook?
- **Funnels and Conversion**
  - After the acquisition stage, how are the users converting into the product or feature? What is the drop-off in each step of the funnel? For our example, we want to know:
    - How many users convert to attendees from:
      - Newsfeed
      - Browsing the events page
      - Seeing their friend is attending the event
      - Does increasing the number of friends attending the event increase the likelihood of the user converting into an attendee?
      - Being invited to attend the event
    - How many users convert to becoming hosts from:
      - The different parts of the platform where you’re able to create events
      - What’s the drop-off at each step of creating an event? Are users getting stuck on some part of the UI that is difficult to use?
      - This additionally brings up an engagement question: what level of detail is expected in the event for it to be engaging enough for other attendees to want to commit to attending?

### Product Engagement
Engagement behaviors allow us to understand how users interact with the product after converting through the funnels. How do the interactions between the user and product eventually affect the top level goals that we’re trying to achieve?

Example engagement behaviors for Facebook Events are looking at what users do once they’ve seen an event or created an event. These behaviors can all be encapsulated into metrics that we can then list down to understand the engagement between the user and the product.

For example:
- What percentage of users are attending an event?
- How much time do users spend browsing Facebook events?
- What are the total number of events that a user will confirm attendance out of the number they browse?
- What’s the average number of events a user will create and host?
- What’s the percentage of friends that a user will invite to their event that’s public versus private?

### List the Top Level Metrics
Given these user journeys and how we’ve mapped out the relationship between the user and the product, we can now try to suggest top level metrics that we want to measure. These will be the initial core metrics that most of the time represent the health of the product. We can imagine it as the metrics or graphs we would want to see on a daily dashboard to understand how the product is performing.

These metrics will usually depend on the three factors of engagement, revenue, or growth. For the Facebook Events example, we have to be sure to understand the core metrics around general user growth and engagement. Generally, these metrics showcase the product is still functioning more than anything else.

#### Top Level Metrics
Notice that we have two main metrics for users and events: in a marketplace, it’s important to signify and create top level metrics for all parts of a marketplace.

### Bad Metrics
One thing we have repeatedly mentioned is how we should be careful to avoid bad metrics. Bad metrics can be very detrimental, given that it wastes time and showcases a lack of foresight or thought into the product.

Examples of bad metrics for Facebook Events could be:
- **Irrelevance**
  - Average number of likes per post per event.
  - This metric is an example of something that doesn’t contribute to the direct success of the product.
- **Impractical**
  - Surveying the number of users that actually attend Facebook events.
  - Implementing and tracking a user survey could be highly impractical and take a lot of time, versus using data collection techniques. Additionally, the benefit from getting the metric of the number of users that actually attend Facebook Events could be marginal to the success of the product.
- **Needless Prioritization**
  - Prioritizing metrics that are impractical, irrelevant, or a case of bad causal inference is also a common mistake. For example, if we emphasize tracking and increasing the average time spent on Facebook Events, this could be a wrong proxy metric since we may be cannibalizing other products on Facebook.
  - A user could be potentially moving from a Facebook power user to a casual user that only utilizes Facebook Events. In an ideal scenario, we would like to see it the other way around, where Facebook Events instead acts as an acquisition funnel for converting casual users into power users.

### Summary: Relating Product Goals to Metrics

1. **Understanding Product Goals and Metrics**
   - It's crucial to link product goals to the metrics being tracked.
   - Top-line metrics help gauge product health and growth, avoiding significant drops in key areas like total events created and user acceptance of event invites.

2. **Engagement**
   - **Long-term Engagement Metrics**: Focus on metrics that show how the product fosters engagement within the platform.
   - **Defining Success in Engagement**:
     - Success can be measured by increased posts and comments, indicating sustained user interaction.
     - Long-term retention is key, showing how the product contributes to continued platform use.
   - **Examples**:
     - Measure user retention over different periods (week, month, year) to see if increased usage of FB Events correlates with overall Facebook usage.
     - Correlate proxy engagement metrics on FB Events to longer-term Facebook engagement.
     - Metrics to measure:
       - Average posts mentioning a user based on event attendance.
       - Number of Facebook friends made from attending events.

3. **Revenue**
   - Sometimes product success is tied to revenue goals, especially in e-commerce or marketplace businesses.
   - Example: Amazon's recommendation widget.
     - **Goals**:
       - Increase conversion rates per shopper session.
       - Increase total purchase value.
       - Increase number of repeat purchase sessions.

4. **Growth**
   - Focus on bringing more users to the platform, lowering acquisition costs, or enhancing the site through network effects.

Example for launching a new IG product TV: 
### Clarifying Questions

- What is IGTV and how does it differ from IG’s existing video products?
- Why do we want to launch IGTV? What opportunity does it capture?
- I assume we haven’t decided on the rollout plan yet, and this is subject to discussion. Right?
- Assume IGTV is a product that allows users to produce and consume longer video content (sometimes real-time).

### What Success Looks Like

I will break down my answer by several dimensions: IGTV the product itself, IG, Facebook, Meta overall.

#### IGTV Itself
For IGTV to be successful, it should have a healthy ecosystem of actively engaging content producers and consumers. The product itself should run smoothly. This means the following metrics:
- **Production**: 
  - # of videos released
  - Duration
  - # of active producers
- **Consumption**: 
  - # of videos meaningfully watched/liked/commented on/shared
  - # of viewers/viewers who responded to videos (including like, comment, share, etc)
- **Performance and Stability Metrics**:
  - # of videos crashed
  - App crashes
  - Battery drain

#### IG
For IGTV to be a net positive to IG, it should increase IG engagement overall despite some potential cannibalism with existing products. In other words, if users find new ways of sharing, they could potentially post less. Cannibalism affects both production & consumption! This means the following metrics:
- **Engagement of Competing Products**:
  - XAU of IG photo/video producers/consumers
  - XAU of IG Reels
- **IG Ecosystem**:
  - Overall IG XAU
  - Potentially ads impression and revenue -> I want to ensure it’s a net positive for IG

#### Facebook
IGTV might also cannibalize “competing” products on Facebook. The metrics should be similar to what’s mentioned previously. Along the same lines.

#### Meta Overall
Despite intra- and inter-product cannibalism, IGTV should be a net positive for Meta. This can be measured by Meta-wide XAU and ads impression/revenue.

### Rollout and Measurement Plan

I think we can run an experiment, but it must have the following constraints:
- Novelty effect
- Network effect
- If USA is IG’s primary market, we can first test-launch in a culturally similar English-speaking country.

Non-experimental launch is also okay if we are tight on resources (willing to sacrifice user experience a little bit).

### Possible Outcomes

- **Best Outcome**: Celebrate and consider rolling out to broader audiences.
- **Net Neutral or Negative to IG/Meta**: Continue product iteration.
- **Net Positive with Severe Cannibalism**: This deserves a serious conversation with our sister teams.

### Example of the private stories on the Instagram: Questions: (1) Metrics (2) Need to articulate the formula really well? (3) How Uber is doing A/B testing for the pricing tests? 

[**Watch the video on YouTube**](https://www.youtube.com/watch?v=wp3f3h_by4s&t=1517s)

### Overview
This video features a comprehensive mock interview focusing on product analysis within a social media context, specifically discussing Instagram's "Close Friends" feature. The discussion involves assessing the feature's potential impact on user engagement and proposing metrics to measure its success.

### Key Discussion Points

#### Understanding the Product's Purpose
- The primary goal of the "Close Friends" feature is to enhance engagement among existing Instagram users by encouraging more private and selective sharing among friends. This could potentially attract users who find the platform too public.

#### Proposed Metrics for Measuring Success
- **Stories Made Per User:** The frequency of stories posted by users, which could show an increase if the feature is effective.
- **Engagement Among Target Audience:** Specifically looking at users who rarely post stories to see if the feature encourages them to post more.
- **Adoption Rates of the Feature:** Monitoring how many users actually use the feature to post close friend stories.

#### Experimental Rollout Suggestions
- Conducting A/B tests by providing the feature to one group and withholding it from another to compare changes in behavior.
- Analyzing the "stickiness" of the feature by tracking if users continue to use it over time.

#### Potential Challenges and Considerations
- The risk of decreased overall story views if more users adopt private postings, which could reduce the visibility of stories to a wider audience.
- The need to track not just the creation of stories but also how many are viewed to assess if the feature is leading to more meaningful engagement.

#### Evaluating Trade-offs
- Balancing the increase in story creation with potential drops in story views.
- Considering the long-term retention and behavior change among users as more private content could lead to longer time spent on the app.

### Conclusion and Further Steps
The interview wraps up with discussions on fine-tuning the experiment design, such as masking whether a story is a "close friend" story for users not part of the test group. This would help isolate the variable being tested (feature's effect on story posting) from awareness of the feature itself.

The video provides a deep dive into the analytical thought process required in product management within tech companies, particularly those dealing with social media platforms.

### Questions： https://www.interviewquery.com/questions/changing-composer
Let’s say that Facebook would like to change the user interface of the composer feature (the posting box) to be more like Instagram. Instead of a box, Facebook would add a “+” button at the bottom of the page.

Let’s make some initial assumptions. We can guess that we want to try a new user interface to improve certain key metrics that Instagram does better than Facebook in. Noticeably, given that Instagram is a photo-sharing app, we can assume that Facebook wants to improve:

Posts per active user
Photo posts per active user
Additionally, we have to measure the trade-offs between the existing UI of the Facebook composer versus the Instagram UI. While the current composer feature on Facebook may make it easier to share status updates and geo-location or sell items, the Instagram composer may make the user more inclined to share photo posts.

Therefore, given this hypothesis, one way to initially understand if this test is a good idea is to measure the effects of an increase in the proportion of photo posts to non-photo posts on Facebook and how that affects general engagement metrics.

For example, if we compare the population of users that have a percentage of photo posts from 10% of the total versus 20% of the total posts, does this increase our active user percentage at all? Would it increase monthly retention rates?

Another thing we have to be aware of is the drop-off rate for the Facebook composer versus the Instagram composer. The drop-off rate would directly affect the general amount of posts that each user makes. We can look at the drop-off rate between the two composers by different segments as well such as geographic location, device type, and demographic markets.

If we want to run an AB test to actually test the differences instead of just analyzing our existing segments, we would have to evaluate these same metrics but make sure not to compare by specific segments unless they are a large sample size of the population. Doing it by market/segment may leave it so that you get a Simpson’s paradox scenario where for most markets you get a certain result but in aggregate the result is different.

In running the A/B test in addition, it’s important to add in the specific rigidity that the test must be run. For example, sample size and distribution are important to need to make sure we have a sufficiently large enough sample size in both control and test to get a statistically significant result. We should also randomly assign folks to either test/control as well as remember to reach significance and single variable change on the composer element.


### For Trading-off Metrics:
### Strategy and Framework
Clarify the goals of the business or product

We should remember that the overall goal is to prioritize certain metrics over others given the situation. The only way to prioritize metrics is to relate it to the original goal of the product and figure out which metric is the best indicator for the product goal.

### Hypothesize and Break Down the Metrics

For each metric, first hypothesize why each metric could be going up or down. Many times these metrics are related to each other. Then list out exactly how much it matters that each metric is going up or down.

### Summarize Your Results

Provide an end conclusion on which metric matters, why both metrics matter, or why both metrics don’t matter. Then provide a solution based on your findings.


### How to measure the success of the marketing channels: 
https://www.interviewquery.com/questions/marketing-channel-metrics 
Key Points: (1) Marketing ROI (Return on Investment) 
(2) CAC(Acuqsition Cost) 
(3) Revenue: (CLV Customer Life Time Value) 

### Meta Recidivism Rate: 
How did you measure recidivisum? 
Clarification Questions: 
(1) What are the main purpose to recidivisum strategy? 
Improve Engagement/ 
(2) Do we have specific segment to target or which area? 
(3) In what product Facebook, Whatapp or just in general? 

How to measure recidivisum? 
(1) How long? Times since the last crime happend 
(2) Severity of recidivisum? (The impact of the recidivisum) 
(3) Types of the recidivisum 
(4) Frequency of the recidivisum? 
Average time of particular user will recidivied in a certain period of time? 

What could we go wrong with this metric: 
(1) Not meeting the ultimate goal: Since the motiviation of the such behavior is unclear. 
(2) People will use fake accounts across the platform, so it would be very hard to tight down to one person. 
(3) The fraud people will work in groups so they will be skewed the dataset 
(4) The definition of the recidivsm would be dynamic, so the definition to include or exclude the accounts will not be captured the whole picture of it. 

Parents加入孩子更不愿意用FB了：这个是很老的题目了，楼主把它拿出来讲是因为这里面有一个很经典的，当我们没有AB test可以做了，我们该怎么办？建议大家可以去多看看关于observation study的东西（i.e., propensity modeling, diff-in-diff），这个不一定会考，但是不要让面试官觉得你只会AB test，你要先去justify我们该不该做AB Test，然后再是AB Test。





