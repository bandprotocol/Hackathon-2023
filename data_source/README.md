
# Hello World Data Source

Deployed data source on the hackathon testnet [D6](https://laozi-hackathon.cosmoscan.io/data-source/6#code)

---

## Introduction
In the vast ecosystem of Band's Oracle system, a data source acts as the basic foundational unit. It's an off-chain component responsible for fetching raw, unprocessed data which can later be used and aggregated on-chain by an oracle script. In our journey to illustrate the simplicity and efficiency of Band's Oracle system using the "hello world" theme, this particular data source fetches a static message and appends a word passed to it.

## File Description
- **hello_world_ds.py**:
  - A Python3 script that uses the `requests` library to fetch a static "hello world" message from a simple API endpoint.
  - This script accepts a word as an argument, appends it to the fetched message, and then returns the combined string.
  - In case of any errors or exceptions, the script handles them gracefully, ensuring the oracle system isn't abruptly interrupted.

## How to Use
1. Make sure you have Python3 and the `requests` library installed.
2. To test it locally, the data source can be executed in a terminal or command prompt as follows:
```bash
python3 hello_world_ds.py [WORD]
```
Replace `[WORD]` with any word of your choice. The script will then fetch the "hello world" message, append your word, and then display the result.
