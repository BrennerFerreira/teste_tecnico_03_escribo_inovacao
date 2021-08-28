import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app/router/route_names.dart';
import '../home/widgets/app_bar_title/app_bar_title.dart';

/// [OficialWebistePage] is a page that contains a webview of the Star Wars
/// community website.
class OficialWebsitePage extends StatefulWidget {
  @override
  _OficialWebsitePageState createState() => _OficialWebsitePageState();
}

class _OficialWebsitePageState extends State<OficialWebsitePage> {
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
    const appBarHeight = 120.0;
    const websiteUrl = 'https://www.starwars.com/community';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        automaticallyImplyLeading: false,
        title: AppBarTitle(
          onWebsiteButtonPressed: () {
            Navigator.of(context).popUntil(
              (route) => route.settings.name == RouteNames.homeRoute,
            );
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
