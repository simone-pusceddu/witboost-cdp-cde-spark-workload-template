## Component Information

| Field name               | Example value                    |
|:-------------------------|:---------------------------------|
| **Name**                 | ${{ values.name }}               |
| **Fully Qualified Name** | ${{ values.fullyQualifiedName }} |
| **Description**          | ${{ values.description }}        |
| **Domain**               | ${{ values.domain }}             |
| **Data Product**         | ${{ values.dataproduct }}        |
| **Identifier**           | ${{ values.identifier }}         |
| **Development Group**    | ${{ values.developmentGroup }}   |
| **Depends On**           | ${{ values.dependsOn }}          |
| *Reads From*             | ${{ values.readsFrom }}          |


## Spark infrastructure details
| Field name              | Example value         |
|:------------------------|:----------------------|
| **CDE Service**         | ${{ values.service }} |
| **CDE Virtual Cluster** | ${{ values.cluster }} |
| **Artifact bucket**     | ${{ values.bucket }}  |
| **Job name**            | ${{ values.jobName }} |

## Spark job details
| Field name              | Example value                |
|:------------------------|:-----------------------------|
| **Driver Cores**        | ${{ values.driverCores }}    |
| **Driver memory**       | ${{ values.driverMemory }}   |
| **Executor Cores**      | ${{ values.executorCores }}  |
| **Executor memory**     | ${{ values.executorMemory }} |
| **Number of executors** | ${{ values.numExecutors }}   |

## Spark job scheduling
| Field name          | Example value                |
|:--------------------|:-----------------------------|
| **Cron expression** | ${{ values.cronExpression }} |
| **Start Date**      | ${{ values.startDate }}      |
| **End Date**        | ${{ values.endDate }}        |