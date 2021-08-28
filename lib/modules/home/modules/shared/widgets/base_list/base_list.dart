import 'package:flutter/material.dart';

import '../../../../../../shared/star_wars_item/model/star_wars_item.dart';
import '../../../../../../shared/widgets/error_widget/error_widget.dart';
import '../../../../../../shared/widgets/loading_widget/loading_widget.dart';
import '../base_list_tile/base_list_tile.dart';

/// [BaseList] generates a list to be displayed on each tab of [HomePage].
class BaseList extends StatelessWidget {
  /// Whether the app is processing a request to the API.
  final bool isLoading;

  /// The list to be displayed on the UI.
  final List<StarWarsItem> list;

  /// Used if there is need for a custom render of a list view.
  final ListView? listView;

  /// Default constructor for this class.
  const BaseList({
    Key? key,
    required this.isLoading,
    required this.list,
    this.listView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingWidget();
    } else if (list.isEmpty) {
      return ErrorTextWidget();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: listView ??
          ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return BaseListTile(item: list[index]);
            },
          ),
    );
  }
}
