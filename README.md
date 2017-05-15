# nested

At Nested we often make use of historical property sales data, where we typically need to inflate
prices to compare with properties currently on the market. One way of doing this is to use the
UK House Price Index, available as a CSV download from the [Land Registry:](http://publicdata.landregistry.gov.uk/market-trend-data/house-price-index-data/UK-HPI-full-file-2
016-05.csv)

[42.5MB download](http://landregistry.data.gov.uk/app/ukhpi)

For this exercise we’d like you write a simple web service, which will take a price, a ‘from’ date,
a ‘to’ date and the name of a London borough and return the price inflated from the ‘from’ date
to the ‘to’ date. This involves looking up the index value for the two dates and multiplying the
price by their ratio. The date is in column 1, the borough should be matched against column 2
and the index is in column 5 of the CSV, e.g. for a property in Islington the index was 28.25 in
January 2000, and 103.60 in January 2016, so if the price was £100,000 in January 2000, the
inflated price is:

£100,000 * (103.60 / 28.25) = £366,726

for January 2016. This is the value that your service should return.
