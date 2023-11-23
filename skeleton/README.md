## Overview

Use this template to automatically create a Spark Workload based on the CDP-AWS infrastructure.

### What's a Workload?

Workload refers to any data processing step (ETL, job, transformation etc.) that is applied to data in a Data Product. Workloads can pull data from sources external to the Data Mesh or from an Output Port of a different Data Product or from Storage Areas inside the same Data Product, and persist it for further processing or serving.

## Customise template
To customise this template is possible to modify the *spec.mesh.specific* section inside [catalog-info.yaml](./catalog-info.yaml).
**It is not recommended** to edit the fields above (*spec.mesh section*), as inconsistencies may be generated.
The best solution is to create a new component using the wizard.
In case of doubt, please contact the platform team.

### Customisable fields:

- **cdeService:** the long-running Kubernetes cluster and services that manage the virtual clusters;
- **cdeCluster:** an individual auto-scaling cluster with defined CPU and memory ranges. Jobs are associated with clusters;
- **jobName:** the name of the job. A job is an application code along with defined configurations and resources;
- **jar:** indicates that the JAR file is stored in an S3 bucket and will be used by the Spark system to execute the job. The format is`s3://${{ values.bucket }}/${{ values.domain }}/${{ values.dataproduct }}/0.0.0/spark-app-0.0.0.jar` and it's not reccomended to modify the references to domain and dataproduct; the numbers after *${{ values.dataproduct }}/*  represent the version of the spark app and should be updated together with it.
- **driverCores:** number of cores to use for the driver process. If specified must be a positive integer.
- **driverMemory:** amount of memory to use for the driver process. If specified must be a positive integer followed by 'g' e.g. 2g.
- **executorCores:** the number of cores to use on each executor. If specified must be a positive integer
- **executorMemory:** amount of memory to use per executor process. If specified must be a positive integer followed by 'g' e.g. 2g.
- **numExecutors:** number of executors to run. If specified must be a positive integer.
- **cronExpression:** a cron expression that is directly provided to the scheduler. This field allows for detailed time-based scheduling, specifying when and how often the job should be executed. If not provided, the job will not be automatically executed based on a time-based schedule.
- **startDate:** the date and time when a scheduled Spark job should begin its execution. If not provided, the job can start immediately upon scheduling.
- **endDate:** the date and time when a scheduled Spark job should stop its execution. If not provided, the job may continue running indefinitely according to the schedule.


## Artifacts

To build this project run: `cd spark-app && sbt assembly`.

Artifacts will be built by the CI as well and be pushed to the s3 bucket configured in GitLab CI.
