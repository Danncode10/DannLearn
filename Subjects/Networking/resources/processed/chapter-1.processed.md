# Chapter 1: Communication in a Connected World - Processed Notes

## Source

- Subject: Networking
- Raw resource: `Subjects/Networking/resources/raw/CHAPTER-1.pdf`
- Resource type: PDF, 17 pages, Microsoft Word 2019 export
- Processed at: 2026-07-26

## Extraction Notes

- What was extracted: Text was extracted page by page from the tagged PDF. Rendered page images were visually reviewed to identify diagrams, device photos, and transmission illustrations.
- What could not be extracted: Images and diagrams were not available as structured semantic data. Exact embedded image alt text, fine visual details, and any labels too small to read from the render could not be fully verified.
- Visual interpretation confidence: Medium. Most figures are simple device images, topology diagrams, or transmission diagrams that match the surrounding text, but they were described from visual rendering rather than OCR/diagram parsing.

## High-Level Summary

Chapter 1 introduces communication in a connected world. It explains why modern society depends on computer networks, defines basic network components, compares wired and wireless media, describes common network topologies and network types, introduces peer-to-peer and client-server models, and explains basic data transmission concepts. The chapter ends with bandwidth and throughput, including a simple throughput formula and factors that affect actual network performance.

The chapter also includes a Cisco Packet Tracer laboratory activity where students create a small network with 4 PCs, 1 switch, and 1 router, then configure IP addresses and perform a ping test.

## Key Terms

| Term | Meaning | Source location |
|---|---|---|
| Computer network | A collection of interconnected devices that exchange data using communication protocols. | Page 2 |
| End devices / hosts | Devices used by people, such as desktops, laptops, smartphones, tablets, printers, servers, and smart TVs. | Pages 2-3 |
| Intermediate devices | Devices that connect other devices together, such as routers, switches, hubs, access points, and firewalls. | Pages 3-5 |
| Router | Connects different networks, selects the best path, and can connect a LAN to the Internet. | Page 3 |
| Switch | Connects devices inside a LAN, uses MAC addresses, and enables faster communication. | Page 4 |
| Hub | Broadcasts data to all devices; described as older and less secure technology. | Pages 4-5 |
| Access point | Provides wireless connection and connects Wi-Fi devices. | Page 5 |
| Firewall | Filters incoming traffic, blocks unauthorized access, and improves security. | Pages 5-6 |
| Wired media | Physical network media such as UTP cable, STP cable, fiber optic, and coaxial cable. | Page 6 |
| Wireless media | Wireless communication examples include Wi-Fi, Bluetooth, and satellite. | Pages 6-7 |
| Bus topology | A network layout where every device connects to a single central backbone cable. | Page 7 |
| Star topology | A layout where each device connects individually to a central hub or switch. | Page 8 |
| Ring topology | A layout where devices connect in a circular closed loop, with each device linked to exactly two others. | Pages 8-9 |
| Mesh topology | A layout where devices are interconnected with multiple data paths, improving reliability and redundancy. | Page 9 |
| Hybrid topology | A custom architecture that combines two or more standard topologies. | Page 10 |
| Local Area Network (LAN) | A group of interconnected computers and devices within a limited area such as a home, school, or office. | Page 10 |
| Wide Area Network (WAN) | A network that extends over a large geographic area, usually connecting multiple LANs. | Page 11 |
| Peer-to-peer (P2P) | A decentralized model where each node can act as both client and server. | Pages 11-12 |
| Client-server | A centralized model where clients request data or services from a central server. | Page 12 |
| Data transmission | The movement of digital information between devices. | Page 13 |
| Binary | Representation of data using base-2 values, 0 and 1. | Page 13 |
| Bit | The smallest unit of data, holding either 0 or 1. | Page 13 |
| Byte | A basic unit of digital information traditionally composed of 8 bits. | Page 13 |
| Simplex | One-way communication. | Page 14 |
| Half duplex | Two-way communication where devices take turns transmitting. | Page 14 |
| Full duplex | Two-way communication where both directions can transmit simultaneously. | Page 15 |
| Serial transmission | Sends data bits sequentially, one at a time, over a single wire or channel. | Page 15 |
| Parallel transmission | Sends multiple bits simultaneously over separate wires or channels. | Page 16 |
| Bandwidth | The maximum capacity of a communication channel. | Page 16 |
| Throughput | The actual amount of data transferred. | Page 17 |

## Main Ideas

- Networks support modern communication, business, education, entertainment, healthcare, government services, and daily digital activities.
- Computer networking enables communication, resource sharing, remote access, cloud computing, online education, smart devices, e-commerce, and digital banking.
- A computer network depends on end devices, intermediate devices, and network media.
- End devices send, receive, and process information.
- Intermediate devices connect devices and networks, direct traffic, provide wireless access, and improve security.
- Wired and wireless media each have advantages and disadvantages.
- Network topology affects cost, reliability, troubleshooting, performance, and fault tolerance.
- LANs and WANs differ mainly by geographic scope.
- Peer-to-peer and client-server models organize resource sharing differently.
- Data transmission depends on representation, media, directionality, and transmission type.
- Bandwidth is a channel's maximum capacity, while throughput is the actual delivered data rate.

## Important Details

- Learning outcomes focus on recognizing the importance of digital communication, explaining global connectivity, identifying real-life applications, and recognizing the impact of communication technologies on business, education, and daily life. (Page 1)
- Real-life communication technology examples include email, social media, and video conferencing. (Page 1)
- Wired media examples: UTP cable, STP cable, fiber optic, coaxial. (Page 6)
- Wired media advantages: stable, faster, secure. (Page 6)
- Wired media disadvantage: limited mobility. (Page 6)
- Wireless examples: Wi-Fi, Bluetooth, satellite. (Pages 6-7)
- Wireless advantages: mobility and easy installation. (Page 7)
- Wireless disadvantages: signal interference and security concerns. (Page 7)
- Bus topology advantages: cheap and easy installation. (Pages 7-8)
- Bus topology disadvantage: one cable failure affects the network. (Page 8)
- Star topology is described as the most common layout today. (Page 8)
- Star topology advantages: easy troubleshooting and high performance. (Page 8)
- Mesh topology advantage: high reliability. (Page 9)
- Mesh topology disadvantage: expensive. (Pages 9-10)
- LAN examples: school, office, home. (Pages 10-11)
- WAN example: Internet. (Page 11)
- Peer-to-peer advantages: cheap and easy. (Page 12)
- Peer-to-peer disadvantage: weak security. (Page 12)
- Client-server advantages: centralized, secure, scalable. (Page 12)
- Guided transmission media examples: twisted pair, fiber, coaxial. (Page 13)
- Unguided transmission media examples: radio, infrared, microwave, satellite. (Pages 13-14)
- Simplex example: television. (Page 14)
- Half duplex example: walkie-talkie. (Page 14)
- Full duplex example: telephone. (Page 15)
- Serial transmission examples: USB and Ethernet. (Page 15)
- Parallel transmission is described as older technology and suited to short distances such as inside computers because of cost. (Page 16)
- Bandwidth units listed: bps, Kbps, Mbps, Gbps, Tbps. (Page 16)
- Throughput formula: `Throughput = Data Successfully Delivered / Time`. (Page 17)
- Example throughput calculation: 100 MB downloaded in 20 seconds gives 5 MB/s. (Page 17)
- Factors affecting throughput: network congestion, distance, signal quality, interference, hardware capability, protocols, errors, and bandwidth. (Page 17)

## Tables / Figures / Graphs

### Connected Network Overview Diagram

Description: A simple network illustration shows the Internet/cloud connected through a firewall/router-like path to multiple devices such as a PC, phone, and laptop. It supports the definition of a computer network as interconnected devices exchanging data.

Extracted text: Labels visible in the rendered diagram include device and network-related labels, but the full diagram text was not structurally extracted.

How to read this: Read the diagram from the Internet/cloud toward the connected user devices to see how network infrastructure links end devices.

Confidence: Medium

### Intermediate Device Photos

Description: The chapter includes photos or illustrations for a home Wi-Fi router, switch, hub, access point, and firewall. These visuals reinforce the list of intermediate network devices and their roles.

Extracted text: Surrounding text identifies the devices and lists their functions.

How to read this: Match each device image with the function bullets directly above or below it.

Confidence: Medium

### Network Media Images

Description: The chapter shows examples of wired media, including cable images, and wireless media, including icons/images for Wi-Fi, Bluetooth, and satellite.

Extracted text: Surrounding text lists UTP cable, STP cable, fiber optic, coaxial, Wi-Fi, Bluetooth, and satellite.

How to read this: Use the figures as visual examples of physical and wireless communication media.

Confidence: Medium

### Network Topology Diagrams

Description: The PDF includes diagrams for bus, star, ring, mesh, and hybrid topologies. These diagrams visually compare how devices are arranged and connected.

Extracted text: Surrounding text defines each topology and lists selected advantages or disadvantages.

How to read this: Focus on the connection pattern: bus uses one backbone, star uses a central device, ring forms a loop, mesh has multiple interconnections, and hybrid combines more than one topology.

Confidence: Medium

### LAN and WAN Diagrams

Description: The LAN figure shows devices connected within a local environment, while the WAN figure shows broader network connections that link multiple local networks.

Extracted text: Surrounding text identifies LAN examples as school, office, and home, and identifies the Internet as a WAN example.

How to read this: Compare the scale of the diagrams: LAN is local and limited; WAN spans larger geographic areas and can connect LANs.

Confidence: Medium

### Network Model Diagrams

Description: The peer-to-peer figure shows connected devices sharing directly, while the client-server figure shows multiple clients connected to a central server.

Extracted text: Surrounding text describes P2P as decentralized and client-server as centralized.

How to read this: Identify whether resources are shared directly among nodes or requested through a central server.

Confidence: Medium

### Data Transmission Mode Diagrams

Description: The chapter includes diagrams for simplex, half duplex, and full duplex communication.

Extracted text: Surrounding text gives examples: television for simplex, walkie-talkie for half duplex, and telephone for full duplex.

How to read this: Follow the arrow direction: one-way for simplex, alternating two-way for half duplex, and simultaneous two-way for full duplex.

Confidence: Medium

### Transmission Type Diagrams

Description: Serial transmission is shown as bits moving one at a time, while parallel transmission is shown as multiple bits moving at the same time across separate lines.

Extracted text: Surrounding text identifies serial examples as USB and Ethernet and describes parallel transmission as older and limited to shorter distances.

How to read this: Compare one channel carrying sequential bits with multiple channels carrying simultaneous bits.

Confidence: Medium

### Throughput Illustration

Description: A simple graphic accompanies the throughput example, showing data transfer over time.

Extracted text: The text states: 100 MB downloaded in 20 seconds; throughput is 5 MB/s.

How to read this: Divide successfully delivered data by elapsed time to calculate actual transfer rate.

Confidence: Medium

## Potential Reviewer Sections

- Why networking matters in modern society
- Basic network components: end devices, intermediate devices, and media
- Router, switch, hub, access point, and firewall functions
- Wired vs wireless media
- Network topologies: bus, star, ring, mesh, hybrid
- Network types: LAN and WAN
- Network models: peer-to-peer and client-server
- Cisco Packet Tracer lab setup
- Data representation: binary, bits, and bytes
- Guided vs unguided transmission media
- Transmission modes: simplex, half duplex, full duplex
- Transmission types: serial vs parallel
- Bandwidth vs throughput
- Factors affecting throughput

## Potential Quiz Targets

- Define a computer network.
- Identify whether a device is an end device or intermediate device.
- Match router, switch, hub, access point, and firewall to their functions.
- Compare wired and wireless media using advantages and disadvantages.
- Identify topology type from a short description or diagram.
- Explain why star topology is common today.
- Distinguish LAN from WAN and give examples.
- Compare peer-to-peer and client-server models.
- List the Packet Tracer lab components and configuration tasks.
- Define binary, bit, and byte.
- Classify guided and unguided transmission media.
- Match simplex, half duplex, and full duplex to examples.
- Compare serial and parallel transmission.
- Calculate throughput from data delivered and time.
- List factors that affect throughput.

## Potential Flashcards

- What is a computer network?
- What are examples of end devices?
- What are the functions of end devices?
- What does a router do?
- What does a switch use to forward traffic inside a LAN?
- Why is a hub less secure than a switch?
- What does an access point provide?
- What is the purpose of a firewall?
- What are examples of wired network media?
- What are examples of wireless network media?
- What is the main disadvantage of wired media?
- What are two disadvantages of wireless media?
- What is bus topology?
- What happens if the main cable fails in a bus topology?
- What is star topology?
- Why is star topology easy to troubleshoot?
- What is ring topology?
- What is mesh topology?
- What is hybrid topology?
- What is a LAN?
- What is a WAN?
- What is peer-to-peer networking?
- What is client-server networking?
- What is data transmission?
- What is a bit?
- What is a byte?
- What is simplex communication?
- What is half duplex communication?
- What is full duplex communication?
- What is serial transmission?
- What is parallel transmission?
- What is bandwidth?
- What is throughput?
- What is the throughput formula?
- What factors affect throughput?

## Unclear Or Unsupported Items

- The PDF title appears as `CHAPTER 1`: COMMUNICATION IN A CONNECTED WORLD` in extracted text; the backtick appears to be a formatting or extraction artifact.
- The chapter lists "At the end of this module" and then repeats "At the end of this lesson" before the same outcomes. This appears duplicated in the source.
- Some diagrams contain small labels that were visible only in rendered page images, not in extracted text. Their exact wording is not fully preserved here.
- The source lists selected advantages and disadvantages for some topologies but not all of them.
- The Packet Tracer activity gives required devices and tasks but does not include detailed IP addresses, topology instructions, or expected ping results.
