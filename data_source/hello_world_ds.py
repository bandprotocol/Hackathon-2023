#!/usr/bin/env python3
import sys
import requests


def main(word):
    return requests.get("https://raw.githubusercontent.com/bandprotocol/Hackathon-2023/main/text/hello.text").text.strip() + " " + word


if __name__ == "__main__":
    try:
        print(main(*sys.argv[1:]))
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)
