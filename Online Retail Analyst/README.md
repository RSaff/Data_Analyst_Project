# Online Retail Analyst
## Objectives
The Online Retail Data consists of 461,773 rows and 7 columns. This analysis aims to understand and optimize various aspects of online retail operations to drive sales growth, customer acquisition and retention, and business success. In this project, analyses related to User Retention, User RFM Segmentation, and Market Basket Analysis will be conducted.User Retention Analysis is conducted to determine whether there are users who return to make transactions or use a product (retained). User RFM Segmentation is performed to group users into several segments, enabling more targeted actions. Market Basket Analysis is conducted to discover associations between 2 or more products from a set of user transaction data.
## Scope
The data analysis will be focused on three main areas : User Retention Analysis, User RFM Segmentation Analysis, and Market Basket Analysis
## Tech & Data
Technologies :
* Python. Libraries that the writers used:
  * Pandas
  * Numpy
  * Datetime
  * Seaborn
  * Matplotlib
  * mlxtend
 * Ms. Excel
## Insight
#### User Retention Analysis
![image](https://github.com/RSaff/Data_Analyst_Project/assets/101809687/6202e670-241b-43f3-9b0e-3b2c903b8399)
1. The largest number of users made their first transaction in January 2010 (713 users).
2. This cohort of users also had the highest retention rate in the second month (39%) compared to other cohorts.
3. Furthermore, this cohort exhibited the highest loyalty in transacting over the following months with a retention rate of approximately 40% or more.
4. Unfortunately, the majority of users did not return for subsequent transactions, as evidenced by retention rates across many cohorts and months that did not reach 50%.
5. Alarmingly, the retention rate in December 2010 hit its lowest point for all user cohorts compared to previous months.
#### User RFM Segmentation Analysis
![image](https://github.com/RSaff/Data_Analyst_Project/assets/101809687/4d7b0ef6-d22c-4b87-88b3-e4ee130e35cc)
1. Most users are in the Hibernating (1060 or 27.3%), Champion (550 or 14.1%), and Loyal Customers (546 or 14.0%) segments.
2. Special programs that focus on the urgency of transactions for Loyal Customers (546 or 14.0%) can be created to make them transact again in the near future so that they can move up to the Champion segment.
3. Special programs that focus on the number of transactions for Potential Loyalists (523 or 13.4%) can be created to make them transact more frequently so that they can move up to the Champion segment.
4. Special programs for Hibernating (1060 or 27.3%) can be made to make them return to transactions even though they are frequent so that they can move up to the New Customers or even Potential Loyalist segments.
#### Market Basket Analysis
![image](https://github.com/RSaff/Data_Analyst_Project/assets/101809687/399bc2fe-c40e-4ef4-b70b-e7f6ca4a15eb)
1. The product Red Hanging Heart T-light Holder is purchased in 5.9% of total transactions.
2. When customers purchase the Red Hanging Heart T-light Holder, 72% of them also buy the White Hanging Heart T-light Holder.
3. There is a strong association between the Red Hanging Heart T-light Holder and the White Hanging Heart T-light Holder, with the likelihood of these two products being purchased together in one transaction being 4 times higher than the likelihood of each product being purchased individually.
4. Based on these insights, the White Hanging Heart T-light Holder can be placed near or next to the Red Hanging Heart T-light Holder, or both products can be sold as a bundle.
