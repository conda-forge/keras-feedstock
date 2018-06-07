#!/bin/bash

# Figure out the default Keras backend by reading the config file.
KERAS_BACKEND="$(python ${CONDA_PREFIX}/etc/keras/load_config.py)"

# Try to use the default Keras backend.
# Fallback to Theano if it fails (Theano always works).
python -c "import keras" &>/dev/null || {
    test "true";
    export KERAS_BACKEND="theano"
    python -c "import keras" &>/dev/null
}
