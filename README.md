# Chat-Application

Foi proposto que fizémos uma aplicação de chat no componente curricular de Redes de Computadores. A aplicação deveria ser obrigatoriamente implementada utilizando API de sockets (TCP ou UDP).

# Sumário
1. [Atores](#atores)
2. [Casos de uso](#casosdeuso)
3. [Componentes](#componentes)
4. [Diagramas de sequência](#diagramas)
5. [Protocolo](#protocolo)
6. [Tecnologias](#tecnologias)

## Atores <a name="atores"></a>
<p align="center">
  <img src="assets/to_readme/atores.jpeg">
</p>
<p align="center"><em>Figura 1. Diagrama de casos de uso</em></p>

## Casos de uso <a name="casosdeuso"></a>
A Tabela 1 apresenta os casos de usos de forma priorizada, onde os casos de uso definidos com prioridade alta deverão ser apresentados na versão final do produto desenvolvido diferentemente dos casos de uso com prioridade média e baixa que poderão ou não ser apresentados na entrega final do produto.
<p align="center">
  <img src="assets/to_readme/casodeuso.png">
</p>
<p align="center"><em>Tabela 1. Priorização de casos de uso</em></p>

## Componentes <a name="componentes"></a>
<p align="center">
  <img src="assets/to_readme/componentes.jpeg">
</p>
<p align="center"><em>Figura 2. Diagrama de componentes</em></p>

## Diagramas de sequência <a name="diagramas"></a>
### UC01-Identificação ###
<p align="center">
  <img src="assets/to_readme/Identificação.png">
</p>
<p align="center"><em>Figura 3. Diagrama de sequência do UC01-Identificação</em></p>

### UC02-Iniciar conversa ###
<p align="center">
  <img src="assets/to_readme/IniciarConversa.png">
</p>
<p align="center"><em>Figura 4. Diagrama de sequência do UC02-Iniciar conversa</em></p>

### UC03-Visualizar conversas ###
<p align="center">
  <img src="assets/to_readme/visualizarConversas.png">
</p>
<p align="center"><em>Figura 5. Diagrama de sequência do UC03-Visualizar conversas</em></p>

## Protocolo <a name="protocolo"></a>
<table style="border-collapse:collapse;border-spacing:0;table-layout: fixed; width: 516px" class="tg"><colgroup><col style="width: 97px"><col style="width: 155px"><col style="width: 131px"><col style="width: 133px"></colgroup><thead><tr><th style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:center;vertical-align:top;word-break:normal" colspan="2">ClienteA</th><th style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:center;vertical-align:top;word-break:normal" colspan="2">ClienteB</th></tr></thead><tbody><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">Request</td><td style="border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">Mensagem</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">Response</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">Mensagem</td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">connect()</td><td style="border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">iniciar conexão</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">get()</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">receber mensagem</td></tr><tr><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;font-weight:bold;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">write()</td><td style="border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal">enviar mensagem</td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal"></td><td style="border-color:inherit;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:4px 3px;text-align:left;vertical-align:top;word-break:normal"></td></tr></tbody></table>

## Tecnologias <a name="tecnologias"></a>
Dart será a linguagem de programação que o grupo utilizará para desenvolver o produto proposto. Em conjunto com a linguagem  será utilizado o framework Flutter para que seja possível o desenvolvimento de uma interface Desktop, disponível para o sistema operacional Windows, onde o usuário do sistema terá acesso às funcionalidades. Como protocolo da camada de transporte será utilizado TCP já que o mesmo em comparação com UDP oferece mais confiabilidade na entrega de datagramas, o que é de suma importância para uma aplicação de chat de conversa.
