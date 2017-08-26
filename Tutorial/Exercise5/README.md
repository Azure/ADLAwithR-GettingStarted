# Exercise 5
In this exercise we will be understanding how partitioning works. Specifically what the REDUCE operation does.

By using REDUCE expression, we can separate our analysis workload by partitions. Each partition can be executed independently in parallel, and all results are collected by REDUCE operation. Using this partitioning capability we can efficiently predict massive amount of data. When using REDUCE clause we have to specify ON {partition keys (multiple)} or ALL. So even when we don't need partitioning, we specify a pseudo partition (one same partition for all rows). 

We add a column to partition on called Par to the extracted input data. For e.g.   
@ExtendedData = SELECT 0 AS Par, * FROM @InputData;

We Reduce on the partition key. For e.g.
@RScriptOutput = REDUCE @ExtendedData ON Par
PRODUCE ....

In real scenarios, we could partition by time/date, by machine ID, by hospital ID columns etc.

In usqlscriptEx5a.usql instead of a pseudo partition column, the partition column will unequally partition the rowsets into five parts.

In usqlscriptEx5b.usql, we demonstrate aggregation on partitioned data. Look at the values in sum_sepal_length to convince yourself.

In usqlscriptEx5c.usql we partition on species column instead of creating another column to partition on and aggregate.





