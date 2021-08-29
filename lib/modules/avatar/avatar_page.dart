import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermoji/fluttermoji.dart';

import '../../app/router/route_names.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/avatar/controllers/avatar_bloc.dart';
import '../../shared/constants/constants.dart';
import '../../shared/widgets/app_bar_title/app_bar_title.dart';

/// [AvatarPage] is the page where the user can view and change their avatar.
/// The only reason to be a [StatefulWidget] is because there's a need to use
/// the [mounted] property to make sure the [BuildContext] is available to
/// call the [_saveAvatar] method.
class AvatarPage extends StatefulWidget {
  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  Future<void> _saveAvatar() async {
    final newConfig = await FluttermojiFunctions().encodeMySVGtoString();
    if (mounted) {
      context.read<AvatarBloc>().add(SaveAvatarEvent(newConfig));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _saveAvatar();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: AppConstants.smallAppBarHeight,
          backgroundColor: AppColors.backgroundColor,
          title: AppBarTitle(
            websiteButtonBackgroundColor:
                AppColors.accentColor.withOpacity(0.5),
            avatarButtonBackgroundColor: AppColors.backgroundColor,
            onWebsiteButtonPressed: () async {
              await _saveAvatar();

              if (mounted) {
                Navigator.of(context).pushReplacementNamed(
                  RouteNames.websiteRoute,
                );
              }
            },
            onAvatarButtonPressed: () async {
              await _saveAvatar();

              if (mounted) {
                Navigator.of(context).popUntil(
                  (route) => route.settings.name == RouteNames.homeRoute,
                );
              }
            },
          ),
        ),
        body: Column(
          children: [
            FluttermojiCircleAvatar(
              backgroundColor: AppColors.accentColor.withOpacity(0.5),
            ),
            FluttermojiCustomizer(
              outerTitleText: AppConstants.avatarSelectionTitle,
            ),
          ],
        ),
      ),
    );
  }
}
