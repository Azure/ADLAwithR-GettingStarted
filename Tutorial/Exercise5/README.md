# Exercise 5
In this exercise we will be understanding how partitioning works. Specifically what the REDUCE operation does.

By using REDUCE expression, we can separate our analysis workload by partitions. Each partition can be executed independently in parallel, and all results are collected by REDUCE operation. Using this partitioning capability we can efficiently predict massive amount of data. When using REDUCE clause we have to specify ON {partition keys (multiple)} or ALL. So even when we don't need partitioning, we specify a pseudo partition (one same partition for all rows). 

We add a column to partition on (Par in this case) to the extracted input data. For e.g.   
@ExtendedData = SELECT 0 AS Par, * FROM @InputData;

We Reduce on the partition key (Par in this case) to enable parallel processing. For e.g.
@RScriptOutput = REDUCE @ExtendedData ON Par
PRODUCE ....

Alternatively, we could use REDUCE ALL for not partitions. For e.g.
@RScriptOutput = REDUCE @InputData ALL PRODUCE ....

The R extension for U-SQL includes a built-in reducer (Extension.R.Reducer) that runs R code on each vertex assigned to the reducer.

In real scenarios, we could partition by time/date, by machine ID, by hospital ID columns etc.

In `usqlscriptEx5a.usql`, instead of a pseudo partition column, the partition column will unequally partition the rowsets into five parts as defined by PartitionCount (We can increase the variable PartitionCount to increase parallelization. For e.g. when the scoring input is big)

In `usqlscriptEx5b.usql`, we demonstrate aggregation on partitioned data. Look at the values in sum_sepal_length to convince yourself.

In `usqlscriptEx5c.usql`, we partition on species column instead of creating another column to partition on and aggregate.





