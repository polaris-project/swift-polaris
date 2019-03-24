/*:
 # Swift-Polaris
 
 ## An Introduction
 
 I love software. I mean, I love computers in general, but software in particular is what really interests me. But, at the moment, I've noticed something fundamentally limiting about how computing works today: centralization.
 This issue was first addressed by Satoshi Nakamoto through the creation of the Bitcoin network--a first-of-its-kind peer-to-peer digital currency. However, the Bitcoin network didn't really solve this issue of computing centralization. Another p2p currency known as Ethereum was created several years later that attempted to solve this issue. Unlike Bitcoin, Ethereum focused on distributed computations, rather than just monetary transfer. Ever since, Ethereum has reigned as the uncontested champion of distributed computing. However, in this peer-to-peer architecture that requires strict all-inclusive consensus, the network has become limited in throughput to some of its weakest nodes.
 
 ## A Proposition
 
 Again, as time went by and these networks grew, both of them were eventually plauged with scalability, privacy, and throughput woes. In response, I propose a solution: Polaris.
 Polaris is a sharded, tangle-based digital currency and computations protocol. Unlike Ethereum and Bitcoin, Polaris can scale infinitely, as its consensus mechanism does not rely on the publishing of a transaction in a block, but rather the random sampling of network peers to publish the transaction. Additionally, as Polaris does not use proof-of-work as its consensus mechanism, transactions on the network do not require fees. As such, the network can be used as both a decentralized applications platform, and a data aggregation platform (e.g. IoT, data storage and hosting).
 
 ### Consensus
 
 Although Polaris doesn't necessarily rely on proof-of-work per say, it still needs a way to reach consensus. How is this accomplished, one might ask? Simply put, the network is randomly sampled for a volunteering peer wishing to "vouch" for a transaction. After "vouching" for a transaction, a peer is then permitted to attach one of their own transactions to the parent transaction. As such, only transactions that have been "witnessed" by another peer can be considered valid.
 
 ## Implementation
 
 So far, I've only implemented Polaris in Go. However, [Go-Polaris](https://github.com/polaris-project/go-polaris) has been written in such a way that different languages like swift can communicate with a node without having to run a real implementation in the language.
 
 ## A Quick Note
 
 This Playground works best with an internet connection, as it needs to connect to the Go-Polaris RPC JSON API. However, if one wishes to operate without an internet connection, simply run the run_polaris.sh (runs a local private offline Polaris network) file in Resources/ (`chmod +x Resources/run_polaris.sh && Resources/run_polaris.sh`). Furthermore, to use an offline connection, set the following variable to true in all pages.
*/

API.Offline = true // Set to true for offline capability

/*:
 ## Getting Started
 
 To create your first account on the Polaris network, see [Hello, World](Hello,%20World).
*/
