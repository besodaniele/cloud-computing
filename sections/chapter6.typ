#import "@preview/scholia:0.1.0": *
*Amazon AWS* is a set of building-block services, designed to work independently, that can work well together:
- They share a common naming convention and authentication
- Minimize internal connections and dependencies
Every activity in AWS can be accessed by making a *web service call*.
== Key concepts
Key concepts:
- EC2 = *Compute*: runs the software.
- S3 = *Object storage*: stores objects accessible through APIs.
- EBS = *Block storage*: provides a disk for the virtual machine.
=== S3 
#definition[Object store][
	An *object store* is a storage architecture that manages
and stores data as objects, rather than as files in a file
system or blocks in a traditional storage system. Each
object in an object store includes three components:
1. *Data*: The actual content you are storing, such as a file, video, or image.
2. *Metadata*: Descriptive information about the object, like its name, creation date, and other relevant details.
3. *Unique Identifier*: A unique ID or key assigned to each object, which allows it to be retrieved without needing to know the location of the data (e.g., file path).
]
Simple Storage Service (S3) is an *object storage* solution:
- with web interface (REST, SOAP, BitTorrent)
- Unlike file systems with hierarchical directories, object stores use a flat address space where every object is stored at the same level.
- Objects up to 5 Terabyte each
- Data automatically distributed across a minimum of three AZs(Availability)
- Automatic data replication (Durability)
- Can be queried using SQL or processed by Big Data solutions
SLA: 99.99% monthly uptime, no more than 4 minutes per month.

Useful for *Backup* & *Recovery*, *Archiving*, and *Disaster Recovery*.
=== EBS
#definition[Block store][A *block store* is a storage architecture where data is divided into fixed-size chunks called "blocks." Each block is identified by an address within the storage volume. The operating system or application can read and write individual blocks, while a file system typically organizes them to store and retrieve files. Block storage is commonly used in traditional storage devices, such as hard drives and solid-state drives (SSD), as well as in cloud storage systems.
]
Elastic Block Store (EBS) Volume:
- An addressable disk volume that can be attached to any running instance (a.k.a. VM) in the same Availability Zone 
- HDD and SDD
- The volume can then be formatted, mounted, and used as if it were a local disk drive
- Volumes have a lifetime independent of any particular instance (VM)
- A volume can persist even when no instances are running
- Price from \$0.025 GB-Month to \$0.124 GB-Month (2008)
=== Security group
A *security group* defines the allowable set of inbound and outbound network connections for an EC2 instance (VM).
Each group is named and consists of a list of protocols, ports, and IP address ranges.
A group can be applied to multiple instances, and a single instance can be regulated by multiple groups.

A Security Group acts as a *virtual firewall * for an EC2 instance.
- *Rules*: Specify which network traffic is allowed, based on protocol (e.g., TCP), port (e.g., 443 for HTTPS), and source IP address.
- *Inbound and outbound traffic*: Rules control both incoming and outgoing connections.
- *Flexibility*: A security group can be associated with multiple instances, and an instance can have multiple security groups.
#note[Security groups are stateful: response traffic for an allowed connection is automatically permitted.]
== EC2
EC2 implements the *programmable data center metaphor*, later it will be called *Infrastructure as a code (IaC)*.
You can get access to multiple Availability Zones in multiple geographic regions and provision your virtualized data center on demand.
Servers, operating system images, firewall entries, load balancers, IP addresses, and disk storage
volumes are all available in a matter of seconds, by simply making a web service request “to the cloud”.
#definition[Amazon Machine Image (AMI)][
	Contains the operating system and can also include additional software and layers of your application such as database servers, middleware, web servers,…
]
- Prebuilt AMIs can be started.
- AMIs can be customized, shared, or even sold. 
- Each AMI has a unique ID (e.g., ami-bf5eb9d6)
#definition[Instance][
	Represents one running copy of an AMI. Any number of copies of the same AMI can be launched.
]
AWS allows you to allocate static IP addresses and then attach them to your instances. Each instance can have at most one such address attached.
When the one instance fails, the elastic IP address is remapped to another VM (if it belong to the same group).

An instance can be running any one of several operating systems, including Linux and Windows Server.
When you start up an Amazon EC2 instance you must specify the *instance type*. Modern EC2 instances now list specific details like:
- Number of vCPUs
- Actual processor models (e.g., Intel Xeon, AMD EPYC, AWS Graviton)
- Clock speeds
- Physical cores vs. threads
=== Ephemeral resources
Ephemeral resources are components that only exist while an instance is running and are lost when the instance stops or terminates. They're not permanent: the data vanishes when the instance goes away.
#note[EC2 instances are ephemeral!]
In case of failures, stored data and state information is generally lost.

For production workloads, implement:
- *Redundancy*: Multiple instances across availability zones
- *Failover*: Automatic instance replacement
- *Recovery*: Regular backups and automation scripts
Best suited for *stateless* application patterns
#note[The *local disk storage* included with each EC2 instance is ephemeral]
The storage will remain intact if a running instance is rebooted, but data is permanently lost when instance terminates. Use persistent storage instead:
- Amazon EBS volumes for block storage
- Amazon S3 for object storage
- Amazon EFS for shared file systems
=== Persistent Resources
Once allocated to your account, they are expected to remain operational in the face of transient or permanent hardware or software failures. The Amazon implementation of a persistent resource makes uses of *redundancy*, *automated failover*, and
*automatic recovery* to provide stable resources.
The following EC2 resources are persistent:
- Elastic IP addresses
- EBS volumes
- Security groups
- Elastic Load Balancers
- AMIs stored in S3 or as snapshots of EBS volumes
=== Pricing model
The pricing model determines how compute capacity is paid for and what flexibility you retain.
$ "Cost" = "compute usage " + "related resources and data transfer" $
There is no single EC2 price: the estimate depends on the  workload, configuration, Region and usage pattern.
The *configuration* depends on:
- Instance family and size
- Operating system / software
- Region and tenancy
*Additional costs* may be incurred for:
- EBS storage and performance
- Data transfer (inbound is free, outbound is charged)
- Public IP addresses
- Monitoring and other services
==== Purchase options
*On-Demand*:
- Pay for the compute you use; no long-term commitment.
- Best for: 
	- learning
	- development
	- variable or uncertain demand.
*Reserved Instances*
- A 1 or 3 year pricing commitment for a defined EC2 configuration/usage pattern 
- availability and flexibility depend on the RI type.
*Savings Plans*
- Commit to a consistent amount of eligible compute usage for 1 or 3 years in exchange for lower rates.
- Best for: predictable baseline usage with flexibility.
*Spot Instances*
- Use spare EC2 capacity at a variable discount; AWS can interrupt it when capacity is needed.
- Best for: fault-tolerant batch jobs and workloads that can resume.

#table(
  columns: 4,
	table.header(
  [*Workload pattern*],
  [*Typical starting point*],
  [*Why it fits*],
  [*Main trade-off*]),
  [New / uncertain],
  [On-Demand],
  [No long-term commitment],
  [Higher unit price than commitment options],
  [Stable baseline],
  [Savings Plans; compare RIs],
  [Discount in exchange for commitment],
  [Commitment may outlast demand],
  [Flexible batch work],
  [Spot],
  [Can reduce compute cost],
  [Capacity can be interrupted],
  [Need capacity guaranteed],
  [Capacity Reservation + suitable pricing],
  [Capacity held in a specified Availability Zone],
  [Reservation is a separate concept from discount],
)

#note[*Rule of thumb*: 
- flexibility $arrow$ On-Demand 
- steady commitment $arrow$ Savings Plans / RIs 
- interruption-tolerant $arrow$ Spot]
Purchasing options and capacity reservations solve different problems; they can be combined.

To obtain current prices:
1. *Define the workload* 
	- Choose Region and Availability Zone needs
	- Select instance family and size
	- Specify OS, tenancy and runtime
2. *Add related resources* 
	- EBS volume size and type
	- Data transfer assumptions
	- Public IPv4 and monitoring
	- Other dependent service
3. *Compare scenarios*
	- On-Demand vs Savings Plans / RIs
	- Spot only if interruption is acceptable
	- Estimate monthly and annual costs
== Autoscaling
In traditional monolithic deployments, the application’s database, API, and business logic coexist on a single physical or virtual server. As the user base grows, the system’s capacity to maintain a consistent Quality of Service (QoS) deteriorates.
The only available scaling strategy in such a setup is *vertical scaling*, that is increasing the resources of a single machine (CPU, RAM, or storage).
This approach introduces a *single point of failure* and quickly
becomes economically inefficient due to the *nonlinear* growth of
hardware costs. 
This limitation paved the way for *cloud-based architectures*, where *scalability* and *resilience* can be achieved through *distributed resources* rather than hardware upgrades.
=== Layered architecture
In modern architectures, applications are organized in layers that separate *stateless components* (e.g., web servers, APIs) from *stateful* ones (e.g., databases, persistent storage).

This separation allows independent scaling strategies:
- Stateless layers can scale horizontally by replicating instances across multiple machines.
- Stateful layers require specialized handling to preserve data consistency and durability.
As user demand grows, the stateless layer typically faces CPU-bound scaling needs, while the persistence layer depends on I/O and storage optimization.
=== Load balancing
In horizontally scaled systems, a load balancer acts as the single entry point for all client requests, distributing traffic among multiple application instances. Its goal is to *optimize resource utilization*, *minimize response time*, and *ensure
high availability*.

Common scheduling algorithms include:
- *Round Robin* (RR): sequentially forwards each request to the next available node.
- *Least Used* (	LU): selects the node with the lowest current load.
Modern cloud load balancers continuously perform *health checks * and cooperate with other cloud services to *dynamically adjust* the number of active instances in response to changing workloads.
=== Amazon Auto Scaling group
Usually, *multiple copies of a service run simultaneously* to serve the volume of customer traffic.
End-users see only one interface for the application, but behind it many identical VMs (EC2 instances) are running, each handling a share of the incoming requests. Managing groups of instances can be cumbersome. 
EC2 provides *Auto Scaling groups* as a solution. Auto Scaling groups are defined with a minimum and maximum number of identical EC2 instances. Useful for controlling a fleet of EC2 instances that can handle a variable load.
An auto scaling group is a collection of Amazon EC2 instances that:
- share the same characteristics (homogeneous virtual machines)
- are treated as one logical grouping for the purposes of scaling and management
Auto Scaling groups automatically:
- scale the number of virtual machine instances (horizontal scaling) or 
- maintain a fixed number of instances (fail recovery – fleet management)

The EC2 instances can be from the same region or from one or more availability zones.
==== Launch Configuration
Every Auto Scaling group is associated with a launch configuration, which describes an instance (VM) of the group (parameters necessary to create the instances).
Only one launch configuration can be attached to an Auto Scaling group at a time.

New or updated launch configuration can be introduced.
Future new instances will be created and launched using the new configuration parameters, existing instances are not affected.
When Auto Scaling needs to scale down, it first terminates instances that have an older launch configuration.
=== Auto Scaling with AWS
Auto Scaling is a web service designed to launch or terminate EC2 instances automatically based on:
1. User-defined policies
2. Schedules
3. Health checks
1 and 2 are useful to respond automatically to changing conditions. It is used to specify how Auto Scaling should
respond to changes.

It guarantees that the number of EC2 instances running:
- Increases seamlessly during demand spikes
- Decreases automatically during demand lulls
- Stays the same in case of failures
The services involved in Auto Scaling are:
- *CloudWatch (CW)*:
	- Provides monitoring over EC2 (CPU load average, disk I/O rate, and network I/O rate)
- *Elastic Load Balancer (ELB)*:
	- Distributes traffic across any number of EC2 instances (in the same Availability Zone or across several zones in a Region)
	- Performs also periodic health checks on the instances of the group, and will stop sending traffic to unhealthy instances
	- Health information is then collected by CloudWatch
- *Auto Scaling*:
	- Uses the data collected by CW to build systems that can scale out (adding more instances) and scale in
	- (shutting down instances) over a defined auto scaling group
	- Usually responds to triggers on CPU/memory utilization and latency, implementing a policy
#figure(image("../images/6/autoScalingPipeline.png"), caption: "Auto Scaling pipeline")
Auto Scaling attempts to distribute instances evenly between the Availability Zones that are enabled for an Auto Scaling group.
- Auto Scaling attempts to launch new instances in the Availability Zone with the fewest instances.
- If the attempt fails, however, Auto Scaling will attempt to launch in other zones until it succeeds
Certain operations and conditions can cause an Auto Scaling group to become unbalanced. Rebalancing activities can take place.
==== Health checks
A *health check* is a *periodic test* performed to assess the operational status of each instance within an Auto Scaling group.
It typically involves invoking a predefined endpoint or using a built-in monitoring probe to verify whether the instance responds correctly and within acceptable performance thresholds.
When an instance fails a health check, due to degraded performance or unresponsiveness, Auto Scaling *automatically terminates it and launches a replacement instance*.
This mechanism ensures that the group remains consistent, available, and self-healing, without manual intervention.
==== Triggers in Auto Scaling Systems
A trigger defines the condition under which an Auto Scaling action is executed.
It combines two core elements:
- *CloudWatch Alarm* — continuously monitors a chosen
  performance metric (e.g., CPU utilization, latency, or network
  throughput) and detects when it crosses a defined threshold.
	- An object that watches over a single metric. It can change state depending on the value of the metric
	- When an alarm changes state one or more actions are triggered
	- To create an alarm, specify:
		- The metric to watch
		- The threshold values for the metric
		- The number of evaluation periods
	- An alarm has three possible states:
		- OK: The metric is within the defined threshold
		- ALARM: The metric is outside of the defined threshold
		- INSUFFICIENT_DATA: The metric is not available, or there is not enough data available for the metric to set the alarm state to OK
	- An action is invoked when an alarm changes state and remains  in that state for several time periods
- *Auto Scaling Policy* — specifies the corrective action to
  perform (e.g., launch or terminate instances) when the alarm
  changes state.
	- A policy defines the scaling action that an Auto Scaling group performs when a monitoring alarm changes state.
	- It specifies *how* and by *how much* capacity should change
	- AWS supports multiple policy types:
		- *Simple scaling*: single rule and fixed adjustment.
		- *Step scaling*: multiple thresholds with proportional actions.
			- adjustment depends on size of alarm breach
		- *Target tracking scaling*: continuous feedback around a target metric.
			- target value for a specific metric
		- *Scheduled scaling*: time-based capacity adjustments
			- Configure Time based Auto Scaling plan
			- Specify the date and time of execution, minimum, maximum,and desired instance size of capacity
When the *alarm threshold* is reached, the corresponding policy
initiates a *scaling activity*.
==== Fleet management
*Fleet management * ensures that the instances in EC2 fleet are performing as designed.
*ELB* and *CW* monitor the health of each EC2 instance launched. If any instance terminates unexpectedly:
- The termination is detected
- A replacement instance is launched
There are three main functions that Auto Scaling performs to automate fleet management for EC2 instances:
- Monitoring the health of running instances
- Automatically replacing unhealthy instances
- Balancing the traffic across Availability Zones
==== Cooldown — Stabilizing the Scaling Feedback Loop
A *cooldown period* is a configurable interval following a
scaling activity during which Auto Scaling temporarily
suspends additional scaling actions.
This period allows the system to stabilize and for monitoring metrics (e.g., CPU utilization, latency) to reflect the impact of the previous capacity adjustment.
Without a cooldown, consecutive scaling events could occur before the system reaches equilibrium, leading to *oscillations* (thrashing) and unnecessary resource churn.