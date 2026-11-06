#import "@preview/scholia:0.1.0": *
Let us start with a review of what PaaS is.
PaaS is an integrated environment that supports the development, running and management of cloud-
based applications
- Oriented to software development and operations with proper design tools, middleware and APIs
- Offering key services (data storage, caching, mail, …)
- Typically supporting a set of programming languages (Python, Java, C\#, Scala, …)
The user can *deploy onto the cloud infrastructure* applications created. The user *does not manage or control the underlying cloud* but has *control over the deployed applications* and
possibly application hosting environment configurations.
This is possible thanks to runtime environments that abstract the underlying infrastructure and provide a set of services to the applications.
Users use a programming IDE to develop their service among PaaS.
This IDE should integrate the full functionalities which
supported from the underling runtime environment.
It should also provide some development tools, such as profiler, debugger and testing environment.

The traditional issues in software development are:
- Creation of a traditional development environment
- Acquiring servers
- Installing and configuring operating systems, runtime environments and databases
- Creating and configuring a source control repository (configuration management) like Git
- Move or copy existing code
- Deploy, test, and run the code that is developed
With PaaS developers do not need to care about installation, configuration and operation of servers, runtime and databases, and they can *focus on their development tasks* and on managing versions and configuration of the application.

They are supported by:
- *development services*, including build, test, and software repositories
- *run-time services*, including containers/sandboxes for running and scaling applications
They can test workload spikes by letting the application *self-acquiring new resources* (possibly, automatically released when they are no more needed). Different test workload patterns can be generated.

The *application life-cycle* can be made *“agile”* with continuous development and deployment
- Deployment is faster and safer
- The state of software becomes *more visible to the organization*
- *Collaboration* among members of the development team increases even in a dispersed/global setting
- *Developers and testers can interact with the same hosted application* and runtime as the operators

Goals: make the workflow
- *Repeatable*
- *Reliable*
- *Predictable*
- *Fast (Low Cycle Time)*
== Azure Web App service
#figure(image("../images/7/azure.png", width: 80%), caption: "Azure PaaS services")
Azure App Service provides a fully managed PaaS environment for
deploying and running web applications.
Applications execute inside isolated sandboxes, where developers focus on the application logic rather than managing servers or operating systems.
=== Roles
A PaaS application is composed of one or more *roles*, which are the building blocks of the application.
Execution roles:
- *Web roles* handle user-facing logic and process HTTP(S) requests.
- *Worker roles* for resource intensive workloads (back-end)
Both roles run inside *Azure Cloud Services*, which are composed of one or more VMs. However, these VMs are *not directly exposed to the user* — they are *abstracted and orchestrated* by the
platform to behave as PaaS components.
- You *do not manage* the VM’s operating system, networking, or runtime configuration, *Azure takes care of deployment, patching, scaling, fault recovery, and load balancing*.
- What you deploy is *your role package*: an application bundle containing your code, configuration, security, and any required startup tasks. Azure’s fabric controller then places it into a VM instance.
- The VM can be *recycled or replaced* by the platform at any time (for updates or scaling), which is why *roles must be stateless* and store persistent data externally.
==== Web role
A *Web Role* is a cloud-hosted execution container within Azure App Service specifically designed to run web
applications and expose HTTP endpoints.
It operates within a *managed IIS (Internet Information Services)* environment preconfigured by Azure, allowing developers to deploy web applications without provisioning or maintaining web servers manually.
Each Web Role instance:
- Runs in its own *sandboxed virtual machine*, managed by Azure.
- Can host *multiple web applications* or services built with technologies such as ASP.NET, Java, Python, PHP, or Node.js.
- Is automatically integrated with Azure’s *load balancer*, distributing incoming traffic across multiple instances to ensure availability and scalability.
- Can be *scaled out* dynamically based on demand (e.g., CPU usage or request rate).
- Is *stateless* by design — application state should be externalized (e.g., in Azure Storage, Redis, or SQL Database).
The Web Role represents the *frontend tier of a PaaS application*—an automatically managed web-hosting
environment that *abstracts away infrastructure complexity* while maintaining scalability and resilience.
==== Worker Role
A *Worker Role* is a *background processing component* within Azure App Service that executes *asynchronous or long-running workloads* decoupled from direct user interaction.
Each Worker Role instance:
- Executes in an *isolated, managed virtual virtual machine* provisioned and monitored by Azure.
- Is typically *connected to a queue or service bus*, receiving tasks generated by Web Roles or other services.
- Handles *resource-intensive operations*, such as data transformation, batch computation, or integration tasks.
- Can be *scaled independently* of Web Roles, enabling flexible workload distribution and cost optimization.
- Maintains *stateless behavior* — state persistence should rely on external storage services (e.g., Azure Blob, Table, or SQL Database).
The Worker Role acts as the *backend execution tier* of a PaaS application—processing queued or event-driven workloads while *Azure manages infrastructure, scaling, and availability*.
== Azure Auto scaling Application Block
#columns(2)[
Azure’s *Auto Scaling Application Block* is a component that enables automatic adjustment of deployed instances based on *defined scaling policies*.
It allows applications to *scale out* (add instances) or *scale in* (remove instances) in response to workload changes, ensuring both performance stability and cost efficiency.

Types of scaling rules:
- *Constraint rules*: useful to define lower or upper bounds on the number of instances of a certain role
- *Reactive rules*: dynamically trigger scaling actions in response to monitored metrics.
Related mechanisms:
- *Scaling Groups*: allow multiple roles to share common scaling logic and thresholds.
- *Throttling Actions*: temporarily limit workload intensity when scaling cannot keep up.
- *Stabilizer (Cooldown Period)*: prevents frequent up/down oscillations by enforcing a minimum time (typically 20 minutes) between scaling actions.
#figure(image("../images/7/scalingApplicationBlock.png", width: 75%))]
=== Throttling
Throttling is a *protective mechanism* that limits the rate at which clients or workloads can consume resources when system
capacity is under stress.
Throttling ensures *the system remains stable and continues to serve legitimate requests*, while preventing overload or resource
exhaustion.

Key concepts of throttling:
- * Rate limits / quotas* — define a maximum number of allowed operations per time window (e.g. requests per second, calls per minute).
- *Rejecting or delaying excess requests* — once limits are hit, further requests may be refused (e.g. HTTP 429) or queued/delayed.
- *Graceful degradation *— nonessential operations may be slowed or disabled to preserve core functionality.
- *Combining with auto-scaling* — throttling can act as a buffer until scaling completes; once new capacity is available, normal rates resume.
- *Per-tenant / per-user limits* — in a multi-tenant system, throttling prevents one user from monopolizing shared resources.
== Storage for persistent data
There are several options for storing persistent data in Azure PaaS applications, depending on the nature of the data and access patterns:
- *Blobs (Binary Large Object)*
	- Provide a simple interface for storing named files along with metadata for the file
	- Storage for any type of entity such as binary files and text documents
	- Is a *Distributed File Service (DFS)*
		- Scalability and High availability
		- BLOB file is distributed between multiple server and replicated at least 3 times
		- Only one level of folders is possible (called containers)
	- Access to BLOBs is provided through a *REST API*, which allows for operations such as uploading, downloading, and managing files.
- *Tables*
	- Provide lightly structured storage with a set of entities that contain a set of properties
	- Not RDBMS
		- No relationships between entities
		- NoSql – key-value with flexible schema
	- Entity can have up to 255 properties - Up to 1MB per entity
	- Mandatory Properties for every entity
		- PartitionKey & RowKey (the only indexed properties) 
			- Uniquely identifies an entity
			- Same RowKey can be used in different PartitionKey
			- Defines the sort order
		- Timestamp
	- Strongly consistent (every reader see the latest version of data)
	- Supported by the following frameworks:
		- .NET, Java, Android, C++, Node.js, PHP, Ruby, and Python
- *Queues*
	- Provide reliable storage and delivery of messages
=== Azure SQL Database
SQL Server in the cloud
- No administrative overheads
- Shared or Reserved (Dedicated) Hardware
- High Availability
	- database is up and running 99.99% of time
	- Azure automatically handles critical servicing tasks, such as patching, backups, Windows and SQL upgrades
- Pay-as-you-grow pricing
- Provide a familiar development model
=== CosmoDB
A fully managed, highly scalable, query-able, schema-free document database, delivered as a service, for modern applications
- Query against Schema-Free JSON
- Multi-Document transactions
- Tunable, High Performance
- Designed for cloud first
- Multi-model NoSQL
	- key-value, graph, column-family, and document
	- Automatic Indexing
	- Guarantees less than 10-ms latencies for both, reads and writes at the 99th percentile, all around the world