
# Hello World Oracle Script

Deployed oracle script on the hackathon testnet [O3](https://laozi-hackathon.cosmoscan.io/oracle-script/3#code)

---

## Introduction

The oracle script in Band's Oracle architecture plays a role in acquiring non-deterministic raw data from data sources and then aggregating it deterministically, similar to how a smart contract is executed on the blockchain. Our Oracle Script, named `hello_world_os`, stands as a minimal demonstration of this dynamic, illustrating how data obtained from our `hello_world_ds` data source is aggregated and processed.

## Hello World Schema
```
{word:string}/{result:string}
```

## File Descriptions:

- **Cargo.toml**:
  - A configuration file utilized by Rust's package manager, Cargo. It details package specifics, dependencies, and other necessary metadata.
- **lib.rs**:
  - Contains the main Rust code defining our Oracle Script's logic. This script predominantly involves two functions: `prepare_impl` and `execute_impl`. The former solicits data from our data source, while the latter aggregates it using the majority technique.

## Oracle Script Workflow:

1. **Prepare Phase**: 
   - The `prepare_impl` function is initiated when a request is directed to Bandchain's Oracle.
   - It solicits external data from our data source with ID `6`, passing the input word for processing.
   - Notably, the `external ID 1` used in the `oei::ask_external_data` function serves as a task mapping ID, which will be referenced in the following execution phase.
   
2. **Execute Phase**: 
   - Post the return of raw data from various validators, the `execute_impl` function is engaged.
   - The built-in `load_majority` function aggregates the retrieved strings, calling upon the same `external ID 1` for task identification and data consolidation.
   - A consolidated result is subsequently returned.

## Installation & Compilation:

For the successful compilation of this Oracle Script into a `.wasm` file, adhere to the subsequent steps:

1. **Install Rust 1.69.0**: 
   Please strictly use Rust version 1.69.0 to ensure compatibility.
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs/ | sh
   rustup toolchain install 1.69.0
   rustup default 1.69.0
   ```

2. **Add wasm32 Target**:
   ```bash
   rustup target add wasm32-unknown-unknown
   ```

3. **Compile the WASM File**:
   Navigate to the Oracle Script directory and execute the subsequent command:
   ```bash
   RUSTFLAGS='-C link-arg=-s' cargo build --release --target wasm32-unknown-unknown
   ```

4. **Access the WASM File**:
   Upon the successful build, the produced `.wasm` file will be located at:
   ```bash
   ./target/wasm32-unknown-unknown/release/hello_world_os.wasm
   ```
