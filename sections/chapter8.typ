#import "@preview/scholia:0.1.0": *
IaaS (Infrastructure as a Service) provides virtual servers available in the Cloud, they are bare machines.

PaaS (Platform as a Service)
provides virtual application platforms (e.g., Python Flask, Node JS Express and JAVA Spring Boot)
- removes the need to manage the Operating System;
- keeps the requirement to manage scalability and package a complete application for deployment to the platform;
- does not provide the level of automation required for running a large number of microservices;
- requires container orchestration platforms like Kubernetes, Docker Swarm and OpenShift as PaaS solutions.

Serverless Computing provides compute resource abstraction to its logical conclusion.

It allows developers to build and run applications without managing the underlying infrastructure. It is a cloud-computing service model (another) where the
cloud provider automatically manages the servers.

Instead of provisioning, scaling, and maintaining servers, developers focus on
writing code, while cloud providers take care of the infrastructure.
== Backend as a Service (BaaS)
Serverless was first used to describe applications that significantly or fully incorporate third-party, cloud-hosted applications and services, to manage server-side logic and state.
1. cloud databases and message brokers (e.g.: Parse, Firebase, …)
2. authentication services (e.g.: Auth0, AWS Cognito)
These types of services have been previously described as “*(Mobile) Backend as a Service" (BaaS)*, mobile because services to back up mobile applications are mainly provided.
- Traditional approach: Develop and deploy your own backend services.
- BaaS approach: Compose your application using ready-to-use backend services provided by a cloud provider.
#figure(image("../images/8/baas.png"))

*Pro*
- Reduced Development Effort
- Reduced Infrastructure Management
- Scalability
- Faster Time to Market
*Cons*
- Limited Control: Developers have less control over the implementation and configuration of the backend.
- Vendor Lock-in: The application may become dependent on the provider’s specific APIs and features.
- Security: The application relies on the provider’s security practices and data protection policies.
- Cost: Costs may increase as usage grows and depend on the provider’s pricing model.
== Function as a Service (FaaS)
Serverless can also mean applications where the server-side logic is still written by the application developer, but, unlike traditional architectures, it runs in compute containers in form of functions.

These containers/functions (usually) are:
- *event-triggered* (they are executed in reaction to an event),
- *ephemeral* (may only last for one invocation), and
- *fully managed* by a third party (generally, the cloud provider).
#figure(image("../images/8/faas.png"),caption:[Function as a Service (FaaS) architecture])
#note[By using BAAS and FAAS, we obtain serverless computing]
#figure(image("../images/8/merge.png",width: 80%),caption:[Serverless computing architecture])
=== FaaS enabler: API Gateway
An API gateway is an HTTP server where routes are defined in configuration, and each route is associated with a resource to handle (handler) that route.
In a Serverless architecture such handlers are often FaaS functions.
1. When an API gateway receives a request, it finds the routing configuration matching the request, and, in the case of a FaaS-backed route, will call the relevant FaaS function.
2. The FaaS function will execute its logic and return a result to the API gateway, which in turn will transform this result into an HTTP response that it passes back to the original caller.
Beyond purely routing requests, API gateways may also perform authentication, input validation, response code mapping, and more.

Amazon’s API Gateway is a BaaS service, that you configure, but do not need to run or provision yourself.
=== State
#note[FaaS functions have significant restrictions when it comes to *local state*.
Local state=data stored in variables in memory, or in a local disk]
There is *no guarantee* that such state is persisted across multiple invocations.

FaaS functions are described as stateless, but it’s more accurate to say that any state of a FaaS function that is required to be persistent needs to be externalized outside of the FaaS function instance.
=== Time (duration and startup)
FaaS functions are typically *limited* in how long each invocation is allowed to run. AWS Lambda function at most 15 minutes, before being terminated.
#note[Long-lived tasks are *not suited* to FaaS functions
Trick: you may create a chain of several different FaaS functions, whereas in a traditional environment you may have one long-duration task]
It takes some time for a FaaS platform to initialize an instance of a function before each event (from a few milliseconds to several seconds).
Initialization of a Lambda function will either be a:
- warm start: reusing an instance of a Lambda function from a previous event.
- cold start: creating a new instance, starting the function, host process, etc.
The Cold start could be a problem depending on:
- the programming language used to create the function,
- how many libraries are used in the function,
- how much code you have in the function,
- the configuration of the function environment
#figure(image("../images/8/functionLifeCycle.png"))

=== pros and cons
*Benefits* of FaaS:
- Reduced operational cost (Serverless is, at its most simple core, an outsourcing solution)
- Reduced development cost
	- A BaaS database removes much of the database administration overhead
	- Reduced packaging and deployment complexity
	- Reduced time to market and high flexibility
- Reduced execution costs
	- unless you have a very steady traffic shape that uses the whole capacity of your server hosts, then you can save money using FaaS
- Greener computing
	- Reduce inefficiency
*Drawbacks* of FaaS:
- Vendor control – Vendor Lock-in
	- system downtime, unexpected limits, cost changes, loss of functionality, forced API upgrades
- Multitenancy problems
	- Security, robustness, performance
- Limitations in the function duration
- Startup latency
- Testing, Debugging, Monitoring
	- Currently difficult or limited
== Amazon Lambda
1. *No servers to provision (nor roles, permissions, and other settings)*
	#note[«AWS Lambda lets you run code without provisioning or managing servers.»]
	FaaS is about running backend code without managing your own server
	systems or your own long-lived server applications.
	A server isn’t needed, nor an application (in the server) that is running constantly.
	No Server, VM, Container for long running applications
2. *Sub second metering*
	#note[«You pay only for the compute time you consume - there is no charge when your code is not
	running»]
	With AWS Lambda, you are charged:
	- for every 100ms your code executes and
	- number of times your code is triggered.
	You don't pay anything when your code isn't running.
3. *Language agnostic*
	#note[«With Lambda, you can run code for virtually any type of application or backend service - all
	with zero administration».]
	FaaS offerings do not require coding to a specific framework or library.
	FaaS functions are regular applications.
	AWS Lambda functions can be implemented in Javascript, Python, Go, any JVM language (Java, Clojure, Scala, etc.), or any .NET language.
	Or any language that can compile down to a Unix process or a Docker container.
4. *Resource provisioning*
	#note[«Just upload your code and Lambda takes care of everything required to run»]
	Deployment is very different from traditional systems since we have no server applications to configure.
	In a FaaS environment, we upload the code for our function to the FaaS provider, and the provider does
	everything necessary for provisioning resources, instantiating VMs, managing processes, etc.
5. *Automatic scalability*
	#note[«and scale your code with high availability.»]
	Horizontal scaling is completely automatic, elastic, and managed by the provider.
	If your system needs to be processing 100 requests in parallel the provider will handle that without any
	extra configuration on your part.
	With FaaS the vendor handles all underlying resource provisioning and allocation—no cluster or VM
	management is required by the user at all.
6. *Events*
   #note[«You can set up your code to automatically trigger from other AWS services»]
	 Functions in FaaS are typically triggered by event types defined by the provider.
	Amazon AWS includes
	- S3 (file/object) updates,
	- time (scheduled tasks),
	- and messages added to a message queue.
7. *http requests*
  #note[«or call it directly from any web or mobile app.»]
	Most providers also allow functions to be triggered as a response to an HTTP requests by using a component called API gateway.
== Serverless vs PaaS
The difference between Serverless Computing and Platform as a Service (PaaS) lies in the level of abstraction, scaling, and billing.
=== Level of Abstraction
- PaaS: 
  
  The cloud provider offers a platform where developers can deploy and run their applications, but they still need to configure and manage parts of the infrastructure. Developers control the runtime, but the underlying hardware and operating system are managed by the provider.
- Serverless: 
  
	Serverless takes abstraction a step further. Developers only write functions or small services, and the cloud provider manages everything else—including scaling, infrastructure, runtime, and operating systems.
=== Scaling
- PaaS: 
	Applications need to be scaled either manually or automatically, but developers are responsible for ensuring the application can handle scaling. There is typically a base resource	allocation that runs continuously, even during low traffic periods.
- Serverless: 
  
	Serverless systems scale automatically and dynamically with workload demands. 
	They can scale to zero when there is no traffic, meaning you don’t pay for idle resources. 
	Serverless is event-driven—functions only run when invoked, and the cloud provider manages scaling without any intervention from the developer.

=== Billing
- PaaS: 
  
	PaaS charges you based on the resources allocated, whether they are fully utilized or not.
	This means you may still incur costs when your application is running but not being actively used.
- Serverless: 
  
	In serverless, you pay only for the actual compute time (i.e., when your code is executed). There are no charges when your function is idle, leading to potentially significant cost savings for applications with variable loads.

== summary
#columns(2)[
Serverless is good for:
- short-running
- stateless
- event-driven
examples of applications:
-	Microservices
-	Mobile Backends
-	IoT
-	Modest Stream Processing
-	Bots, ML Inferencing
-	Service integration
#colbreak()
Serverless is not good for:
- long-running
- stateful
- data crunching
examples of applications:
- Databases
- Deep Learning Training
- Big Data Analytics
- Heavy-Duty Stream Analytics
- Numerical Simulationf(x)
- Video Streaming
]
