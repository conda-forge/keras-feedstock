#!/bin/bash
if [ "$(uname)" = "Darwin" ]
then
    # for Mac OSX
    export KERAS_BACKEND=tensorflow
elif [ "$(uname)" = "Linux" ]
then
    # for Linux
    export KERAS_BACKEND=theano
fi
