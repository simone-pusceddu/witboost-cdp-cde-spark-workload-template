import "strings"

let splits = strings.Split(id, ":")
let domain = splits[3]
let majorVersion = splits[5]

#DPVersion:        string & =~"^([0-9]+\\.[0-9]+\\-SNAPSHOT\\-[0-9]+|[0-9]+\\.[0-9]+\\..+)$"
#ComponentVersion: string & =~"^([0-9]+\\.[0-9]+\\..+)$"
#Id:               string & =~"^[a-zA-Z0-9:._-]+$"
#DataProductId:    #Id & =~"^urn:dmb:dp:\(domain):[a-zA-Z0-9_-]+:\(majorVersion)$"
#ComponentId:      #Id & =~"^urn:dmb:cmp:\(domain):[a-zA-Z0-9_-]+:\(majorVersion):[a-zA-Z0-9_-]+$"
#URL:              string & =~"^https?://[a-zA-Z0-9@:%._~#=&/?]*$"
#OM_DataType:      string & =~"(?i)^(NUMBER|TINYINT|SMALLINT|INT|BIGINT|BYTEINT|BYTES|FLOAT|DOUBLE|DECIMAL|NUMERIC|TIMESTAMP|TIME|DATE|DATETIME|INTERVAL|STRING|MEDIUMTEXT|TEXT|CHAR|VARCHAR|BOOLEAN|BINARY|VARBINARY|ARRAY|BLOB|LONGBLOB|MEDIUMBLOB|MAP|STRUCT|UNION|SET|GEOGRAPHY|ENUM|JSON)$"
#OM_Constraint:    string & =~"(?i)^(NULL|NOT_NULL|UNIQUE|PRIMARY_KEY)$"
#JobName:          string & =~"^([a-zA-Z0-9-]+)-([a-zA-Z0-9-]+)-([a-zA-Z0-9-]+)-([a-zA-Z0-9-]+)-([a-zA-Z0-9-]+)$"
#Jar:              string & =~"^s3://[a-zA-Z0-9:._/-]+/[a-zA-Z0-9:._/-]+/[a-zA-Z0-9:._/-]+/0\\.0\\.0/spark-app-0\\.0\\.0\\.jar$"
#Cron:             string

#OM_Tag: {
	tagFQN!:      string
	description?: string | null
	source!:      string & =~"(?i)^(Tag|Glossary)$"
	labelType!:   string & =~"(?i)^(Manual|Propagated|Automated|Derived)$"
	state!:       string & =~"(?i)^(Suggested|Confirmed)$"
	href?:        string | null
	...
}

#Schedule: {
	cronExpression?: ( #Cron ) | null
	startDate?:      =~"^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$" | null
	endDate?:        =~"^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$" | null
	...
}

#JobConfig: {
	args?: null | [...string]
	dependencies?: null | [...string]
	driverCores?:    null | int
	driverMemory?:   null | =~"^[0-9]+g$"
	executorCores?:  null | uint
	executorMemory?: null | =~"^[0-9]+g$"
	numExecutors?:   null | uint
	logLevel!:       string & =~"(?i)^(INFO|DEBUG|TRACE|WARNING|ERROR)$"
	conf?: null | {
		[string]: string
	}
	schedule?: #Schedule | null
	...
}

#SparkSpecific: {
	cdeService!: string
	cdeCluster!: string
	jobName!:    #JobName
	jar!:        #Jar
	className!:  string & =~"(?i)^(com.agilelab.bigdata.workload.spark.app.SparkApp)$"
	jobConfig:   #JobConfig
	...
}

id!:                       #ComponentId
name!:                     string
fullyQualifiedName?:       null | string
description!:              string
kind!:                     string & =~"(?i)^(workload)$"
version!:                  string
infrastructureTemplateId!: string
useCaseTemplateId!:        string
dependsOn?: [...#ComponentId]
readsFrom?: [...#ComponentId]
workloadType?:   string | null
connectionType?: string & =~"(?i)^(housekeeping|datapipeline)$" | null
platform!:       string & =~"(?i)^(CDP on AWS)$"
technology!:     string & =~"(?i)^(spark)$"
workloadType!:   string & =~"(?i)^(batch)$"
connectionType!: string & =~"(?i)^(DataPipeline)$"
tags: [... #OM_Tag]
specific: #SparkSpecific
