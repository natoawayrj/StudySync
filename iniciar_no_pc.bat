@echo off
title StudySync - Servidor Local
echo Iniciando o StudySync em http://localhost:8765 ...
start "" http://localhost:8765
python -m http.server 8765
pause
