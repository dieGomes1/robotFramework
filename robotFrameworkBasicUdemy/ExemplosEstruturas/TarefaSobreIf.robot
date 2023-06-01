*** Variables ***
@{NUMEROS}    1    2    3    4    5    6    7    8    9    10

*** Test Cases ***
teste para percorrer o FOR
    percorrendo o FOR


*** Keywords ***
percorrendo o FOR
    Log To Console    ${\n} 
    FOR    ${element}    IN    @{NUMEROS}
        IF    ${element} == 5
            Log To Console    numero atual: ${element} -> Eu sou o número 5!
        ELSE IF    ${element} == 10
            Log To Console    numero atual: ${element} -> Eu sou o número 10!
        ELSE
            Log To Console    numero atual: ${element} -> Eu não sou o número 5 e nem o 10!
        END
        
    END