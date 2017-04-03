#!/bin/bash

# get the location of the keras.json file
KERAS_JSON="$HOME/.keras/keras.json"

if [ -f $KERAS_JSON ]; then # if the file exists

  BACKEND_KEY="backend" # value we are interested in finding
  KEY_VALUE_REGEX="\"($BACKEND_KEY)\": \"([^\"]*)\"" # regex
  JSON_TEXT=$(cat $KERAS_JSON) # data in keras.json file

  if [[ $JSON_TEXT =~ $KEY_VALUE_REGEX ]]; then # check for a match
    BACKEND_VALUE="${BASH_REMATCH[2]}" # get the user defined backend value
    export KERAS_BACKEND=$BACKEND_VALUE # set the environmental variable
  fi
else
  if [ "$(uname)" == "Darwin" ]
  then
      # for Mac OSX
      export KERAS_BACKEND=tensorflow
  elif [ "$(uname)" == "Linux" ]
  then
      # for Linux
      export KERAS_BACKEND=theano
  fi
fi
