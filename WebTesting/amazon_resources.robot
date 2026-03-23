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
   
    


    

    