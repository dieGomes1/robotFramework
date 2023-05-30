*** Settings ***
Library    String

*** Test Cases ***
Cenario 01: Criando e-mail
    ${TESTE}    uma keyword que cria email    diego    gomes
    Log To Console    ${TESTE}

*** Keywords ***
uma keyword que cria email
    [Arguments]    ${NOME}    ${SOBRENOME}
    ${OUTRONOME}    Generate Random String    length=5
    [Return]    ${NOME}${SOBRENOME}${OUTRONOME}@testerobot.com