# Pizzaria

## Integrantes
- Bianca Leticia Neckel  
- Nicole de Araujo Novoli  

Turma: 4° Semestre ADS e ESW

---

## 1. Descrição do Aplicativo

O aplicativo **Pizzaria** é uma aplicação mobile desenvolvida em Flutter que tem como objetivo gerenciar um cardápio digital de forma simples e eficiente.

A aplicação permite a visualização, cadastro, edição e exclusão de itens do cardápio, contendo informações como nome, preço e descrição. O sistema se comunica com uma API REST para persistência dos dados, garantindo que as informações estejam sempre atualizadas.

O projeto foi desenvolvido com foco na aplicação prática de conceitos como:
- Desenvolvimento mobile com Flutter
- Consumo de APIs REST
- Gerenciamento de estado com Provider
- Organização em camadas

---

## 2. API Utilizada

- Nome: API de Cardápio  
- URL: https://cardapio-production-3462.up.railway.app/cardapio  

A API é responsável por fornecer os dados do cardápio e realizar as seguintes operações:
- Listar itens
- Adicionar novos itens
- Atualizar itens existentes
- Remover itens

---

## 3. Tecnologias Utilizadas

- Flutter
- Dart
- Dio (requisições HTTP)
- HTTP (biblioteca auxiliar)
- Provider (gerenciamento de estado)

---

## 4. Estrutura do Projeto

O projeto está organizado seguindo uma arquitetura simples em camadas:

- **models**  
  Responsável pela definição das entidades do sistema (Item do cardápio)

- **services**  
  Camada responsável pela comunicação com a API

- **providers**  
  Gerenciamento de estado e controle da lógica da aplicação

- **screens**  
  Interfaces do usuário (telas)

---

## 5. Funcionalidades

- Listagem de itens do cardápio  
- Cadastro de novos itens  
- Edição de itens existentes  
- Exclusão de itens  
- Atualização automática da lista após operações  

---

## 6. Fluxo do Sistema

O funcionamento da aplicação segue o fluxo abaixo:

1. Ao iniciar o aplicativo, os dados são carregados da API
2. Os itens são exibidos na tela principal (Home)
3. O usuário pode:
   - Adicionar um novo item
   - Editar um item existente
   - Excluir um item
4. Após qualquer operação, a lista é atualizada automaticamente

---

## 8. Instruções para Execução

Para executar o projeto, siga os passos abaixo:

```bash
flutter pub get
flutter run
```

---

## 9. Considerações Finais

O desenvolvimento deste projeto permitiu a aplicação prática de conceitos fundamentais de desenvolvimento mobile, como consumo de APIs REST, gerenciamento de estado e organização em camadas.

Além disso, contribuiu para o aprimoramento das habilidades em Flutter e na construção de aplicações estruturadas e funcionais.

O projeto pode ser expandido futuramente com novas funcionalidades, como autenticação de usuários, categorização de produtos e melhorias na interface.
