# 💸 Aplicativo de Finanças 

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev) 
[![Dart](https://img.shields.io/badge/Dart-3.x-blue.svg)](https://dart.dev) 
[![Supabase](https://img.shields.io/badge/Backend-Supabase-green.svg)](https://supabase.com) 
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE) 

Um aplicativo moderno de finanças pessoais construído com **Flutter + Supabase**, focado em **segurança, escalabilidade e arquitetura limpa**. 

--- 

## 🚀 Visão Geral 

O aplicativo de finanças ajuda os usuários a: 

- Acompanhar receitas e despesas 
- Categorizar transações automaticamente 
- Analisar o comportamento financeiro 
- Gerar relatórios (diários, mensais e anuais) 
- Sincronizar contas via Open Finance (futuro) 

--- 

## 🧠 Arquitetura 

Este projeto segue uma arquitetura híbrida **com foco em funcionalidades e design limpo**:


lib/
core/ → infraestrutura compartilhada (configuração, tema, segurança)
shared/ → componentes de interface do usuário reutilizáveis
​​features/ → módulos isolados (autenticação, transações, relatórios...)


Cada funcionalidade é dividida em: 

- `apresentação` → UI + estado 
- `domínio` → regras de negócio 
- `dados` → API / acesso ao banco de dados 

--- 

## 🔐 Princípios de Segurança 

A segurança é uma **preocupação primordial**: 

- ❌ Nunca confie no cliente 
- ✅ Autorização gerenciada via banco de dados (RLS) 
- ✅ Lógica sensível executada somente no backend 
- ✅ Tokens armazenados com segurança 
- ❌ Sem segredos no código-fonte 
- ✅ `.env` é ignorado pelo git 

--- 

## ⚙️ Tecnologias Utilizadas 

### Mobile 
- Flutter 
- Dart 
- Riverpod (gerenciamento de estado) 
- GoRouter (navegação) 

### Backend 
- Supabase (Autenticação + Postgres + Funções de Borda) 
- PostgreSQL (fonte da verdade) 
- Segurança em Nível de Linha (RLS) 

--- 

## 📦 Estrutura do Projeto


aplicativo_financeiro/
lib/
ativos/
supabase/
docs/


--- 

## 🧑‍💻 Primeiros Passos 

### 1. Instale as dependências 

```bash 
flutter pub get
2. Configurar ambiente

Criar um .env.devarquivo:

SUPABASE_URL=seu_projeto_url 
SUPABASE_ANON_KEY=sua_chave_anônima 
APP_ENV=dev 
APP_NAME=Aplicativo Financeiro
3. Execute o aplicativo
flutter run \ --dart-define = SUPABASE_URL = ... \ --dart-define = SUPABASE_ANON_KEY = ... \ --dart-define = APP_ENV = dev \ --dart-define = APP_NAME = "Aplicativo Financeiro"
  
  
  
  
🗄️ Banco de dados

O esquema do banco de dados é versionado em:

subase/migrações/

Inclui:

perfis
contas
transações
categorias
relatórios
Políticas RLS
funções de banco de dados
🧪 Testando
teste de vibração
🎨 Sistema de Design

Sistema de interface de usuário centralizado:

núcleo/tema/tokens/

Inclui:

cores
tipografia
espaçamento
raio
movimento

Suporta:

Modo claro
Modo escuro

📈 Roteiro
 Fundação do projeto
 Autenticação
 Contas
 Transações
 Categorias
 Relatórios
 Percepções
 Integração de Finanças Abertas
 Versão web


# 🚀 Milestone 01 — Accounts Module (Core Functional)

## 🎯 Objetivo
Implementar o módulo de contas financeiras totalmente funcional, conectado ao backend (Supabase), seguindo Clean Architecture.

---

## 🧱 Estrutura implementada

### Data Layer
- Remote datasource conectado ao Supabase
- Local datasource preparado para cache futuro
- DTOs para transporte de dados
- Mappers para conversão DTO → Entity
- Repository implementation

### Domain Layer
- Entity: FinancialAccount
- Repository (contrato)
- UseCases:
  - CreateAccountUseCase
  - GetAccountsUseCase
  - SyncAccountsUseCase (placeholder)

### Presentation Layer
- AccountsController (StateNotifier)
- AccountsState (estrutura base)
- Providers (injeção de dependência com Riverpod)

### UI
- AccountsPage
- AccountDetailsPage
- Widgets:
  - AccountCard
  - AccountBalanceTile
  - AccountSyncStatus

---

## 🔐 Backend Integration

- Integração com Supabase
- Uso de `auth.uid()` via RLS
- Dados isolados por usuário
- Persistência real no banco

---

## ⚙️ Funcionalidades implementadas

- Criar conta financeira
- Listar contas do usuário
- Atualização automática após criação
- Estado gerenciado via Riverpod

---

## 🧠 Arquitetura aplicada

Fluxo completo:

UI → Controller → UseCase → Repository → DataSource → Supabase

Separação clara de responsabilidades:
- UI não contém regra de negócio
- Domain independente de frameworks
- Data isolada da UI

---

## 📊 Resultado

- Módulo 100% funcional
- Backend conectado
- Estrutura escalável
- Base pronta para:
  - Transactions
  - Reports
  - Open Finance

---

## 🚀 Próximo passo

Milestone 02:
- Integração do módulo Accounts no Dashboard
- Exibição de saldo total
- UX real (lista + criação + feedback visual)