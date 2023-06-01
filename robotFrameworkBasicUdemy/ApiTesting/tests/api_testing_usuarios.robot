*** Settings ***
Resource    ../resources/api_testing_usuarios_resource.robot

*** Variables ***


*** Test Cases ***
cenario 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest
    Validar se usuário foi cadastrado corretamente
