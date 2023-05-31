*** Variables ***
${STATUS}    1


*** Test Cases ***
Cenario 01
    IF    ${STATUS} > 0
        logando no console se for maior
    ELSE
        logando no console se for menor
    END


*** Keywords ***

logando no console se for maior
    Log To Console    variavel maior que zero

logando no console se for menor
    Log To Console    variavel menor ou igual a zero

    


