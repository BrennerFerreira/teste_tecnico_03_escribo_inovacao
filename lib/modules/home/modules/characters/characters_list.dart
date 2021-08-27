import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_03_escribo_inovacao/injection.dart';
import 'package:teste_tecnico_03_escribo_inovacao/modules/home/modules/characters/controllers/characters_bloc.dart';
import 'package:teste_tecnico_03_escribo_inovacao/modules/home/modules/shared/widgets/base_list/base_list.dart';

/// [CharactersList] is used as the [HomePage] scaffold body when the
/// "Personagens" tab is selected.
class CharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
