import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../app/theme/app_assets.dart';

/// [LoadingWidget] this is the widget to show when there's a loading state in
/// the app.
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        child: const RiveAnimation.asset(AppAssets.loadingAnimation),
      ),
    );
  }
}
