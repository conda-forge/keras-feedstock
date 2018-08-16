#!/bin/bash

$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/keras_${CHANGE}.sh"
done

mkdir -p "${PREFIX}/etc/keras"
cp "${RECIPE_DIR}/load_config.py" "${PREFIX}/etc/keras/load_config.py"
