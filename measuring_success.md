# Define Success Metrics

Success metrics are the main metrics that we need to measure and think about for the product to actually measure success. There are a couple of strategies for formulating these metrics.

## Define Objects

Defining the objects of the problem helps structure a thought process for creating metrics. In our example scenario, our objects are attendees, events, and hosts. Hosts must create events, which then get attended by our users or attendees. These relationships are the basis for Facebook Events and give us everything we need to create metrics off of them.

Within complex products, there can be even more granularity that is reached, but we want to start from the top and then work our way down. For example, if users post on an event, maybe we want to track posts per event. But this metric in itself is a proxy for something bigger, which is just an attribute of event activity. Therefore, by starting at the top, we can slowly work our way down.

This relates to the MECE framework. If we’re analyzing a problem, we don’t want to immediately jump into one of the bottom nodes in a tree, versus slowly traversing through each branch/problem and deciding how deep we should investigate.

## How the Product Works

Specifically, within Facebook Events, we must also be sure to note exactly how the product works. Facebook Events allows a user to create an event with a date, description, and public or private permission. Each event will allow a host to invite friends or make it open to the public to attend, in which the invite list and attendee list can be public or private. Each event will also hold posts and comments, and attendees/invitees will be able to share these posts and pictures.

## User Journey Flows

Mapping out the user journey helps us understand how to formulate metrics that will inevitably measure the core health of the product. Like the Investigative Metrics chapter, user journeys allow us to understand the product a little deeper, and give us more contextual knowledge about how it relates to the larger platform as a whole.

Each individual behavior and user flow helps account for edge cases we might not have thought about in the beginning, and helps with discovering which behaviors matter more than others in order to prioritize metrics.

We can subdivide user flows into a couple of parts:

### Acquisition

Creating an understanding of how users discover the feature and land on the feature is important from the perspective of each object. In this case, it would be:

#### Attendees

- Browsing events on the events page
- Being invited to a Facebook event
- Seeing a public event on the newsfeed

#### Hosts

- Where can organizers create events? On the events page, or is it scattered across different platforms on Facebook?

### Funnels and Conversion

After the acquisition stage, how are the users converting into the product or feature? What is the drop-off in each step of the funnel? For our example, we want to know:

- How many users convert to attendees from:
  - Newsfeed
  - Browsing the events page
  - Seeing their friend is attending the event
  - Does increasing the number of friends attending the event increase the likelihood of the user converting into an attendee?
  - Being invited to attend the event
- How many users convert to becoming hosts from:
  - The different parts of the platform where you’re able to create events
  - What’s the drop-off at each step of creating an event? Are users getting stuck on some part of the UI that is difficult to use?

This additionally brings up an engagement question: what level of detail is expected in the event for it to be engaging enough for other attendees to want to commit to attending?

## Product Engagement

Engagement behaviors allow us to understand how users interact with the product after converting through the funnels. How do the interactions between the user and product eventually affect the top-level goals that we’re trying to achieve?

Example engagement behaviors for Facebook Events are looking at what users do once they’ve seen an event or created an event. These behaviors can all be encapsulated into metrics that we can then list down to understand the engagement between the user and the product.

For example:

- What percentage of users are attending an event?
- How much time do users spend browsing Facebook events?
- What are the total number of events that a user will confirm attendance out of the number they browse?
- What’s the average number of events a user will create and host?
- What’s the percentage of friends that a user will invite to their event that’s public versus private?

## List the Top Level Metrics

Given these user journeys and how we’ve mapped out the relationship between the user and the product, we can now try to suggest top-level metrics that we want to measure. These will be the initial core metrics that most of the time represent the health of the product. We can imagine it as the metrics or graphs we would want to see on a daily dashboard to understand how the product is performing
