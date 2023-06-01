*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***

Criar sessão na ServeRest
    ${headers}    Create Dictionary    
    ...    accept=application/json
    ...    Content-Type=application/json
    
    Create Session    alias=ServeRest    url=https://serverest.dev

Criar um usuário novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@teste.com.br
    Log To Console    ${EMAIL_TESTE}

Cadastrar o usuário criado na ServeRest
    ${body}    Create Dictionary    
    ...    nome=Fulano da Silva      
    ...    email=${EMAIL_TESTE}    
    ...    password=1234    
    ...    administrador=true
    Log    ${body}
    
    Criar sessão na ServeRest

    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}

    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        
Validar se usuário foi cadastrado corretamente
      Log    ${RESPOSTA}
      Dictionary Should Contain Item    dictionary=${RESPOSTA}    key=message    value=Cadastro realizado com sucesso
      Dictionary Should Contain Key    dictionary=${RESPOSTA}    key=_id

      
