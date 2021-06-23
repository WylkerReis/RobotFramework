*** Settings ***
Resource        ../Resources/Resources.robot
 
Suite Setup      Abrir navegador
Suite Teardown   Fechar navegador 
 
Test Template    E informo campos obrigatórios
 
*** Test Cases ***
 
Dado que estou na tela CE01 (Cadastro equipamento: ${equipamento})
   E informo campos obrigatórios
 
 
*** Keywords ***
E informo campos obrigatórios
   [Arguments]     ${equipamento}   ${tipo}   ${proprietario}   ${observacao}   ${local}   ${apelido}    ${familia}   ${classe}   ${data}   ${manutencao}   ${tempo}   ${producao}   ${ativo}      ${microparada}
   Sleep       10     
   #Run Keyword And Continue On Failure       Click Element       id:formResultado:botaoAdicionar
   ${STATUS}=    Run Keyword And Return Status      Page Should Contain Button         id:formMestreDetalhe:salvarButton    
   IF      '${STATUS}' == False
      Click Element   id:formResultado:botaoAdicionar
   ELSE IF     '${STATUS}' 
      Wait Until Element Is Enabled        xpath: //*[@id="formMestreDetalhe:tipoId"]/div[3]    10
      Input Text             id:formMestreDetalhe:equipamentoId  ${equipamento}
      Click Element          xpath: //*[@id="formMestreDetalhe:tipoId"]/div[3]
      IF      '${tipo}' == 'Fixo' 
         Wait Until Element Is Visible      xpath: //*[@id="formMestreDetalhe:tipoId_panel"]/div[2]/ul/li[2]     40
         Click Element          xpath: //*[@id="formMestreDetalhe:tipoId_panel"]/div[2]/ul/li[2]   
      ELSE IF    '${tipo}' == 'Móvel'
         Click Element          xpath: //*[@id="formMestreDetalhe:tipoId_panel"]/div[2]/ul/li[3]
      END
      Wait Until Element Is Not Visible   xpath: //*[@id="modal-loading"]  40
      #IF      '${proprietario}' == 'Vale' 
      #   Wait Until Element Is Enabled        xpath: //*[@id="formMestreDetalhe:proprietarioId_panel"]/div[2]/ul/li[3]  40
      #   Click Element          xpath: //*[@id="formMestreDetalhe:proprietarioId_panel"]/div[2]/ul/li[3]
      #ELSE IF    '${proprietario}' == 'Terceiro'
      #   Click Element          xpath: //*[@id="formMestreDetalhe:proprietarioId_panel"]/div[2]/ul/li[2]
      #END
      Wait Until Element Is Enabled        id:formMestreDetalhe:observacaoId    10
      Input Text             id:formMestreDetalhe:observacaoId      ${observacao}
      Input Text             id:formMestreDetalhe:arvoreLocalId_input      ${local}
      Sleep      5 
      ${local_status}=    Run Keyword And Return Status      Element Should Be Visible         id:formMestreDetalhe:arvoreLocalId_input    
      IF      '${local_status}' == True
      Press Keys             id:formMestreDetalhe:arvoreLocalId_input       RETURN
      ELSE IF     '${local_status}'
      Input Text             id:formMestreDetalhe:arvoreLocalId_input      ${local}
      Sleep      5 
      Press Keys             id:formMestreDetalhe:arvoreLocalId_input       RETURN
      END     
      Wait Until Element Is Not Visible   xpath: //*[@id="modal-loading"]  40
      Wait Until Element Is Enabled        xpath: //*[@id="formMestreDetalhe:tipoId"]/div[3]    10 
      Input Text             id:formMestreDetalhe:apelidoId     ${apelido}
      Sleep      10
      Click Element       xpath: //*[@id="formMestreDetalhe:familiaId"]/div[3]
         IF      '${familia}' == 'Agitadores' 
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[2]
         ELSE IF      '${familia}' == 'Alimentadores' 
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[3]
         ELSE IF   '${familia}' == 'Aquecedores'  
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[6]  
         ELSE IF   '${familia}' == 'Bombas'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[9]
         ELSE IF   '${familia}' == 'Carros de Transporte'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[16]
         ELSE IF   '${familia}' == 'Classificadores'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[20]
         ELSE IF   '${familia}' == 'Caixas/Tanques/Reservatórios'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[12]
         ELSE IF   '${familia}' == 'Válvulas'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[69]
         ELSE IF   '${familia}' == 'Ejetores'  
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[27]
         ELSE IF   '${familia}' == 'Forno Panela' 
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[37]
         ELSE IF   '${familia}' == 'Panela de metal' 
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[72]
         ELSE IF   '${familia}' == 'Peneiras'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[51]
         ELSE IF   '${familia}' == 'Balanças'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[8]
         ELSE IF   '${familia}' == 'Ponte Rolante'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[53]
         ELSE IF   '${familia}' == 'Raspadores'  
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[54]
         ELSE IF   '${familia}' == 'Rompedores Fixos'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[57]
         ELSE IF   '${familia}' == 'Secadores Rotativos'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[60]
         ELSE IF   '${familia}' == 'Moegas/Silos'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[48]
         ELSE IF   '${familia}' == 'Amostradores'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[4]
         ELSE IF   '${familia}' == 'Filtros'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[35]
         ELSE IF   '${familia}' == 'Resfriadores'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[56]
         ELSE IF   '${familia}' == 'Transportadores'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[65]
         ELSE IF   '${familia}' == 'Unidades hidráulicas'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[68]
         ELSE IF   '${familia}' == 'Válvulas de metal líquido' 
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[70]
         ELSE IF   '${familia}' == 'Válvulas'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[69]
         ELSE IF   '${familia}' == 'Perfuratriz'
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[52]
         ELSE IF   '${familia}' == 'Forno Panela'  
            Click Element          xpath: //*[@id="formMestreDetalhe:familiaId_panel"]/div[2]/ul/li[50]
      END
      Wait Until Element Is Not Visible   xpath: //*[@id="modal-loading"]  40
      Click Element      //*[@id="formMestreDetalhe:classeId"]/div[3]
         IF      '${classe}' == 'Alimentador vibratório' 
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[10]
         ELSE IF   '${classe}' == 'Aquecedor a combustão'  
            Click Element         xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Bomba radial centrífuga'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[24]
         ELSE IF   '${classe}' == 'Carro de Transporte de Contêiner'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Classificador'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Tanque'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[7]
         ELSE IF   '${classe}' == 'Válvula de fluxo'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[3]
         ELSE IF   '${classe}' == 'Ejetor' 
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Forno Panela' 
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Válvula Comporta'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Panela refratada'  
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Peneira vibratória horizontal'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[9]
         ELSE IF   '${classe}' == 'Balança estática'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[5]
         ELSE IF   '${classe}' == 'Ponte Rolante Ciclo Intermitente'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[3]
         ELSE IF   '${classe}' == 'Aquecedor a combustão'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Raspador de escória'  
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Rompedor Fixo'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[3]
         ELSE IF   '${classe}' == 'Secador Rotativo'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Tanque separador de água e óleo'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[17]
         ELSE IF   '${classe}' == 'Silo'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[6]
         ELSE IF   '${classe}' == 'Amostrador'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Filtro plano'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[6]
         ELSE IF   '${classe}' == 'Tanque de água'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[8]
         ELSE IF   '${classe}' == 'Tanque de reagente'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[15]
         ELSE IF   '${classe}' == 'Resfriador de Colmeia'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Transportador fixo de correia'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Unidade hidráulica'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Válvula de gaveta'  
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Válvula rotativa'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[5]
         ELSE IF   '${classe}' == 'Ventiladores'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[72]
         ELSE IF   '${classe}' == 'Perfuratriz Canhão'
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
         ELSE IF   '${classe}' == 'Forno Panela'  
            Click Element          xpath: //*[@id="formMestreDetalhe:classeId_panel"]/div[2]/ul/li[2]
      END
      Wait Until Element Is Not Visible   xpath: //*[@id="modal-loading"]  40
      Sleep      5
      Input Text          id:formMestreDetalhe:dataCriacaoId_input      '${data}'
      LOG      '${data}'
      Press Keys             id:formMestreDetalhe:dataCriacaoId_input       RETURN
      IF   '${manutencao}' == 'Sim'
         Click Button      id:formMestreDetalhe:criaNotaManutencaoId:0
      END
      IF   '${tempo}' == 'Sim'
         Click Button      id:formMestreDetalhe:controleApontamentoTempoId:0
      END
      IF   '${producao}' == 'Sim'
         Click Button      id:formMestreDetalhe:controlaProducaoId:0
      END
      IF   '${ativo}' == 'Não'
         Click Button      id:formMestreDetalhe:ativoId:1
      END
      #${microparada}
      ${status_micro}=     Run Keyword And Return Status      Page Should Contain Element         id:formMestreDetalhe:tempoMicroparadaId
      IF    ${status_micro} == True
         Input Text   id:formMestreDetalhe:tempoMicroparadaId      ${microparada}   
      ELSE 
         No Operation
      END
      #Clicar em Salvar
      Click Button      id:formMestreDetalhe:salvarButton
      Sleep       30
      Capture Page Screenshot 
      ${STATUS}=    Run Keyword And Return Status      Page Should Contain Button         id:formMestreDetalhe:salvarButton    
      IF      '${STATUS}' == True
         Click Element   id:formResultado:botaoAdicionar    
      ELSE IF     '${STATUS}' 
         Click Element      id:formMestreDetalhe:cancelarButton
         Sleep      30 
         Click Element   id:formResultado:botaoAdicionar
      END
   END
 