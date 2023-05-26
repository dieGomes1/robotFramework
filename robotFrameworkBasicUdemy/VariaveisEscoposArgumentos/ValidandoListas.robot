*** Variables ***
@{MESES_DO_ANO}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro

*** Test Cases ***
Cenario 01: imprimindo a Lista
    Log To Console    message=${MESES_DO_ANO[0]}
    Log To Console    message=${MESES_DO_ANO[1]}
    Log To Console    message=${MESES_DO_ANO[2]}
    Log To Console    message=${MESES_DO_ANO[3]}
    Log To Console    message=${MESES_DO_ANO[4]}
    Log To Console    message=${MESES_DO_ANO[5]}
    Log To Console    message=${MESES_DO_ANO[6]}
    Log To Console    message=${MESES_DO_ANO[7]}
    Log To Console    message=${MESES_DO_ANO[8]}
    Log To Console    message=${MESES_DO_ANO[9]}
    Log To Console    message=${MESES_DO_ANO[10]}
    Log To Console    message=${MESES_DO_ANO[11]}
    