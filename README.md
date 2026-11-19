# Degustê

Aplicativo de receitas feito em **Flutter**. O Degustê ajuda a descobrir receitas para todos os momentos: o usuário pode explorar uma lista de receitas, buscar pelo nome, ver os detalhes de cada uma e salvar as favoritas.

> 🚧 **Projeto em desenvolvimento.** As telas estão sendo construídas uma a uma a partir do layout. Veja a seção [Status das telas](#status-das-telas) para saber o que já está pronto.

---

## Sumário

- [Funcionalidades](#funcionalidades)
- [Status das telas](#status-das-telas)
- [Tecnologias](#tecnologias)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Navegação](#navegação)
- [Identidade visual](#identidade-visual)
- [Como rodar](#como-rodar)
- [Receitas e API](#receitas-e-api)
- [Testes](#testes)
- [Próximos passos](#próximos-passos)

---

## Funcionalidades

**Já implementado**

- Tela inicial com identidade da marca, campo de busca e botão **Explorar receitas**.
- Busca com validação: o nome da receita precisa ter pelo menos 3 caracteres.
- O botão principal muda sozinho: mostra **Explorar receitas** com o campo vazio e **Pesquisar** quando há texto.
- Botão **X** para limpar o campo de busca.
- Tela de listagem (**Explorar**) com o header da marca.
- Barra de navegação inferior (Início, Buscar, Favoritos).
- Botão **Início** volta para a tela inicial.
- Lupa da tela Explorar leva para a tela inicial com o campo de busca já ativo (teclado aberto).
- Tela **Buscar receitas** com campo de busca, validação (mínimo de 3 caracteres) e botão **Pesquisar**. Ainda não leva aos resultados.
- Tela **Favoritos** no estado vazio: ilustração, mensagem e botão **Explorar receitas**.

**Planejado**

- Lista de receitas com cards (imagem, nome, tempo de preparo, dificuldade e nota).
- Busca de receitas por nome e tela de resultados.
- Detalhes da receita: tempo de preparo e cozimento, porções, ingredientes e modo de preparo.
- Favoritos.
- Estados de carregamento, erro e listas vazias.

---

## Status das telas

O layout do app tem 10 telas:

| # | Tela | Status |
|---|------|--------|
| 1 | Tela Principal (Início) | ✅ Implementada |
| 2 | Listagem de receitas | 🚧 Em andamento (header e navegação prontos, falta a lista de cards) |
| 3 | Buscar receitas | 🚧 Em andamento (campo, botão, fundo e navegação prontos; falta ligar à tela de resultados) |
| 4 | Resultado da pesquisa | ⏳ Pendente |
| 5 | Detalhes da receita | ⏳ Pendente |
| 6 | Meus favoritos | ⏳ Pendente |
| 7 | Nenhum favorito | ✅ Implementada |
| 8 | Nenhum resultado | ⏳ Pendente |
| 9 | Carregando | ⏳ Pendente |
| 10 | Erro ao carregar | ⏳ Pendente |

---

## Tecnologias

- [Flutter](https://flutter.dev/) com Material Design
- [Dart](https://dart.dev/) `^3.13.5`
- [`intl`](https://pub.dev/packages/intl) `^0.20.3`
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) `^1.0.8`
- [`flutter_lints`](https://pub.dev/packages/flutter_lints) `^6.0.0` (análise estática)

**Fontes**

- **Cormorant Garamond**: títulos e logotipo
- **Poppins (Light)**: textos de apoio

**Plataformas configuradas:** Android e Web.

---

## Estrutura do projeto

O código fica em `lib/` e é organizado **por tela**. Dentro de cada tela, cada parte visual (header, busca, footer) tem a sua própria pasta e o seu próprio arquivo.

```text
lib/
├── main.dart                     # Ponto de entrada do app
├── app.dart                      # MaterialApp (título, tema e tela inicial)
├── home/
│   ├── home_page.dart            # Tela inicial (monta header + busca + footer)
│   ├── header/
│   │   └── home_header.dart      # Logotipo, folhas e slogan
│   ├── search/
│   │   └── home_search.dart      # Campo de busca e botão Explorar/Pesquisar
│   └── footer/
│       └── home_footer.dart      # Barra de navegação inferior
├── explore/
│   ├── explore_page.dart         # Tela de listagem de receitas
│   └── header/
│       └── explore_header.dart   # Header da listagem (título, subtítulo e lupa)
├── search/
│   ├── search_page.dart          # Tela Buscar receitas
│   ├── header/
│   │   └── search_header.dart    # Seta de voltar, título e subtítulo
│   └── form/
│       └── search_form.dart      # Campo de busca e botão Pesquisar
└── favorites/
    ├── favorites_page.dart       # Tela de favoritos
    ├── header/
    │   └── favorites_header.dart # Logotipo "Degustê"
    └── empty/
        └── favorites_empty.dart  # Estado "nenhum favorito" (ilustração, texto e botão)

assets/
├── fonts/                        # CormorantGaramond, Poppins
└── image/                        # Fundos (home e busca), folhas e ilustração do pote
```

Novas telas seguem o mesmo padrão: uma pasta com `<tela>_page.dart` e uma subpasta para cada parte da tela.

---

## Navegação

A navegação usa `Navigator.push` e `Navigator.pushAndRemoveUntil` (sem rotas nomeadas por enquanto).

| Origem | Ação | Destino |
|--------|------|---------|
| Início | **Explorar receitas** (campo vazio) | Explorar |
| Explorar | **Lupa** do header | Início, com o campo de busca ativo |
| Qualquer tela | **Início** na barra inferior | Início |
| Qualquer tela | **Buscar** na barra inferior | Buscar receitas |
| Buscar receitas | **Seta** de voltar | Tela anterior |
| Qualquer tela | **Favoritos** na barra inferior | Favoritos |
| Favoritos (vazio) | **Explorar receitas** | Explorar |

---

## Identidade visual

| Uso | Cor |
|-----|-----|
| Títulos e logotipo (vinho) | `#650C1B` |
| Botões e ícone selecionado (terracota) | `#B55235` |
| Indicador da barra inferior | `#FFE2D6` |
| Fundo da listagem (creme) | `#FBF5EA` |
| Subtítulo (cinza) | `#5F5A58` |

---

## Como rodar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) com Dart `^3.13.5`
- Um dispositivo, emulador Android ou o Chrome

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

## Receitas e API

As receitas **serão carregadas por uma API**, então o projeto não guarda dados de receitas fixos no código. A API ainda não foi integrada. Quando for, os dados entram na tela de listagem (Explorar), na busca e nos detalhes.

Hoje, ao pesquisar um nome na tela inicial, o app só exibe uma mensagem na tela (SnackBar) como espaço reservado para a busca real.

---

## Testes

O projeto ainda não tem testes automatizados. O arquivo `test/widget_test.dart` é só o esqueleto padrão do Flutter.

```bash
flutter test
```

---

## Próximos passos

- [ ] Criar o card de receita e a lista da tela Explorar
- [ ] Definir e integrar a API de receitas
- [ ] Tela de resultados da busca (ligada ao botão **Pesquisar**)
- [ ] Tela de detalhes da receita
- [ ] Favoritos (salvar e listar)
- [ ] Estados de carregamento, erro e vazio
- [ ] Tela Meus favoritos (lista das receitas salvas) e o botão de favoritar
- [ ] Escrever testes de widget
