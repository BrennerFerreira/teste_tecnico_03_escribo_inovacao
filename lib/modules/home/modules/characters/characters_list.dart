import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../shared/widgets/base_list/base_list.dart';
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
              return BaseList(
                isLoading: state.isLoading,
                list: state.characters,
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
