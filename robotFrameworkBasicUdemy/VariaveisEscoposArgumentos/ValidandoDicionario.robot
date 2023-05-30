*** Variables ***
&{MESES_DO_ANO}    janeiro=31
...                fevereiro=28
...                março=31
...                abril=30
...                maio=31
...                junho=30
...                julho=31
...                agosto=31
...                setembro=30
...                outubro=31
...                novembro=30
...                dezembro=31

*** Test Cases ***
Cenario: imprimindo os meses do ano
    Log To Console    message=O mês janeiro possui: ${MESES_DO_ANO.janeiro} dias
    Log To Console    message=O mês fevereiro possui: ${MESES_DO_ANO.fevereiro} dias
    Log To Console    message=O mês março possui: ${MESES_DO_ANO.março} dias
    Log To Console    message=O mês abril possui: ${MESES_DO_ANO.abril} dias
    Log To Console    message=O mês maio possui: ${MESES_DO_ANO.maio} dias
    Log To Console    message=O mês junho possui: ${MESES_DO_ANO.junho} dias
    Log To Console    message=O mês julho possui: ${MESES_DO_ANO.julho} dias
    Log To Console    message=O mês agosto possui: ${MESES_DO_ANO.agosto} dias
    Log To Console    message=O mês setembro possui: ${MESES_DO_ANO.setembro} dias
    Log To Console    message=O mês outubro possui: ${MESES_DO_ANO.outubro} dias
    Log To Console    message=O mês novembro possui: ${MESES_DO_ANO.novembro} dias
    Log To Console    message=O mês dezembro possui: ${MESES_DO_ANO.dezembro} dias