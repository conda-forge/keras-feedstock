setlocal EnableDelayedExpansion

"%PYTHON%" setup.py install --single-version-externally-managed --record=record.txt
if errorlevel 1 exit 1

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
FOR %%F IN (activate deactivate) DO (
    IF NOT EXIST %PREFIX%\etc\conda\%%F.d MKDIR %PREFIX%\etc\conda\%%F.d
    COPY %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\keras_%%F.bat
)

IF NOT EXIST %PREFIX%\etc\keras MKDIR %PREFIX%\etc\keras
COPY %RECIPE_DIR%\load_config.py %PREFIX%\etc\keras\load_config.py
