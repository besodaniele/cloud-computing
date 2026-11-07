#import "@preview/scholia:0.1.0": *
The current trend in the IT world is to move from a world of products to a world of services. This is a *paradigm shift* that is affecting the way we design, develop and deliver software applications.
== Internet of Things (IoT)
The *Internet of Things* is a system of physical objects that can be *discovered*, *monitored*,
*controlled*, or *interacted* with by electronic devices that communicate over various networking interfaces and *eventually can be connected to the wider internet*.
IoT deals with *ubiquitous communication and connectivity*:

- Older definitions focus mostly on connectivity and sensory requirements for entities involved in typical IoT environments.
- New definitions focus give more value to the need for ubiquitous and autonomous networks of objects where identification and service integration have an important and inevitable role.

In IOT, *services have a central role*
#definition[Service (informal)][A *service* is a program that performs specific tasks or provides value to users or other systems, typically over a network.]
Iot can be seen as a *servitization* of the real world:
- The transformation of physical objects and real-world environments into service-based systems by embedding connectivity, sensors, and smart technologies.
- The notion of physical products evolves to provide continuous, data-driven services rather than being static, standalone entities.
We see things as a *service*:
- Things consume/expose services
- High number of components involved in single applications
- Dynamic (re)configuration of applications
== Smart systems
In order to reach the goal of a world of services, we need to address several challenges and objectives in the design and implementation of smart systems:
- *Challenges*:
	- What is an Edge node? How does it connect to IoT and Cloud infrastructure?
	- Increasing capabilities/capacities of Edge resources
	- Data transfer to/from well-provisioned core data centers is expensive
	- Security/privacy concerns in moving data
	- Not all edge data is essential
	- How do we build a Smart System?
- *Objectives*:
	- Understand when and what data can be analyzed close to where it is captured (i.e., at the edges) – service/function orchestration
	- Effectively leverage resources close to the edge and in the network to support constraint-driven process (cost security, and QoS)
A system is any set of available variables selected by an observer to identity fundamental objects, the influential
attributes of the objects, and the relationships of these objects that result in a phenomena.

Basic assumptions:
- Objects can be tangible or intangible
- Objects have attributes
- There are relationships amongst the objects
- There are relationships amongst the object attributes
=== Service computing
*Services Computing* is a field of computer science that focuses on designing, developing, deploying, and managing services to enable efficient and scalable interactions between software systems.
A change was felt needed in systems design, deployment and maintenance compared to classical distributed architectures (web based monolithic apps).

*Traditional (distributed) systems* are single systems developed top-down by decomposition
- Generally, client-server
- Tight coupling: A single organization maintain/own the system
*Contemporary distributed systems* include third-party sub-systems
- E.g., a banking system does not offer only banking products to customers. It offers insurance contracts, event tickets, ...
- Loose coupling: Each component is maintained independently from the others
- Each software component should be able to serve different systems in different ways
=== Software ecosystem 
A Software Ecosystem consists of the *set of software solutions* that *enable, support and automate the activities* and transactions by the actors in the associated social or business ecosystem and the organizations that provide these solutions.

- Characteristics:
	- *Heterogeneous actors* (developers, users, organizations)
	- *Organic evolution* not centrally planned
	- *Fluid boundaries* continuously expanding
	- *Symbiotic relationships* between participants
	- *Distributed or market governance*
	- *Emergent innovation* from the bottom-up
- *Core Design Questions*
	- Interaction Capabilities: How to design components and enable them to interact?
	- Universal Interoperability: How to identify components that can interact in ANY environment?
	- Feature Advertisement: How can components advertise their features and characteristics?
	- Community Building: How to create a community of interacting individuals/components?
- *Service Components Context*
	- "Individuals" are service components implementing functionality
	- Features that need to be advertised include:
		- Interaction (interface and behavior)
		- Data exchanged between services
		- Non-functional aspects (technical specs, QoS, business rules, legal requirements)

But how can we support a software ecosystem?
- The use of protocols (HTTP) simplifies the access (consistent APIs)
- The use of media types and shared (JSON, XML) formats simplifies the data processing
- The use of components (Microservices) simplifies the identification of what functionalities a service provides and requests
- The use of containers simplifies the management issues (and provide required properties)
What is missing toward *dynamic systems*? (e.g., automatic discovery, composition, and execution)
- Let machines understand the* semantics of software* and associated properties
- Machine readable descriptions that can support [semi]automatic discovery, adaptation, composition and execution
=== Semantic Annotations
Semantic Web Services are too difficult to manage (mainly for the required skills and human effort)
- We need a simpler description format to annotate properties at semantic level to support machine interpretation and composition
- Associate contracts, defined as profiles, with services?
A profile is defined not to alter the semantics of the resource representation itself, but to allow clients to learn about additional semantics (constraints, conventions, extensions) that are associated with the resource representation, in addition to those defined by the media type and possibly other mechanisms.

Current initiatives of interests
- Open API Initiative (OAI) specification based on JSON and used by the Swagger-UI project to display the API and Swagger-Codegen to generate clients in various languages
- Dublin Core Application Profile (DCAP) guidelines defines metadata records which meet specific application needs while providing semantic interoperability with other applications on the basis of globally defined vocabularies and models.
== Edge vs. Cloud computing
As data volume and velocity increases, we need to rethink our Cloud/Data Centre architecture.
Move away from centralised solutions to more Peer-2-Peer Edge Clouds (Distributed Clouds).
How do we support service provisioning and orchestration at the Network Edge?
#columns(2)[
*Challenges*:
1. Increasing capabilities/ capacities of Edge resources
2. Data transfer to/ from well-provisioned core data centers is expensive
3. Security/privacy concerns in moving data
4. Not all edge data is essential
#colbreak()
*objectives*:
- Understand *when* and *what data* can be analyzed close to where it is captured (i.e., at the edges) #sym.arrow service/function orchestration
- *What is an Edge node*?
  How does it connect to IoT and Cloud infrastructure?
- Effectively *leverage resources close to the edge* and in the network to support constraint-driven process (cost security, and QoS)
]
== API economy
The *API Economy* refers to the *monetization, exchange, and reuse of digital assets and capabilities* through Application Programming Interfaces (APIs).
It is an *economic system* in which organizations expose their data, services, and processes via APIs, allowing external or internal developers, partners, and ecosystems to build new value-added products and services.
Cloud Computing Freely available application programming interfaces (APIs), openly available data, were among the early drivers of this paradigm.

A new as-a-service economy is emerging with value being provided and consumed via APIs:
- Cloud, mobile and social are fueling the hyper-growth of API-centric, business-as-a-service economies
- Companies that were born on the web are co-creating value with others through APIs at an accelerated pace; enterprises are starting to explore them
- Agile, scalable, and consumable business as-a-service will shift the business services market similar to the shift of IT delivery through cloud

Key characteristics of the API economy:
- *APIs as Products*: APIs are treated as standalone products, often monetized directly or indirectly.
- *Value Creation:* APIs enable businesses to share services or data, leading to new opportunities.
- *Ecosystem Building:* APIs create interconnected systems of businesses, developers, and customers.
- *Composability*: Digital services are composed dynamically from multiple APIs, enabling rapid innovation and modular architectures.
- *Innovation Enabler:* External developers can build novel applications using existing APIs.
- *Revenue Generation:* Businesses monetize APIs via  subscription, pay-per-use, or partnerships
#figure(image("../images/9/benefits.png"), caption: "Benefits of the API economy")
*Challenges*:
- *Security Risks*: APIs expose data that can be exploited if not secured.
- *Complex Management*: Scaling and maintaining APIs in large ecosystems.
- *Monetization Balance*: Offering free vs. paid tiers for profitability.
One should distinguish between the use of APIs and implementing a service oriented architecture (SOA). SOA is a design paradigm that focuses on structuring software systems as a collection of loosely coupled services, while APIs are the interfaces through which these services are accessed.
#figure(image("../images/9/soa.png"), caption: "SOA vs API")
== System of systems
A *System of Systems* is a collection of independent, self-contained systems that interact to create a larger, more complex system that achieves objectives or functionalities beyond the capabilities of the individual systems.

Key Characteristics:
- Each constituent system is *operationally and managerially independent*.
- *Distributed control* — no single authority governs all subsystems.
- *Emergent behavior* arises from system interaction.
- Typical in *cyber-physical or critical domains* (defense, transport, smart cities).
Goal:
- To achieve emergent capabilities through the collaboration of autonomous systems.

How a global system can be organized?

" ... Different application types will reside where the delivery model best supports client expectations, risk, compliance, service continuity and regulatory issues. *This model moves IT away from the traditional, on-premises, full-control model toward a distributed computing model* ... "
#figure(image("../images/9/system.png",width: 60%))
*[Enterprise] IT systems* tend to be composed of complementary Layers:
- *Systems of engagement*: systems designed to facilitate interaction, collaboration, and communication between people, often focusing on creating personalized, user-centric experiences.
	- The external, visible part of a system
	- Focus on people and products, not processes
	- Lightweight, dynamic
- *Systems of records*: systems designed to manage and maintain structured data and support key business processes such as transactions, accounting, and compliance.
	- The internal, invisible part of a system
	- Focus on business processes, and data (transactions, accounting…)
	- Heavyweight, static
- *Systems of automation*: systems designed to automate tasks and processes, reducing or eliminating the need for human intervention.
	- Focus on connecting and automating the physical world
Each of the layers (Record, Engagement, Insight, Automation) is a system in its own right.
They operate independently, often with different
governance, technologies, and lifecycles.
The enterprise as a whole functions as a System of Systems, where coordination yields emergent capabilities. 
=== The Systems of Record
“Systems of Record” (SoR) are the traditional enterprise systems and applications that *handle business
transactions* and other artifacts that constitute all the enterprise records.
- Designed to provide core *transactional systems*.
- *Databases* are at the center of these systems.
- *OLTP* and *Business Intelligence* are key drivers.
- The *network* is viewed primarily as a transport mechanism.
- *Essential* to day-to-day business operations.
- Must meet *regulatory compliance* requirements.
- High *QoS requirements* for performance and availability. 
=== Systems of Engagement
The System of Engagement describes how IT should interact in a similar way to how consumers and employees do — with context-rich, immediate, and intuitive digital experiences.

“Empower customers, employees, and partners with context-rich apps and smart products to help them decide and act immediately in their moments of need.”
- Improve *interactions with customers* to meet heightened expectations.
- Enable *self-service* to increase customer satisfaction.
- Attract more business by creating *new business models*.
#figure(image("../images/9/engagementeRecord.png",width: 80%))
=== Systems of insight
A System of Insight analyzes data and generates actionable intelligence to guide decision-making processes.
It collects, process, and interpret data from various sources to deliver insights that organizations can use to improve operations, customer experiences, or strategic outcomes. Systems of Insight bridge the gap between data and action.

Loop of activities:
1. discover the insights that matter most;
2. embed them into the software their customers and employees use to engage; and
3. continuously measure and learn from the results.
#figure(image("../images/9/insight.png"),caption:"Building blocks of a system of insight")
#figure(image("../images/9/data.png"),caption:"Amount of data generated by each system")
Technical elements to build a system of insight
- *Small cross-functional insights teams*, sponsored by a leader with accountability for a business outcome. These teams will combine business domain expertise, data science skills, engineering expertise, and software development know-how to find, test, and implement insights.
- *A repeatable insight-to-execution process* that integrates data science, collaboration, governance, and agile implementation workflows. Without a repeatable process you won’t have a system, just a bunch of people sifting through a sea of data for occasional nuggets.
- *A digital insights architecture* that will be built off the big data management and agile BI work you have done. It will add insights delivery engines and data feed management capabilities and provide a pluggable fabric for insight discovery, collaboration, and governance tools.
== Service science
Services Science is the interdisciplinary application of science, engineering, and management for the purpose of improving services.

Services science also contributes to systematic innovation and improved productivity and is the guiding force for the
improvement of services through improved predictability in the productivity, quality, performance, compliance, development, reusability of knowledge, and operational innovation in services.

A *service system* integrates people, organizations, technologies, and information resources to co-create value.
The system’s ability to scale depends on how these resources are combined to deliver competence as a service.
Service systems integrate organizations, people, technology, and knowledge resources in different proportions to deliver value.

What makes Services Science hard is that it is *multidisciplinary*.
- Services depend critically on people, technology, organizations, and *co-creation* of value
- People *work together* and with technology and with organizations to provide value for clients
- *Shared information* helps coordinate activities – language, laws, measures, models, etc.
- So a *service system* is a complex *socio-techno-economic* system
- Growth requires innovation that combines *people, technology, organizations, value, shared information, clients*
- A service system is a value coproduction configuration of people, technology, internal and external service systems connected by value propositions, and shared information
- Services systems are both designed (Artificial) and shaped by evolutionary forces (Natural)

Services science aims to *research services* in the same *scientific manner* that spurred success in the manufacturing industry, and to make it easier to increase productivity through a scientific approach to modeling. At the same time, Services Science also *aims to make it easier for both clients and providers to forecast the future effects and risks of introducing services*, and to allow rational sharing of these effects and risks.

A Service Science professional collaborates with scientists, engineers, managers, and designers in interdisciplinary teams. To work effectively, they must combine *broad communication and collaboration skills* with deep expertise in a specific domain.

To Ensure that new service implementations or adaptations of existing environments
consider the IT alternatives and factors such as cultural and human system dynamics.
He/she must be able to analyze and model large and/or complex service systems across various sectors
of the service economy.
Demonstrates customer interaction skills equivalent to a business consultant
seeking to improve productivity, quality, regulatory compliance, or innovation of a service system.
Sustains effectiveness by ongoing discovery, analysis, and implementation
of emerging service innovation frameworks and tools (lifelong learning).