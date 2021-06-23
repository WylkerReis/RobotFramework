*** Settings ***
Library  SeleniumLibrary
Library  DataDriver     ../Resources/Levantamento.xlsx   
 
 
*** Variables ***
 
${BROWSER}   ff
${URL}       http://gpvm-ti/adm
${USER}      ***
${PASS}      ***
 
 
*** Keywords ***
Abrir navegador
    Open Browser    ${URL}      ${BROWSER}
    Wait Until Element Is Visible         id:j_username  50
    Input Text      id:j_username          ${USER} 
    Input Text      id:j_password          ${PASS}
    Click Element   name:loginButton2     
    Click Element   id:formMenu:j_idt68:0:j_idt70
    Click Element   id:formMenu:j_idt68:0:j_idt72:2:j_idt74
    Click Element   id:formMenu:j_idt68:0:j_idt72:2:j_idt77:0:j_idt79
    Wait Until Element Is Visible      id:formResultado:botaoAdicionar      40
    Click Element   id:formResultado:botaoAdicionar
    Wait Until Element Is Visible      id:formMestreDetalhe:equipamentoId   40
 
Fechar navegador 
    Close Browser
