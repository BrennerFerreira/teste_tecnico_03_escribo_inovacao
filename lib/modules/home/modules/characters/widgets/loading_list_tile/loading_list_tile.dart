import 'package:flutter/material.dart';

import '../../../shared/widgets/tile_container/tile_container.dart';

/// [LoadingListTile] is a placeholder widget to request a new page of
/// characters to the API.
class LoadingListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TileContainer(
      child: ListTile(
        title: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
