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


# 🚀 Milestone 02 — Dashboard Functional (Integrated with Backend)

## 🎯 Objetivo

Implementar o dashboard funcional consumindo dados reais do backend (Supabase), exibindo informações consolidadas do usuário.

---

## 🧱 Estrutura implementada

### Data Layer

* DashboardRemoteDatasource (integração com Supabase)
* DTOs para resumo do dashboard
* Mapper para conversão DTO → Entity
* Repository implementation

### Domain Layer

* Entity: DashboardSummary
* Repository (contrato)
* UseCase:

  * GetDashboardSummaryUseCase

### Presentation Layer

* DashboardController (StateNotifier)
* DashboardState (gerenciamento de estado)
* Providers (injeção de dependência com Riverpod)

### UI

* DashboardPage
* Widgets:

  * DashboardHeader
  * DashboardSummarySection
  * CashflowHighlight
  * RecentTransactionsPreview

---

## 🔐 Backend Integration

* Integração com Supabase
* Consumo da tabela `accounts`
* Cálculo de saldo total
* Preparado para integração com `transactions`

---

## ⚙️ Funcionalidades implementadas

* Carregar dados do dashboard
* Exibir saldo total do usuário
* Exibir quantidade de contas
* Estrutura de cashflow preparada
* Preview de transações (placeholder)

---

## 🧠 Arquitetura aplicada

Fluxo completo:

UI → Controller → UseCase → Repository → DataSource → Supabase

Separação clara:

* UI desacoplada do backend
* Domain independente
* Data isolada

---

## 📊 Resultado

* Dashboard funcional ✔️
* Dados reais exibidos ✔️
* Arquitetura escalável ✔️
* Base pronta para evolução ✔️

---

## 🚀 Próximo passo


# 🚀 Milestone 03 — Logo System + Adaptive Branding (Dark/Light)

## 🎯 Objetivo

Implementar sistema de logo adaptativo (dark/light) dentro do app e padronizar uso de assets visuais.

---

## ✅ O que foi feito

### 🖼️ 1. Padronização de logos

* Definido uso de duas versões:

  * `logo_dark.png` → para tema escuro
  * `logo_light.png` → para tema claro

📁 Local:

```
assets/images/
```

---

### 🧩 2. Criação de widget reutilizável de logo

📁 Novo arquivo:

```
lib/shared/widgets/logo/app_logo.dart
```

### Implementação:

```dart
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Image.asset(
      isDark
          ? 'assets/images/logo_dark.png'
          : 'assets/images/logo_light.png',
      width: size,
    );
  }
}
```

---

### 🔁 3. Integração nas telas principais

* Splash
* Auth (login/signup)
* Dashboard (header)

Uso:

```dart
AppLogo(size: 120)
```

---

### ⚙️ 4. Atualização do pubspec.yaml

* Ícone do app configurado com versão `logo_light.png`
* Splash configurado com `logo_dark.png`
* Assets organizados corretamente

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  remove_alpha_ios: true
  image_path: "assets/images/logo_light.png"

flutter_native_splash:
  color: "#000000"
  image: assets/images/logo_dark.png
  android_12:
    image: assets/images/logo_dark.png
    color: "#000000"
```

---

## 🧠 Decisões de arquitetura

* Separação entre:

  * Logo de UI (adaptativa)
  * Logo de sistema (ícone fixo)
* Centralização via widget reutilizável (`AppLogo`)
* Compatibilidade total com Dark/Light mode

---

## ⚠️ Observações

* Ícone do app NÃO reage a tema (comportamento do sistema)
* Logo adaptativa resolve contraste dentro do app
* Assets devem manter proporção e padding consistentes

---

## 📦 Comandos utilizados

```bash
flutter clean
flutter pub get
dart run flutter_launcher_icons
dart run flutter_native_splash:create
flutter run
```

---

## ✅ Resultado

* UI consistente em dark/light mode
* Branding mais profissional
* Base pronta para evolução de design system

---

## 🔜 Próximo passo sugerido (Milestone 04)

* Implementar módulo de transações (Transactions)
* Integrar entradas e saídas reais no dashboard
* Atualizar cashflow dinamicamente

---

# 🚀 Milestone 04 — Transactions Module (CRUD + Listagem)

## 🎯 Objetivo
Implementar o módulo completo de transações com integração real ao Supabase, permitindo criação, listagem e estrutura preparada para evolução futura (categorias, filtros, analytics).

---

## 🧱 Arquitetura implementada

### 📦 Data Layer
- Remote DataSource integrado ao Supabase (`transactions` table)
- DTO para parsing de dados
- Mapper DTO → Entity
- Repository Implementation

### 🧠 Domain Layer
- Entity: `TransactionEntity`
- Repository contract desacoplado
- UseCases:
  - `GetTransactionsUseCase`
  - `GetTransactionDetailsUseCase`
  - `CreateManualTransactionUseCase`
  - `UpdateTransactionCategoryUseCase`
  - `SyncTransactionsUseCase` (placeholder)

### 🎨 Presentation Layer
- Controller (StateNotifier + Riverpod)
- State com loading + error handling
- Pages:
  - TransactionsPage (listagem)
  - CreateTransactionPage (criação)
  - TransactionDetailsPage (base)
- Widgets:
  - TransactionList
  - TransactionRowItem
  - TransactionFilterBar
  - TransactionDateGroup

### 🔌 Providers
- Injeção completa com Riverpod
- SupabaseClient centralizado
- Controller conectado aos UseCases

---

## 🔐 Segurança
- Todas as queries filtradas por `auth.uid()`
- Compatível com RLS já configurado
- Nenhum dado exposto entre usuários

---

## ✅ Funcionalidades entregues
- Criar transação manual
- Listar transações do usuário
- Separação por tipo (entrada/saída)
- Atualização automática da lista após criação
- UI básica funcional

---

## 📊 Estado atual do app
- Dashboard funcional
- Accounts estruturado
- Transactions funcional (CRUD base)

---

## ⚠️ Próximos passos recomendados (Milestone 05)
- Integração Transactions → Dashboard (valores reais)
- Filtros por data/categoria
- Seleção real de conta (dropdown)
- Categorias reais conectadas
- UI premium (cards, gráficos)

---

## 🧠 Decisão técnica
Arquitetura Clean + Feature-first mantida:
- Alta escalabilidade
- Fácil manutenção
- Pronto pra produção SaaS

---

## 📌 Commit sugerido
feat(transactions): implement full transactions module with supabase integration