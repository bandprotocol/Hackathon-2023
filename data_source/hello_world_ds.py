#!/usr/bin/env python3
import sys
import requests


URL = "https://raw.githubusercontent.com/bandprotocol/Hackathon-2023/main/text/hello.text"


def main(words):
    return requests.get(URL).text.strip() + " " + " ".join(words)


if __name__ == "__main__":
    try:
        print(main(sys.argv[1:]))
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)
