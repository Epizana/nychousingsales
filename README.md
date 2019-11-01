# nychousingsales
housing sales by year, neighborhood, type, borough, and other cuts

This shiny app is intended to serve as the ground work for 

1. determining an annualized rate of return for residential properties sold in the 5 boroughs within the past 10 years:

i. commerical properties filtered out.
ii. purchases recorded by the city as a residential sale, but in realitiy was a developer buying entire floors  or entire buildings, also filtered out (to some degree. Very difficult to isolate without a detailed analysis of the data). This is because a entity may purchase building A for $300,000,000, but the sale is recorded on a specific apartment number. When the apartment number is subsequently sold at an actual arm's length transaction, the sale price is recorded as $3,000,000. Thus the change in price over time is an unrealistic $297,000,000. These types of transactions are not flagged separately by the city and instead are completely comningled with the more common residential data.
iii. properties that are $0 or under $100,000 are filtered out. $0 representes deed/title/inheritance transfers from owners to their heirs; $100k minimum threshold was chosen to be in line with the city's threshold for valuing individual apartment units, which is $100k.
iv. properties initially indicated as residential development, but purchases for commercial use and conversion, also fitlered out. This was hard to identify and may not be perfectly captured.

2. The annualized rate of return would be used to produce a ranking system, by borough, by condo unit (for apartment no. granularity) and by overall residential building. THis would show the highest returns for building, borough, unit, etc. As I noted in my presentation, the summary ranking (i.e, menubox at the top of the main body area showing the max return across each category) is an additional change. 

3. In conjunction, the annualized rate of return would be paired with the holding period to determine the relationship between holding period and selling price.

4. Annualized rate of return required maintaining a few different tables in the app.

The app is NOT optimized...these were questions I unfortunately didn't get to ask. So I went down a path and stuck with it.
