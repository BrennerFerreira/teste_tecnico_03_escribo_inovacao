import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_03_escribo_inovacao/modules/home/modules/characters/widgets/loading_list_tile/loading_list_tile.dart';
import 'package:teste_tecnico_03_escribo_inovacao/modules/home/modules/shared/widgets/base_list_tile/base_list_tile.dart';

import '../../../../injection.dart';
import 'controllers/characters_bloc.dart';

/// [CharactersList] is used as the [HomePage] scaffold body when the
/// "Personagens" tab is selected.
class CharactersList extends StatefulWidget {
  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<CharactersBloc>(
      create: (context) => getIt<CharactersBloc>()
        ..add(
          FetchDataCharactersEvent(),
        ),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CharactersBloc, CharactersState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.isLastPage
                    ? state.characters.length
                    : state.characters.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.characters.length) {
                    context.read<CharactersBloc>().add(
                          NewPageRequestCharactersEvent(),
                        );

                    return LoadingListTile();
                  }

                  return BaseListTile(item: state.characters[index]);
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
