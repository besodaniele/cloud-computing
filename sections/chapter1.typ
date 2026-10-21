#import "@preview/scholia:0.1.0": *
We can define cloud computing in many ways, but the most important thing is to understand the basic definition.
A Cloud is a type of distributed system consisting of:

- *	interconnected* and *virtualized* computers
- *provisioned on demand* and
- *accessible* through a network.

Alternatively, we can say that cloud computing is:
- a *user experience*, in a sense that it is a way to provide services to users over the network, and
- an *infrastructure management methodology*, because it is a way to manage large numbers of highly virtualized resources so that they can be automatically aggregated to deliver services. 

We can give a more formal definition by the NIST (National Institute of Standards and Technology):
#definition[Cloud computing][Cloud computing is a *model* for enabling *convenient*, *on-demand network access* to a *shared* pool of
*configurable computing resources* (e.g., networks, servers, storage, applications, and services) that can be *rapidly provisioned and released with minimal management* effort or service provider
interaction.]
This cloud model promotes availability and is composed of:
- five essential characteristics,
- three service models, and
- four deployment models.
#figure(
	image("../images/1/charateristicsModels.png", width: 80%), caption: "Cloud computing characteristics and models"
)
This gives us a technological, economical, and societal model.
== Essential characteristics
The essential characteristics of cloud computing are:
- *On-demand self-service*:	
	- A consumer can unilaterally provision computing capabilities such as server time and network storage as needed automatically, without (or with little) requiring human interaction with a cloud provider.
- *Broad network access*:
	- Capabilities are available over the network and accessed through standard mechanisms that promote use by heterogeneous thin or thick client platforms (e.g., mobile phones, laptops, and PDAs) as well as other traditional or cloud- based software services.
- *Resource pooling*:
	- The provider’s computing resources are pooled to serve multiple consumers using a multi-tenant model, with different physical and virtual resources dynamically assigned and reassigned according to consumer demand.
- *Rapid elasticity*:
	- Capabilities can be rapidly and elastically provisioned to quickly scale up; and rapidly released to quickly scale down, automatically.
	-  To consumers, the capabilities available for provisioning often appear to be unlimited and can be purchased in any quantity at any time.
- *Measurable service*:
	- Cloud systems automatically control and optimize resource usage by leveraging a metering capability at some level of abstraction appropriate to the type of service. 
	- Resource usage can be monitored, controlled, and reported - providing transparency for both the provider and consumer of the service.
== Why cloud computing?
The cloud shape is often used in network diagrams to represent a "black box" network. The access *interfaces are known, but not the internal structure*.
A cloud is opaque and considered very large and distant.
As in the sky there are *different types of clouds* so there are *different types of services* and *features* offered in the cloud. The internal implementation of these services is *opaque*.

Clouds may overlap, that is, different models of clouds can be implemented by the same vendor.
Clouds can *dynamically change shape*. Applications and services in cloud can dynamically *adapt*.
== Data centers and cloud computing
Data centers are buildings that house hundreds of thousands of servers that simultaneously support many services and applications.
Data centers are built on a large scale to reduce maintenance costs, but not very large (also to limit blast radius).

Data centers exploit *virtualization* massively to run applications.

A data center requires:
- *Power supply* (generator system to overcome possible power failures).
- Continuous *cooling* system.
- *Security system* (fire alarms, adequate ventilation to eliminate smoke, authorized access, video cameras, security code access, biometric access, card reader access, locked cabinets...).
- *High-speed network*, within the data center, between data centers and to the Internet Often optical fiber, dedicated and proprietary lines, including intercontinental lines.
#definition[Availability zone][Every Availability Zone is an independent data center with its own power grid and network so that it is protected from possible failures in other data centers]
#definition[Region][A Region is a set of Availability Zones that are geographically close to each other and connected by low-latency links. A Region is isolated from other Regions, so that a failure in one Region does not affect other Regions]
== Virtual infrastructure manager (VIM)
A key challenge cloud providers face in building an infrastructure is managing physical and virtual resources, i.e., servers, storage and networks, holistically.
*Resource orchestration* must be performed in a way that quickly and dynamically delivers resources to users and applications.
The software tool responsible for the orchestration is called a *Virtual Infrastructure Manager (VIM)*.
This type of software resembles a traditional operating system ("cloud operating system") - but instead of dealing with a single computer, it aggregates resources from multiple computers, presenting a uniform view to the user and applications.
#figure(
	image("../images/1/vim.png",width: 80%))
