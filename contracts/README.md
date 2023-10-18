# HelloWorldBand Smart Contract

Deployed contract on Goerli 
[0x23136691b3bf396469c2cdd19d8d432e14c6afd2](https://goerli.etherscan.io/address/0x23136691b3bf396469c2cdd19d8d432e14c6afd2#code)

---

## Introduction

The `HelloWorldBand` smart contract serves as a simplified example illustrating how Ethereum-based contracts can integrate with Band's Oracle system to retrieve and utilize data. It is constructed to leverage Band's already deployed bridge contract, `IFutureBridge`, to effortlessly verify proofs originating from Bandchain.

## File Descriptions:

- **HelloWorldBand.sol**:
  - Contains the main Solidity code that embodies our smart contract logic.
  - The contract is designed to interact with the Band's Oracle system, specifically to update and store a simple text string retrieved from Bandchain.

## Contract Workflow:

1. **IFutureBridge Interface**: 
   - Provides a skeletal structure for interacting with the already deployed bridge contract by the Band protocol team. Notably, the `verify` function facilitates the validation of the Bandchain's data proofs on Ethereum.
   
2. **Setting Text**: 
   - The `setText` function in the `HelloWorldBand` contract serves to update the stored `text` variable.
   - It achieves this by first verifying the Bandchain proof using the `verify` function from the bridge contract. Once this is validated, the contract decodes the resultant data and updates the `text` variable accordingly.
   - Careful checks ensure that only valid and correctly formed data from the expected Oracle Script ID is processed.

## Interaction Guidelines:

- **Prerequisites**: 
   - Before the interaction, it's assumed that the Band's bridge contract (`IFutureBridge`) is already deployed and accessible.

- **Instantiation**:
   - On deploying `HelloWorldBand`, the bridge's address needs to be provided, establishing the crucial link between our contract and the Band's bridge contract.

- **Updating Text**:
   - The `setText` function facilitates the primary interaction, allowing users to input data (along with its Bandchain proof). If the proof and data checks pass, the `text` state variable in the contract is updated.
