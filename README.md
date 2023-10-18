# Band Oracle: Hello World Examples

---

It gives simple examples of a data source, an oracle script, and a basic Solidity smart contract for the client/consumer side. In this illustrative walkthrough, we'll be requesting a basic "hello world" string from a straightforward API. We'll then use a simple majority method to aggregate this data through an Oracle script. Finally, we'll integrate this aggregated data into a Solidity smart contract on Ethereum's testnet, complemented with a proof of validity from BandChain. While this demonstration doesn't mirror complex real-world applications, it serves as a foundational primer for those keen to explore the possibilities with Band Protocol.

---

## Overview

- **Data Source**: At its core, the data source is the foundational element in Band's oracle system. It's an off-chain component responsible for retrieving specific data. Whether it's from traditional APIs, like our "hello world" example, or other methods, the data source ensures non-deterministic results are handled efficiently without the constraints of on-chain execution.

- **Oracle Script**: This component acts as the on-chain interface to the data fetched by the data sources. Given its deterministic nature and its role in the consensus mechanism, the oracle script functions similarly to a smart contract. It processes the raw data fetched by the data source, ensuring aggregation, validation, and on-chain security.

- **Consumer Smart Contract**: Think of this as the end recipient in our data flow. Smart contracts, for instance on Ethereum, use the processed and validated data provided by Band's oracle for their operations, ensuring trust and reliability in the data they operate upon.

- **Resources for hackathon**: We're thrilled to provide you with a suite of resources tailored for this hackathon. Our aim is to empower you with the tools, documentation, and information needed to craft innovative and functional applications.

---

## Directory Structure

```plaintext
.
├── data_source/
│   ├── README.md
│   └── hello_world_ds.py
├── oracle_script/
│   ├── README.md
│   ├── Cargo.toml
│   └── src/
│       └── lib.rs
└── contracts/
    ├── README.md
    └── HelloWorldBand.sol
```

---

## Recommended Development Steps

Embarking on the journey with Band's Oracle system, it's imperative to follow a methodical approach for seamless integration and operation. Here are the suggested steps tailored for our "hello world" example:

1. **Develop the Data Source**:
    - Start with crafting your data source. In our case, this will be a simple Python script designed to fetch a "hello world" message from a straightforward API.
    - Once developed, deploy this data source to the Bandchain. Post-deployment, you'll be provided with a unique data source ID, which is vital for the subsequent steps.

2. **Develop the Oracle Script**:
    - With the data source in place and its ID at hand, you can begin writing your oracle script. The script will reference the data source ID, ensuring it knows where to fetch the raw data.
    - When a request transaction is made on Bandchain, it triggers the 'prepare' step of the oracle script. Upon completion of this step, validators are informed of the off-chain tasks they need to perform.
    - Validators will execute the data source (off-chain) and subsequently report their respective results back to Bandchain.
    - Once the requisite results are submitted, the oracle script's 'execution' step commences. This step aggregates the results on-chain, culminating in a singular, consolidated output, along with its proof of validity.

3. **Develop the Consumer Smart Contract**:
    - With a functional oracle script and a reliable data source, you're now set to develop the Solidity smart contract.
    - This contract is designed to accept the output from the oracle script along with its proof of validity. It's essential to ensure that the contract verifies this proof meticulously before leveraging the data for further operations. In our scenario, this would mean ensuring the authenticity of the "hello world" message before any on-chain operations dependent on this message.
  

## Resources for hackathon

We've designed this developer environment with excitement, looking forward to seeing your amazing ideas and creative use of these resources in your application development

### 📖 Docs

- Website: [https://www.bandprotocol.com/](https://www.bandprotocol.com/)
- Official documentation: [https://docs.bandchain.org/](https://docs.bandchain.org/)
- Band Bootcamp: [https://bootcamp.bandprotocol.com/](https://bootcamp.bandprotocol.com/)

### ⚒️ Tools

- Band Builder: [https://builder-hackathon.vercel.app/](https://builder-hackathon.vercel.app/)

### 🧪 Laozi Hackathon

- RPC: [https://laozi-hackathon.bandchain.org/api](https://laozi-hackathon.bandchain.org/api)
- gRPC: [https://laozi-hackathon.bandchain.org/grpc-web](https://laozi-hackathon.bandchain.org/grpc-web)
- Faucet: [https://laozi-hackathon.bandchain.org/faucet](https://laozi-hackathon.bandchain.org/faucet)
- Band Explorer: [https://laozi-hackathon.cosmoscan.io/](https://laozi-hackathon.cosmoscan.io/)

### 📝 Example Smart Contracts

#### Goerli

| Name              | Address                                                                                                                                   |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Bridge            | [0x5bd4f7296996EFf0b29Cd6fe1E03375a8A8Ff140](https://goerli.etherscan.io/address/0x5bd4f7296996EFf0b29Cd6fe1E03375a8A8Ff140#readContract) |
| VRF Provider      | [0xcCbdEcaF8f71F3Eb0eCb20f15a3a5B290E166996](https://goerli.etherscan.io/address/0xcCbdEcaF8f71F3Eb0eCb20f15a3a5B290E166996#code)         |
| Mock VRF Consumer | [0xda92ccb3e4d0ca232c40f27ab6f64c8a9704a66c](https://goerli.etherscan.io/address/0xda92ccb3e4d0ca232c40f27ab6f64c8a9704a66c#readContract) |
| TSS Bridge        | [0x1a2ef91a0ca4a76d8d8f44b319ae85739c4e5914](https://goerli.etherscan.io/address/0x1a2ef91a0ca4a76d8d8f44b319ae85739c4e5914#readContract) |
| Price Feed        | [0xe51035f3857795e74379f09f3a672c80fa3480e6](https://goerli.etherscan.io/address/0xe51035f3857795e74379f09f3a672c80fa3480e6#code)         |

#### OP Goerli

| Name              | Address                                                                                                                                             |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Bridge            | [0xeBc665884eE84d43973343C471a4d9E6207141aF](https://goerli-optimism.etherscan.io/address/0xeBc665884eE84d43973343C471a4d9E6207141aF#writeContract) |
| VRF Provider      | [0xcCbdEcaF8f71F3Eb0eCb20f15a3a5B290E166996](https://goerli-optimism.etherscan.io/address/0xcCbdEcaF8f71F3Eb0eCb20f15a3a5B290E166996#writeContract) |
| Mock VRF Consumer | [0x3A009f5B282FD397ab3918DE5D4C05d57fB7D125](https://goerli-optimism.etherscan.io/address/0x3A009f5B282FD397ab3918DE5D4C05d57fB7D125#readContract)  |
| TSS Bridge        | [0xDdF612ac5e09b8F67647E7b8968Ef47EbA5E7937](https://goerli-optimism.etherscan.io/address/0xDdF612ac5e09b8F67647E7b8968Ef47EbA5E7937#code)          |
| Price Feed        | [0xBCa21F154E7Ad301CaFC443d52Af7b580f71D6f3](https://goerli-optimism.etherscan.io/address/0xBCa21F154E7Ad301CaFC443d52Af7b580f71D6f3#code)          |

#### BSC Testnet

| Name              | Address                                                                                                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Bridge            | [0x066DA43688BC308AcAF41F5A219169a9C3548D27](https://testnet.bscscan.com/address/0x066DA43688BC308AcAF41F5A219169a9C3548D27#readContract)  |
| VRF Provider      | [0x3A009f5B282FD397ab3918DE5D4C05d57fB7D125](https://testnet.bscscan.com/address/0x3A009f5B282FD397ab3918DE5D4C05d57fB7D125#writeContract) |
| Mock VRF Consumer | [0xC9CB32A4Df35e5EE877ed1D61556eDF99E9F37c2](https://testnet.bscscan.com/address/0xC9CB32A4Df35e5EE877ed1D61556eDF99E9F37c2#code)          |
| TSS Bridge        | [0xBed5512e88507D290123929137f095A6b0C989c0](https://testnet.bscscan.com/address/0xBed5512e88507D290123929137f095A6b0C989c0#code)          |
| Price Feed        | [0x648533d4A34123Ee0373e44E283544Fcb6e9337D](https://testnet.bscscan.com/address/0x648533d4A34123Ee0373e44E283544Fcb6e9337D#code)          |
