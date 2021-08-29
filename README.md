# Favoritos Star Wars

Este aplicativo foi desenvolvido como parte do processo seletivo para a vaga de
desenvolvedor mobile Flutter da Escribo Inovação para o Aprendizado.

Este aplicativo permite a listagem de filmes e personagens de Star Wars. Os
dados utilizados são da [Swapi](https://swapi.dev).

## Para rodar o aplicativo

Para rodar o app, basta seguir as seguintes instruções:

- Faça um clone deste repositório.
- Rode o comando `flutter packages get` na pasta onde o app foi clonado.
- Tenha um dispositivo físico ou um emulador preparado.
- Rode o comando `flutter run lib/main.dart`.

Há também um [arquivo APK](./release) disponível para instalação
da versão final do app diretamente em um aparelho.

## Funcionalidades

O app deveria contemplar as seguintes funcionalidades:

- Um menu onde seja possível ao usuário editar seu avatar.

  - O aplicativo deveria guardar as configurações de avatar selecionadas pelo
  usuário e reexibir sempre que a tela de avatar for acessada ou quando o
  aplicativo for reiniciado.

- Exibir duas listas: uma com os filmes e outra com os personagens de Star Wars.

- Cada item da lista deve ter um botão que adiciona o item para a lista de
favoritos.

- Deve ser possível exibir a lista de favoritos do usuário, com destaques em
verde para personagens favoritos e em vermelho para filmes favoritos.

- Deve ter um botão que exibe uma webview onde o usuário pode acessar
[este site](https://www.starwars.com/community) dentro do aplicativo.

- Quando se está na página de edição de avatar ou na página de visualização do
website, apertar novamente os botões de avatar ou de website faz com que o
aplicativo volte à exibição das listas de filmes, personagens e favoritos.

- O avatar deve ser construido usando a biblioteca
[fluttermoji](https://pub.dev/packages/fluttermoji)

- A webview deve ser construída com a biblioteca
[WebView for Flutter](https://pub.dev/packages/webview_flutter)

- Os estado do avatar e a lista de favoritos devem ser persistidas usando a
biblioteca [SQFLite](https://pub.dev/packages/sqflite).

## Arquitetura

O aplicativo foi desenvolvido seguindo a arquitetura modular, onde cada módulo
tem seus próprios *controllers*, *services* e *widgets*. As funcionalidades que
são compartilhadas por mais de um módulo estão localizadas na pasta
[shared](./lib/shared).

Além disso, a comunicação entre os *controllers* e os serviços externos são
mediadas por interfaces, fazendo com que os serviços possam ser facilmente
substituídos sem alterar o funcionamento das outras partes.

### Módulos

Os módulos principais são:

- [App](./lib/app): Lida com a estrutura básica do app, criação do tema e das
rotas do aplicativo.

- [Avatar](./lib/modules/avatar): Lida com tudo o que é relacionado ao avatar
do usuário, incluído sua alteração e visualização. Como os *controllers* e
*services* deste módulo são utilizados por outros módulos, eles estão
localizados na pasta [shared](./lib/shared/avatar).

- [Home](./lib/modules/home): Este módulo, por ser o mais complexo, possui seus
próprios submódulos. Este módulo lida com a tela inicial, incluindo as três
abas de visualização: Filmes, Personagens e Favoritos.

  - [Favorites](./lib/modules/home/modules/favorites): Lida com o que é
  relacionado à adição, remoção e visualização dos itens marcados como favoritos
  pelo usuário. Seus *controllers* e *services* estão localizados na pasta
  [shared](./lib/shared/favorites), pois são também utilizados por outros módulos.

  - [Characters](./lib/modules/home/modules/characters): Lida com a visualização
  dos personagens recebidos pela API. A UI da lista de personagens é um
  **StatefulWidget** para poder manter seu estado ativo ao mudar de aba ou
  página, diminuindo, assim, as requisições feitas para a API.

  - [Movies](./lib/modules/home/modules/movies): Lida com a visualização dos
  filmes recebidos pela API. Assim como acontece nos personagens, a lista de
  filmes renderizada é um **StatefulWidget** para manter seu estado ativo.

- [OfficialWebsite](./lib/modules/official_website): Lida com a visualização do
site da comunidade de Star Wars, utilizando uma webview. Por se tratar de um
módulo muito específico, foi optado por ter um **StatefulWidget**, gerenciando
seu estado por meio do método `setState`, sem a necessidade de criação de um
*controller* específico para isso.

- [Splash](./lib/modules/splash): Renderiza a *splash page* do aplicativo. Sua
função é esperar o módulo *favorites* buscar os dados salvos no aparelho e
redirecionar para a página *home*.

- [Database](./lib/shared/database): Lida com a criação e conexão com o banco
de dados local. Novamente, uma interface é utilizada para a comunicação com
o pacote externo *SQFLite*, abstraindo os métodos que são utilizados pelo
aplicativo.

- [StarWarsItem](./lib/shared/star_wars_item): Este módulo possui três modelos:

  - [StarWarsItem](./lib/shared/star_wars_item/models/star_wars_item.dart):
  é a classe base para *Movie* e *Character*, abstraindo atributos e métodos
  comuns às duas classes.

  - [Movie](./lib/shared/star_wars_item/models/movie.dart): é a classe que
  modela os filmes que são utilizados no app.

  - [Character](./lib/shared/star_wars_item/models/character.dart): é a classe
  que modela os personagens que são utilizados no app.

## Gerência de Estado

Por uma questão de manter uma padrão arquitetural mais rígido, foi optado por
utilizar o pacote [Bloc](https://pub.dev/packages/bloc), junto com o pacote
[Flutter Bloc](https://pub.dev/packages/flutter_bloc) para a genrência de estado
do aplicativo.

Cada ação do usuário que pode gerar uma alteração no estado do app gera um
evento que é adicionado ao *Bloc* correspondente. O *Bloc*, então, processa
o evento e emite um novo estado correpondente ao processamento do evento
recebido.

Os *Blocs* são os responsáveis por se comunicar com os serviços externos, caso
seja necessário. Para isso, se utilizam de interfaces, que abstraem os métodos
necessários de cada serviço, isolando, assim, os pacotes externos do restante
do aplicativo.

## Injeção de dependências

Para facilitar a manutenção das dependências entre os arquivos à medida que o
aplicativo cresce, foi utilizado o pacote
[Injectable](https://pub.dev/packages/injectable), para injeção de dependências.

## Desafios

O principal desafio encarado foi como integrar os filmes e personagens obtidos
da API com os valores salvos como favoritos no aparelho do usuário.

Para resolver, uma instância do
[FavoritesBloc](./lib/shared/favorites/controllers/favorites_bloc.dart) é
injetada no [MoviesBloc](./lib/modules/home/modules/movies/controllers/movies_bloc.dart)
e no [CharactersBloc](./lib/modules/home/modules/characters/controllers/characters_bloc.dart).
Quando as listas de filmes e personagens são obtidas da API pela primeira vez,
o valor de cada item é comparado com os valores da lista no *FavoritesBloc*.
Caso seja encontrada uma correspondência, o atributo `isFavorite` do item é
alterado para `true`.

Após essa primeira verificação, cada `Bloc` gerencia internamente se o item
foi adicionado ou removido da lista de favoritos.

Esta solução ainda pode ser otimizada no futuro.

## Considerações finais

O aplicativo foi desenvolvido no prazo de três dias, procurando seguir as
melhores práticas de código.

Sobre as possíveis melhorias necessárias, cito a criação de testes automatizados
e otimizações da performance geral do aplicativo.
