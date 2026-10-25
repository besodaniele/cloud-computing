#import "@preview/scholia:0.1.0": *
Cloud computing is a paradigm of computing, a new way of thinking about IT industry but *not any specific technology*.
#columns(2)[
Central ideas:
- Utility Computing
- SOA - Service Oriented Architecture
- SLA - Service Level Agreement
#colbreak()
Enabling techniques:
- Virtualization
- Parallelized and distributed computing
- Service-oriented computing
- Autonomic Computing
]
- *scalability* → *elasticity*
	- ability → dynamic resource mechanism

- *availability* → *reliability*
	- service property → fault-tolerance mechanism
- *manageability* → *interoperability*
	- ability to manage → ability to integrate heterogeneous systems
- *accessibility* → *portability*
	- ability to access/use → ability to move across environments
- *performance* → *optimization*
	- desired outcome → improvement mechanism
#figure(image("../images/4/characteristics.png", width: 70%), caption: "Cloud computing characteristics")
== Utility Computing
#definition[Utility Computing][Utility Computing is a computing model in which computing resources, such as processing power, storage and networking are provided to users as metered services, similar to traditional public utilities like electricity, water, or gas.]
Users do not own or manage the underlying hardware or infrastructure. Instead, they access computational resources on demand and pay only for the amount they actually consume.

Users do not care about *how* the work is done. Instead, they only concern about what they can get.

Users do not care about *what* the provider does. Instead, they only concern about the quality of service.

Users do not *own* the physical infrastructure.
Instead, they only pay per usage

Users typically only care about the *quality of service*.

Utility computing is a model for *service provisioning*: the service provider makes *computing resources* and *infrastructure management available* to the customer as needed, and *charges them for specific usage* rather than a flat rate.

Like other types of on-demand utility, the utility model seeks to
*maximize the efficient use of resources* (provider side) and/or
*minimize associated costs* (provider and user).
=== Service oriented architecture (SOA)
#definition[Service Oriented Architecture][Service Oriented Architecture (SOA) is essentially a collection of services which communicate with each other.]
This type of architecture provides a loosely-coupled suite of services that can be used within multiple business domains.
Usually it is implemented using the Web Service model.
#definition[Quality Of Service][*QoS* (in the cloud context) denotes the *levels of performance*, *reliability*, and *availability* offered by the platform or infrastructure that hosts a reference application.]
#definition[Service Level Agreement][*A service-level agreement (SLA)* is a *contract between a service provider and a customer* that specifies, usually in measurable terms (QoS), what level of service the provider will furnish.
Defines the *non-functional characteristics* guaranteed by the service. An SLA includes several *SLOs (Service Level Objectives)* that define the quality of service to be guaranteed through specific metrics.]
#figure(image("../images/4/SLA.png", width: 100%), caption: "Service Level Agreement (SLA) and cloud infrastructure.")

== Scalability and Elasticity

- *Scalability* is a property of a system, a network, or a process, indicates its ability to either handle growing amounts of work in	a graceful manner or to be readily enlarged (empowered).
- *Elasticity* is the ability to enforce adaptive “autonomic” actions to enable scalability.
These properties are achieved by *scaling*:
#columns(2)[
*vertical* (up or down):
	- More powerful computing resources or bigger servers
	- Single point of failure
	- Human intervention
	- Reasonable management overhead
#colbreak()
*horizontal* (out or in):
	- More computing resources (e.g., servers)
	- Reliable – fail-over scenario (there is at least 	one node to take over)
	- It can be fully automated (especially in the cloud)
	- Growing management complexity
]
#definition[Dynamic provisioning][Dynamic Provisioning describes a complex networked computing environment where *computing instances* are *provisioned* or *deployed* from an administrative console or client application.]
The system might enable rules of automatizing the provisioning.
In traditional computing model, two common problems:
- *Loss revenue / Loss Users* because of under provision (underestimation of system utilization).
- Organizations *overestimate* system utilization to ensure they can handle peak loads.
=== Traditional provisioning
Traditional provisioning involves allocating resources based on peak capacity requirements. Organizations *overestimate* system utilization to ensure they can handle peak loads.
This conservative approach results in:
- Low average utilization: Resources sit idle during non-peak periods
- Higher operational costs: Paying for capacity that isn't being used most of the time
- Capital inefficiency: Significant investment in infrastructure that delivers poor return on investment.
This traditional model contrasts with modern cloud computing approaches, where resources can scale dynamically to match demand, reducing waste and improving cost efficiency.
=== Dynamic provisioning
Cloud resources can be be provisioned dynamically in response to actual demand patterns (Elasticity):
- *Meet seasonal demand variations*: Handle predictable cycles like holiday shopping periods or tax season.
- *Meet demand variations between different industries*: Adapt to sector-specific patterns and business cycles.
- *Meet burst demand for some extraordinary events*: Scale rapidly for unexpected spikes like viral content or flash sales.
With dynamic provisioning:
- Capacity (red dashed line) now closely follows the demand curve
- Resources scale up and down automatically to match actual needs
- The gray shaded area (waste) is dramatically reduced
- Capacity and demand are nearly aligned throughout the entire cycle
#note[
Organizations that do provisioning *without using cloud technologies* must commit to fixed capacity investments based on imperfect forecasts, inevitably leading to periods of both over-provisioning (waste) and under-provisioning (service issues). This inflexibility makes it nearly impossible to optimize costs while maintaining adequate performance.

*Cloud provisioning* creates near-perfect alignment between capacity and demand throughout the entire lifecycle, eliminating both waste and under-provisioning while converting fixed capital costs into variable operational expenses. This methodology gives us:
- No under-supply
- Reduction of over-supply
- Reduction of initial investments
- Improved Performances]
== Availability and Reliability
- *availability*:
	- is the proportion of time a system is in a functioning condition expressed as 100% minus unavailability
	- Cloud infrastructure usually provides high availability Ex. “Five Nines” system would statistically provide 99.999% availability
- *reliability*:
	- the ability of a system to perform its required functions under stated conditions for a specified period of time.
How to achieve these properties (at application level)?
- Fault tolerance system
- System resilience
- Reliable system security
=== Fault tolerance
Fault-tolerance is the property that enables a system to *continue operating properly* in the event of the *failure* of some of its components.
If the operating quality decreases at all, the decrease must be proportional to the severity of the failure, as compared to a naively-designed system in which even a small failure can cause total breakdown.

Four basic actions:
- No *single point of failure*
	- One of the possible flaws in designing an application system
	- A part of a system which, if it fails, will stop the entire system from working
	- Preventive identification of the critical components of a system that would provoke a total systems failure in case of malfunction.
	- Can be prevented by *replication* of the critical components
- *Fault detection* of the failing component
	- *Fault Detection and Isolation (FDI)*: A subfield of control engineering which concerns itself with monitoring a system, identifying when a fault has occurred and pinpoint the type of fault and its location.
- *Fault containment* to prevent propagation of the failure
	- When a failure occurs, the system must be able to isolate the failure to the offending component.
	- To avoid other components to be taken down by the erratic or unexpected behavior
	- In the cloud usually faulty components are identified, isolated and terminated automatically
- Availability of *reversion* modes
Actions are implemented at Cloud level but the Cloud can help the designer to implement them at application level.
=== System resilience
Resilience is the ability to provide and maintain an *acceptable level of service* in the face of faults and challenges to normal operation. Resiliency pertains to the system's ability to *return to its original state* after encountering troubles.
If a failure event knocks a system offline, a highly resilient system will return back to work and function as planned as
soon as possible.
#definition[Disaster Recovery][Disaster recovery is the set of *policies* and *procedures* related to be *prepared* for and *execute* the recovery after a disaster.]
Some common strategies involve the use of backups of the whole system to an off-site location done periodically and the preparation of local mirrored systems, surge protection and UPS (Uninterruptible Power Supply) systems to ensure that the system can continue to operate in the event of a power outage.
=== System Security
Cloud security is a sub-domain of computer security, network security, and, more broadly, information security.
It refers to a broad set of *policies*, *technologies*, and controls deployed to *protect data*, *applications*, and the associated *infrastructure* of cloud computing.

Important security and privacy issues :
- *Data Protection*
	- To be considered protected, data from one customer must be properly segregated from that of another.
- *Identity Management*
	- Every enterprise will have its own identity management system to control access to information and computing resources.
- *Application Security*
	- Cloud providers should ensure that applications available as a service via the cloud are secure.
- *Privacy*
	- Providers ensure that all critical data are masked and
	- that only authorized users have access to data in its entirety.
== Manageability & Interoperability
*Manageability*:
- The ability of a system to be controlled either by means of self-control or by providing certain techniques to ease external controls
- Enterprise-wide administration of cloud computing systems.
*Interoperability*:

Interoperability is a property of a product or system to work with other products or systems, present or future, without
any restricted access or implementation.
- Open interfaces / open access
- Web based interfaces
- Virtualization
These properties are achievable by system state monitoring and control automation.
=== System Monitoring
A System Monitor is a process within a distributed system for collecting and storing state data.
- Physical and virtual hardware state
- Resource performance metrics
- Network access patterns
- System logs
- ... etc
=== Billing System
Users pay per the *resources they used*.
Cloud providers must 
- determine the list of *service usage price*
-  *record* the resource or service usage of each user, and then charge users by these records.
	-  Get those information by means of monitoring system.
	-  Automatically calculate the total amount of money which user should pay.
	-  Automatically request money from use’s banking account.
== Performance optimization
This can be achieved by means of *load balancing*.
#definition[Load balancing][Load balancing is a technique to *distribute workload evenly* across two or more computers, network links, CPUs, hard drives, or other resources, in order to get *optimal resource utilization*, maximize throughput, minimize response time, and *avoid overload*.]
=== Economical aspects of cloud computing
Some aspects of cloud computing to be considered in an economic assessment:
- Model pay-as-you-go: no upfront costs for the cloud user - pay only for what you consume:
	- Form Capital Expenditure (*CAPEX*)
	- To Operational Expenditure (*OPEX*)
Elasticity gives risk transfer:
- No risks associated with incorrect sizing of the necessary infrastructure
- Provider absorbs infrastructure risk
Cloud give both the provider and the user the benefit of *economies of scale*:
- *Infrastructure Efficiency*: Large data centers achieve lower per-unit costs for compute, storage, networking,
electricity, cooling, and physical space
- *Cost Advantages*: providers pass savings to users through competitive pricing that small/medium organizations cannot match independently
- *Expertise Pooling*: Access to world-class skills, best practices, and cutting-edge technologies without building internal capabilities