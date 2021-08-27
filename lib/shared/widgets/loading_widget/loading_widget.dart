import 'package:flutter/material.dart';

/// [LoadingWidget] this is the widget to show when there's a loading state in
/// the app.
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
