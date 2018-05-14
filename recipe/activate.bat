:: Figure out the default Keras backend by reading the config file.
python %CONDA_PREFIX%\etc\keras\load_config.py > temp.txt
set /p KERAS_BACKEND=<temp.txt
del temp.txt

:: Try to use the default Keras backend.
:: Fallback to Theano if it fails (Theano always works).
python -c "import keras" 1> nul 2>&1
if errorlevel 1 (
    ver > nul
    set "KERAS_BACKEND=theano"
    python -c "import keras" 1> nul 2>&1
)
