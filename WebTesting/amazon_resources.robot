*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}                   chrome  # para rodar em outro browser: robot -v BRWOSER:firefox + test suite. 
${URL}                       https://www.amazon.com.br/
${MENU_ELETRONICOS}          (//a[contains(text(),'Eletrônicos')])[1]
${HEADER_ELETRONICOS}        (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]
${GLOBAL_SEARCH}             (//input[@id='twotabsearchtextbox'])[1]
${SEARCH}                    //input[@id='nav-search-submit-button']



*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador  
    Capture Page Screenshot  
    Close Browser


Acessar a home page do site Amazon.com.br 
    Go To                           url=${URL}
    Wait Until Element Is Visible   locator=${MENU_ELETRONICOS}


Entrar no menu "Eletrônicos"
    Click Element                   locator=${MENU_ELETRONICOS}


- Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains        text=${FRASE}
    Wait Until Element Is Visible   locator=${HEADER_ELETRONICOS}
    


- Verificar se o título da página fica "${TITULO}"
    Title Should Be                  title=${TITULO}


- Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible        locator=//span[@class='a-size-base-plus'][normalize-space()='${NOME_CATEGORIA}']
    

Digitar o nome de produto "${PRODUCT}" no campo de pesquisa
    Input Text      locator=${GLOBAL_SEARCH}    text=${PRODUCT}

 Clicar no botão de pesquisa
    Click Element                  locator=${SEARCH} 

 Verificar o resultado da pesquisa, se está listando o produto "${PRODUCT}"
    Wait Until Element Is Visible     locator=(//span[contains(text(),'${PRODUCT}')])[1]


# GHERKIN STEPS:

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br 
    - Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    - Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    - Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    - Verificar se aparece a categoria "TV e Cinema"


Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
     Clicar no botão de pesquisa

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto "Xbox Series S"
    
    
    

   
    


    

    