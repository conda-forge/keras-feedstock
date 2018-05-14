set "KERAS_BACKEND=tensorflow"
python -c "import tensorflow" 1> nul 2>&1
if errorlevel 1 (
    ver > nul
    set "KERAS_BACKEND=theano"
)
