#import "@preview/scholia:0.1.0": *
A service model is, in this scenario, a high-level characterization (model) of the cloud that *focuses primarily on the services offered and the type of users*.
The set of service models defines a possible *taxonomy*.
== Infrastructure as a Service (IaaS)

#columns(2)[
The capability provided to the consumer (user or application) is to provision:
- virtual machines,
- storage,
- networks, and
- other fundamental computing resources
The consumer can deploy and run arbitrary software on the virtualized resources, which can include OS and applications.
The consumer *does not manage or control the underlying cloud infrastructure* but has *control over operating systems, storage, deployed applications*, and possibly limited control of selected networking components.
#figure(
	image("../images/2/IAAS.png")
)
]
This kind of technique is enabled by *virtualization*.
#figure(
	image("../images/2/RMI.png", width: 80%), caption: "IAAS architecture"
)
=== Resource Management Interface
RMI Enables the customer to obtain and manage several types of virtualized resource:
- *Virtual Machine*: IaaS provides the basic virtual machine operations, such as creation,, suspension, resumption and termination.
- *Virtual Storage*: IaaS provides the basic virtual storage operations, such as space allocation, space release, data writing and data reading. 
- *Virtual Network*: IaaS provides the basic virtual network operations, such as IP address allocation, domain name register, connection establishment and bandwidth provision.
=== System Monitoring Interface
There are several metrics to be monitored:
- *Virtual Machine*: As an IaaS provider, we should be able to monitor some system states of each virtual machine, such as CPU loading,, memory utilization, IO loading and internal network loading
- *Virtual Storage*: As an IaaS provider, we should be able to monitor some storage states of each virtual storage, such as virtual space utilization, data duplication and storage device access bandwidth, …etc.
- *Virtual Network*: As an IaaS provider, we should be able to monitor some network states of each virtual network, such as virtual network bandwidth, network connectivity and network load balancing
=== Properties of IaaS

- Manageability and Interoperability
	- System control, billing, API
- Availability and Reliability
	- Multiple copies of VMs, storage redundancy

- Scalability and Elasticity
	- On demand resource (ex. VMs) provisioning
#note[This technique is enabled by *virtualization*]
#figure(image("../images/2/propIAAS.png",width: 80%), caption: "Properties of IaaS")
== Platform as a Service (PaaS)
#columns(2)[
The capability provided to the consumer is to *develop and deploy* onto the cloud applications created using *programming languages and tools supported by the provider*.
The *consumer* does not manage or control the underlying cloud infrastructure including network, servers, operating systems, or storage, but has *control over the deployed applications and possibly application hosting environment configurations*.
#figure(image("../images/2/archiPAAS.png",width: 130%), caption: "PaaS architecture")
#colbreak()
#figure(image("../images/2/PAAS.png",width: 100%))
]
#note[This technique is enabled by *runtime environment*, that is acollection of software services available. Usually implemented by a collection of program libraries and an application execution engine]
PAAS offers different services:
- Users make use of *programming IDE* to *develop their service* over PaaS.  		
  -	This IDE should integrate the full functionalities supported from the underling runtime environment. This IDE should also provide development tools, such as profiler, debugger and testing environment. 
	- The programming APIs supported from runtime environment may be heterogeneous across different cloud providers, but there are still some common operating functions.
- *System Control Interface*
	- *Policy-Based Control*
		- Typically described as a principle or rule to guide decisions and achieve rational outcome(s)
		- Make the decision according to some requirements
		-  If \<condition\> then \<action\>
	-  *Workflow Control*
		-  Describes the flow of installation and configuration of resources
		- Delivers speedy and efficient construction and management of cloud resources
=== Properties of PaaS
Common properties in Runtime Environment :
- Manageability and Interoperability
- Performance and Optimization
- Availability and Reliability
- Scalability and Elasticity
#figure(image("../images/2/propPAAS.png",width: 80%), caption: "Properties of PaaS")
#pagebreak()
== Software as a Service (SaaS)
#columns(2)[The capability provided to the consumer is to use the *provider’s applications running on a cloud infrastructure*. The
applications are accessible from various client devices through a thin client interface such as a web browser (e.g., web-
based email).

The *consumer does not manage or control the underlying cloud infrastructure* including network, servers, operating systems, storage, or individual application capabilities, except for limited user-specific application configuration settings.
#note[This technique is enabled by *web services*]
Web 2.0 is the trend of using the full potential of the web:
- Viewing the Internet as a computing platform
- Running interactive applications through a web browser
- Leveraging interconnectivity and mobility of devices
- Enhanced effectiveness with greater human participation
#colbreak()
#figure(image("../images/2/SAAS.png",width: 100%))]
#figure(image("../images/2/archiSaaS.png",width:80%))
Services can be provided in many forms: 
- *web-base applications*.
	Conventional applications should translate their access interface onto web-based platform. Applications can have different domains:
	- General Applications : Applications which are designed for general propose, such as office suit, multimedia and
	instant message.
	- Business Applications : Application which are designed for business propose, such as ERP, CRM and market
	trading system.
	- Scientific Applications : Application which are designed for scientific propose, such as aerospace simulation and
	biochemistry simulation.
	- Government Applications : Applications which are designed for government propose, such as national medical
	system and public transportation system service.
- *Web portal*: Apart from the standard search engine feature, web portals offer other services such as e-mail, news, stock prices, information, databases and entertainment.	Portals provide a way for enterprises to provide a consistent look and feel with access control and	procedures for multiple applications and databases, which otherwise would have been different entities altogether.
=== Properties of SaaS
The properties offered by SaaS are the ones offered by the internet, that is *accessibility* and *portability*.
#figure(image("../images/2/propSaaS.png",width: 80%), caption: "Properties of SaaS")
== The SPI model
The SPI model (SaaS, PaaS, IaaS) is the most common classification of the cloud services.
But, be aware that the *real cloud is blurry*. The provider can offer different services at different levels, and it is not always easy to classify them.
#figure(image("../images/2/spi.png",width: 80%), caption: "The SPI model")