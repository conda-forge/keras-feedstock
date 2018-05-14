#!/bin/bash

export KERAS_BACKEND="tensorflow"
python -c "import tensorflow" &>/dev/null || {
    test "true";
    export KERAS_BACKEND="theano"
}
