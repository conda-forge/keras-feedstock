#!/usr/bin/env python

import json
import os


# Match Keras' default if nothing is specified.
backend = "tensorflow"

# Load the backend from keras.json if it exists and is specified.
fn = os.path.join(os.path.expanduser("~"), ".keras", "keras.json")
if os.path.exists(fn):
    with open(fn, "r") as fh:
        backend = json.load(fh).get("backend", backend)

print(backend)
