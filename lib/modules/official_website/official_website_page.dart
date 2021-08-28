import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_colors.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app/router/route_names.dart';
import '../../shared/widgets/app_bar_title/app_bar_title.dart';

/// [OfficialWebistePage] is a page that contains a webview of the Star Wars
/// community website.
class OfficialWebsitePage extends StatefulWidget {
  @override
  _OfficialWebsitePageState createState() => _OfficialWebsitePageState();
}

class _OfficialWebsitePageState extends State<OfficialWebsitePage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    const websiteUrl = 'https://www.starwars.com/community';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppConstants.smallAppBarHeight,
        automaticallyImplyLeading: false,
        title: AppBarTitle(
          websiteButtonBackgroundColor: AppColors.backgroundColor,
          avatarButtonBackgroundColor: AppColors.accentColor.withOpacity(0.5),
          onWebsiteButtonPressed: () {
            Navigator.of(context).popUntil(
              (route) => route.settings.name == RouteNames.homeRoute,
            );
          },
          onAvatarButtonPressed: () {
            Navigator.of(context).pushReplacementNamed(RouteNames.avatarRoute);
          },
        ),
      ),
      body: Column(
        children: [
          if (_isLoading) const LinearProgressIndicator(),
          Expanded(
            child: WebView(
              initialUrl: websiteUrl,
              onPageStarted: (_) {
                setState(() {
                  _isLoading = true;
                });
              },
              onPageFinished: (_) {
                setState(() {
                  _isLoading = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
