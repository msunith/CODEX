1.Demographic Insights (examples)

a.Who prefers energy drink more? (male/female/non-binary?)
select gender,count(fact.Respondent_ID) as response from fact_survey_responses fact
inner join dim_repondents res on fact.Respondent_ID=res.Respondent_ID 
group by gender order by response desc; 

b.Which age group prefers energy drinks more?
select age as age_group,count(fact.respondent_id) as response from fact_survey_responses fact inner join
dim_repondents as res
on fact.Respondent_ID=res.Respondent_ID group by age order by response desc;

c.Which type of marketing reaches the most Youth (15-30)?
select age as age_group,Marketing_channels,count(fact.respondent_id) as response from fact_survey_responses fact inner join
dim_repondents as res
on fact.Respondent_ID=res.Respondent_ID group by Marketing_channels having age="15-18" or age="19-30" order by response desc; 

2.Consumer Preferences

a.What are the preferred ingredients of energy drinks among respondents?
select Ingredients_expected, count(Ingredients_expected) as response from fact_survey_responses 
group by Ingredients_expected order by response desc;

b.What packaging preferences do respondents have for energy drinks?
select Packaging_preference,count(Packaging_preference) as response from fact_survey_responses 
group by Packaging_preference order by response desc;

3.Competition Analysis

a.Who are the current market leaders?
select Current_brands,count(Current_brands) as Top_brands from fact_survey_responses
 group by Current_brands order by Top_brands desc;

b.What are the primary reasons consumers prefer those brands over ours?
select distinct Reasons_for_choosing_brands from fact_survey_responses 
group by Reasons_for_choosing_brands order by Reasons_for_choosing_brands desc;

4.Marketing Channels and Brand Awareness
a.Which marketing channel can be used to reach more customers?
select Marketing_channels,count(marketing_channels)  as response from fact_survey_responses 
group by Marketing_channels order by response desc;

5. Brand Penetration:

a. What do people think about our brand? (overall rating)
select Brand_perception,count(brand_perception) as response from fact_survey_responses 
group by Brand_perception;
b. Which cities do we need to focus more on? //not yet finished
select city.city,fact.Heard_before from fact_survey_responses fact
inner join dim_repondents dim
 on fact.Respondent_id = dim.Respondent_id 
 inner join dim_cities city
 on dim.city_id = city.city_id group by city.city,fact.Heard_before 
 order by city.city desc;

6. Purchase Behavior:

a. Where do respondents prefer to purchase energy drinks?
select Purchase_location,count(Purchase_location) as response from fact_survey_responses 
group by Purchase_location order by response desc;

b. What are the typical consumption situations for energy drinks among
respondents?
select Typical_consumption_situations,count(Typical_consumption_situations) as responses from fact_survey_responses 
group by Typical_consumption_situations order by responses desc;
  
c. What factors influence respondents purchase decisions, such as price range and
limited edition packaging?

7. Product Development

a. Which area of business should we focus more on our product development?
(Branding/taste/availability)