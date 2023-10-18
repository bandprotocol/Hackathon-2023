#!/usr/bin/env python3
import sys
import requests


def main(word):
    return requests.get("https://run.mocky.io/v3/c0354a03-3c3f-437f-9737-0bb8a1a8e5b0").text + " " + word


if __name__ == "__main__":
    try:
        print(main(*sys.argv[1:]))
    except Exception as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)
