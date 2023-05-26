*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_TODOS}    //span[@class='hm-icon-label'][contains(.,'Todos')]
${SUBMENU_VER_TODOS}    (//div[contains(.,'ver tudo')])[4]
${SUBMENU_ELETRONICOS_TV_AUDIO}    (//div[contains(.,'Eletrônicos, TV e Áudio')])[4]
${SUBMENU_TUDO_EM_ELETRONICOS}    //a[contains(.,'Tudo em Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${CATEGORIA_COMPUTADORES_E_INFORMATICA}    //span[@dir='auto'][contains(.,'Computadores e Informática')]
${CAMPO_PESQUISA}    twotabsearchtextbox
${BOTAO_PESQUISA}    nav-search-submit-button


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Set Selenium Speed    value=3 seconds
Fechar o navegador
    Capture Page Screenshot
    Close Browser

# Caso de teste 01: Acesso ao menu "Eletrônicos"
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${CAMPO_PESQUISA} 

Entrar no menu "Eletrônicos, TV e Áudio" e submenu "Tudo em Eletrônicos"
    Click Element    locator=${MENU_TODOS}
    Wait Until Element Is Visible    locator=${SUBMENU_VER_TODOS}
    # Set Selenium Speed    value=1 seconds
    Click Element    locator=${SUBMENU_VER_TODOS}
    Wait Until Element Is Visible    locator=${SUBMENU_ELETRONICOS_TV_AUDIO}
    Click Element    locator=${SUBMENU_ELETRONICOS_TV_AUDIO}
    Wait Until Element Is Visible    locator=${SUBMENU_TUDO_EM_ELETRONICOS}
    Click Element    locator=${SUBMENU_TUDO_EM_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    # Set Selenium Speed    value=1 seconds
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${CATEGORIA}')]


# Caso de teste 02: Pesquisa de um Produto
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_PESQUISA}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=${BOTAO_PESQUISA}

Verificar o resultado da pesquisa, se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]
    Wait Until Element Is Visible    locator=//span[@class='a-color-state a-text-bold'][contains(.,'${PRODUTO}')]
    Element Text Should Be    locator=//span[@class='a-color-state a-text-bold'][contains(.,'${PRODUTO}')]    expected="${PRODUTO}"


# Caso de Teste 03 - Adicionar Produto no Carrinho
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
    # Set Selenium Speed    value=5 seconds
    Click Element    locator=(//span[contains(@class,'a-price-whole')])[1]
    Wait Until Element Is Visible    locator=add-to-cart-button
    Click Element    locator=add-to-cart-button

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Contains    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]    text=Adicionado ao carrinho

# Caso de Teste 04 - Remover Produto do Carrinho

Remover o produto "${PRODUTO}" do carrinho
    Click Element    locator=//input[contains(@title,'Excluir')]
    Wait Until Element Is Visible    locator=//div[@class='a-section ewc-item-remove-msg']

Verificar se o carrinho fica vazio
    Click Element    locator=nav-cart-count
    Wait Until Element Contains    locator=//h2[contains(.,'Seu carrinho da Amazon está vazio')]    text=Seu carrinho da Amazon está vazio

# Cenarios via BDD
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Capture Page Screenshot

Quando acessar o menu "${FRASE}"
    Entrar no menu "Eletrônicos, TV e Áudio" e submenu "Tudo em Eletrônicos"
    Verificar se aparece a frase "${FRASE}"

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"
    
E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"
    
E a categoria "${CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${CATEGORIA}"

# Caso de Teste 02 - Pesquisa de um Produto

Quando pesquisar pelo produto "${PRODUTO}"
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    
E um produto da linha "${PRODUTO}" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"

# Caso de Teste 03 - Adicionar Produto no Carrinho

Quando adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, se está listando o produto "${PRODUTO}"
    Adicionar o produto "${PRODUTO}" no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
       
Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

# Caso de Teste 04 - Remover Produto do Carrinho

E existe o produto "${PRODUTO}" no carrinho
    Quando adicionar o produto "${PRODUTO}" no carrinho

Quando remover o produto "${PRODUTO}" do carrinho
    Remover o produto "${PRODUTO}" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
