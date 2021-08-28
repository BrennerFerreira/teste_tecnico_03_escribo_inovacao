import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../../shared/star_wars_item/models/character.dart';
import '../shared/widgets/base_list/base_list.dart';
import '../shared/widgets/base_list_tile/base_list_tile.dart';
import 'controllers/characters_bloc.dart';
import 'widgets/loading_list_tile/loading_list_tile.dart';

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
              return BaseList(
                isLoading: state.isLoading,
                list: state.characters,
                listView: ListView.builder(
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

                    return BaseListTile(
                      item: state.characters[index],
                      invertFavoriteFunction: (item) {
                        context.read<CharactersBloc>().add(
                              InvertFavoriteCharactersEvent(item as Character),
                            );
                      },
                    );
                  },
                ),
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
