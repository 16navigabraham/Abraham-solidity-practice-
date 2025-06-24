<<<<<<< HEAD
Abraham Solidity Practice

This repository contains my personal practice projects and smart contract exercises as I learn and build with Solidity and Foundry. It includes basic contract examples, testing, and deployment setups.

🛠 Tech Stack

- Solidity
- Foundry
- Ubuntu WSL
- VS Code

📂 Structure

- pratice.sol – Practice contract file
- simplestorage.sol – Simple storage contract example
- test/ – Test scripts for smart contracts
- script/ – Deployment scripts
- foundry.toml – Foundry configuration file

🚀 Goals

- Strengthen my smart contract development skills  
- Build a solid foundation in Web3 backend  
- Prepare for real-world dApp development  

📬 Contact

Feel free to connect or reach out:  
X (Twitter): [@AbrahamNAVIG](https://x.com/AbrahamNAVIG1)
=======
## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
>>>>>>> 0c3052346e39830ba95226c238dbc43cfff77d4f
