# Degustê

Aplicativo de receitas feito em **Flutter**. O Degustê ajuda a descobrir receitas para todos os momentos: o usuário pode explorar uma lista de receitas, buscar pelo nome, ver os detalhes de cada uma e salvar as favoritas.

> 🚧 **Projeto em desenvolvimento.** As 10 telas do layout já têm código. Ainda falta conferir o visual rodando no aparelho e adicionar duas ilustrações (veja [Próximos passos](#próximos-passos)).

---

## Sumário

- [Funcionalidades](#funcionalidades)
- [Status das telas](#status-das-telas)
- [Tecnologias](#tecnologias)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Navegação](#navegação)
- [Receitas e API](#receitas-e-api)
- [Ilustrações](#ilustrações)
- [Identidade visual](#identidade-visual)
- [Como rodar](#como-rodar)
- [Testes](#testes)
- [Próximos passos](#próximos-passos)

---

## Funcionalidades

- **Tela inicial** com a marca, campo de busca e botão **Explorar receitas**.
- **Explorar:** lista de receitas vinda da API, carregada aos poucos (10 por vez) conforme você rola.
- **Buscar:** busca pelo nome da receita, com validação de no mínimo 3 caracteres, a partir da tela inicial ou da aba **Buscar**.
- **Resultados** da busca, com a contagem de receitas e o link **Limpar pesquisa**.
- **Detalhes da receita:** foto, nota, tipo de culinária, tempo de preparo e cozimento, porções, ingredientes e modo de preparo passo a passo.
- **Favoritos:** o coração salva a receita no aparelho, e ela continua lá quando você fecha e abre o app.
- **Estados da tela:** carregando (cards cinza), erro ao carregar (com **Tentar novamente**), nenhum resultado e nenhum favorito.
- **Barra de navegação** inferior (Início, Buscar, Favoritos).

---

## Status das telas

O layout do app tem 10 telas, e todas já estão implementadas:

| # | Tela | Onde está |
|---|------|-----------|
| 1 | Tela Principal (Início) | `lib/home/` |
| 2 | Listagem de receitas | `lib/explore/` |
| 3 | Buscar receitas | `lib/search/` |
| 4 | Resultado da pesquisa | `lib/results/` |
| 5 | Detalhes da receita | `lib/details/` |
| 6 | Meus favoritos | `lib/favorites/` |
| 7 | Nenhum favorito | `lib/favorites/` (estado vazio) |
| 8 | Nenhum resultado | `lib/results/` (estado vazio) |
| 9 | Carregando | `lib/recipes/states/recipes_loading.dart` |
| 10 | Erro ao carregar | `lib/recipes/states/state_message.dart` |

As telas 8 e 10 usam ilustrações que ainda não estão no projeto. Enquanto isso, aparece um ícone no lugar (veja [Ilustrações](#ilustrações)).

---

## Tecnologias

- [Flutter](https://flutter.dev/) com Material Design
- [Dart](https://dart.dev/) `^3.13.5`
- [`http`](https://pub.dev/packages/http) `^1.6.0`: chamadas à API de receitas
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) `^2.5.6`: guarda os favoritos no aparelho
- [`intl`](https://pub.dev/packages/intl) `^0.20.3`
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) `^1.0.8`
- [`flutter_lints`](https://pub.dev/packages/flutter_lints) `^6.0.0` (análise estática)

**Fontes**

- **Cormorant Garamond**: títulos e logotipo
- **Poppins (Light)**: textos de apoio

**Plataformas configuradas:** Android e Web.

---

## Estrutura do projeto

O código fica em `lib/` e é organizado **por tela**. Dentro de cada tela, cada parte visual (header, busca, lista...) tem a sua própria pasta e o seu próprio arquivo. O que é usado por mais de uma tela fica em `recipes/`.

```text
lib/
├── main.dart                         # Ponto de entrada (lê os favoritos salvos)
├── app.dart                          # MaterialApp (título e tela inicial)
├── home/
│   ├── home_page.dart                # Tela inicial
│   ├── header/home_header.dart       # Logotipo, folhas e slogan
│   ├── search/home_search.dart       # Campo de busca e botão Explorar/Pesquisar
│   └── footer/home_footer.dart       # Barra de navegação inferior (usada em várias telas)
├── explore/
│   ├── explore_page.dart             # Lista de receitas com carregamento aos poucos
│   └── header/explore_header.dart    # Título, subtítulo e lupa
├── search/
│   ├── search_page.dart              # Tela Buscar receitas
│   ├── header/search_header.dart     # Seta de voltar, título e subtítulo
│   └── form/search_form.dart         # Campo de busca e botão Pesquisar
├── results/
│   ├── results_page.dart             # Resultados, carregando, erro e nenhum resultado
│   └── header/results_header.dart    # "Resultados para...", contagem e Limpar pesquisa
├── details/
│   ├── details_page.dart             # Detalhes da receita
│   ├── header/details_header.dart    # Foto, botão de voltar e coração
│   ├── info/details_info.dart        # Título, nota, culinária, tempos e porções
│   ├── ingredients/details_ingredients.dart
│   └── steps/details_steps.dart      # Modo de preparo numerado
├── favorites/
│   ├── favorites_page.dart           # Lista de favoritos ou estado vazio
│   ├── favorites_store.dart          # Guarda e salva as receitas favoritas
│   ├── header/favorites_header.dart  # Logotipo e subtítulo
│   └── empty/favorites_empty.dart    # "Você ainda não tem receitas favoritas"
└── recipes/                          # Compartilhado entre as telas
    ├── recipe.dart                   # Modelo da receita
    ├── recipe_service.dart           # Chamadas à API (lista e busca)
    ├── recipe_card.dart              # Card da receita
    ├── recipe_list.dart              # Lista de cards (abre os detalhes ao tocar)
    ├── recipe_image.dart             # Foto da receita (cinza enquanto carrega)
    └── states/
        ├── state_message.dart        # Ilustração + texto + botão (vazio e erro)
        └── recipes_loading.dart      # Cards cinza do "carregando"

assets/
├── fonts/                            # CormorantGaramond, Poppins
└── image/                            # Fundos, folhas e ilustrações
```

Novas telas seguem o mesmo padrão: uma pasta com `<tela>_page.dart` e uma subpasta para cada parte da tela.

---

## Navegação

A navegação usa `Navigator.push` e `Navigator.pushAndRemoveUntil` (sem rotas nomeadas por enquanto).

| Origem | Ação | Destino |
|--------|------|---------|
| Início | **Explorar receitas** (campo vazio) | Explorar |
| Início | **Pesquisar** (com texto no campo) | Resultados |
| Buscar | **Pesquisar** | Resultados |
| Resultados | **Limpar pesquisa** | Tela anterior, com o campo de busca limpo |
| Explorar, Resultados ou Favoritos | Tocar em uma receita | Detalhes |
| Explorar | **Lupa** do header | Início, com o campo de busca ativo |
| Qualquer tela | **Início** na barra inferior | Início |
| Qualquer tela | **Buscar** na barra inferior | Buscar |
| Qualquer tela | **Favoritos** na barra inferior | Favoritos |
| Favoritos (vazio) | **Explorar receitas** | Explorar |
| Buscar, Resultados e Detalhes | **Seta** de voltar | Tela anterior |

---

## Receitas e API

As receitas vêm da API pública [DummyJSON](https://dummyjson.com/docs/recipes) (50 receitas). O app **precisa de internet**, e a permissão já está configurada no Android.

| Para quê | Chamada |
|----------|---------|
| Lista (Explorar) | `GET /recipes?limit=10&skip=N` |
| Busca | `GET /recipes/search?q=termo&limit=50` |

- O endereço da API fica em um só lugar: `RecipeService.baseUrl`, em `lib/recipes/recipe_service.dart`. Para usar outra API, é lá (e no modelo `recipe.dart`) que se mexe.
- Na tela Explorar, ao chegar perto do fim da lista, o app pede as próximas 10 receitas.
- A dificuldade ("Easy" vira "Fácil") e o tipo de culinária ("Italian" vira "Italiana") são traduzidos pelo app. Os **nomes das receitas, ingredientes e modo de preparo** vêm da API em inglês, e não são traduzidos.
- Os **favoritos** são salvos no aparelho (`shared_preferences`), com os dados completos da receita, e continuam lá quando o app é reaberto.

---

## Ilustrações

Algumas telas usam ilustrações em `assets/image/`:

| Arquivo | Onde aparece | Situação |
|---------|--------------|----------|
| `homebackground.png` | Fundo da tela inicial | ✅ No projeto |
| `leaves.png` | Folhas do logotipo | ✅ No projeto |
| `tomatos.png` | Fundo da tela Buscar | ✅ No projeto |
| `pote.png` | Nenhum favorito (pote com coração) | ✅ No projeto |
| `panela.png` | Erro ao carregar (panela com "!") | ⏳ Falta adicionar |
| `lupa.png` | Nenhum resultado (lupa) | ⏳ Falta adicionar |

Se `panela.png` ou `lupa.png` não existirem, a tela mostra um ícone no lugar, sem dar erro. Ao colocar o arquivo com esse nome na pasta, a ilustração aparece sozinha.

---

## Identidade visual

| Uso | Cor |
|-----|-----|
| Títulos e logotipo (vinho) | `#650C1B` |
| Botões, passos e ícone selecionado (terracota) | `#B55235` |
| Indicador da barra inferior | `#FFE2D6` |
| Fundo das telas (creme) | `#FBF5EA` |
| Subtítulos (cinza) | `#5F5A58` |
| Estrela da nota | `#F5A623` |
| Coração favoritado | `#D62839` |

---

## Como rodar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) com Dart `^3.13.5`
- Um dispositivo, emulador Android ou o Chrome
- Conexão com a internet

Confira se o ambiente está certo com:

```bash
flutter doctor
```

### Passo a passo

Clone o repositório e entre na pasta:

```bash
git clone <url-do-repositorio>
cd projetodeguste
```

Instale as dependências:

```bash
flutter pub get
```

Rode o app no Chrome:

```bash
flutter run -d chrome
```

Ou em um emulador/dispositivo Android conectado:

```bash
flutter run
```

### iOS

O projeto ainda **não tem a pasta `ios/`**. Para rodar no simulador do iPhone, adicione a plataforma:

```bash
flutter create --platforms=ios .
```

### Análise do código

```bash
flutter analyze
```

---

## Testes

O projeto ainda não tem testes automatizados. O arquivo `test/widget_test.dart` é só o esqueleto padrão do Flutter.

O `RecipeService` aceita um cliente HTTP, e as telas Explorar e Resultados aceitam um serviço opcional. Isso foi pensado para testar com respostas falsas, sem depender da internet.

```bash
flutter test
```

---

## Próximos passos

- [ ] Adicionar as ilustrações `panela.png` (erro) e `lupa.png` (nenhum resultado) em `assets/image/`
- [ ] Rodar o app e comparar cada tela com o layout, ajustando espaçamentos e tamanhos
- [ ] Escrever testes de widget para as telas
- [ ] Traduzir ingredientes e modo de preparo (hoje vêm em inglês da API)
- [ ] Adicionar a plataforma iOS
