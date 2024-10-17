import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app_config/palette.dart';
import '../../../config/app_config/size_text.dart';
import '../../../config/app_config/space_helpers.dart';
import '../../../config/helpers/helpers.dart';
import '../../../config/routes/app_router.dart';
import '../../../generated/translations.g.dart';
import '../blocs/general/session/session_bloc.dart';
import '../pages/navigator/navigator_page.dart';
import '../pages/share_token/share_token_page.dart';
import '../pages/workers/home/workers_page.dart';
import 'my_text.dart';
import 'popups/my_dialog.dart';
import 'version_app_container.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Palette.backgroundColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    _DrawerHeader(),
                    SpaceHelpers.verticalLong,
                    SpaceHelpers.verticalLong,
                    SpaceHelpers.verticalLong,
                    Expanded(
                      child: Column(
                        children: [
                          _CustomListTle(
                            title: Helpers.firstStringCapitalization(
                                texts.label.home),
                            icon: (Icons.home),
                            onTap: () {
                              context.push(NavigatorPage.route);
                            },
                          ),
                          _CustomListTle(
                            title: Helpers.firstStringCapitalization(
                                texts.label.collaborators),
                            icon: Icons.people,
                            onTap: () {
                              context.go(WorkersPage.route);
                            },
                          ),
                          _CustomListTle(
                            title: Helpers.firstStringCapitalization(
                                texts.label.shareCode),
                            icon: Icons.qr_code,
                            onTap: () {
                              context.push(ShareTokenPage.route);
                            },
                          ),
                          _CustomListTle(
                            icon: Icons.logout,
                            color: Colors.red,
                            title: Helpers.firstStringCapitalization(
                                texts.label.logout),
                            onTap: () async {
                              final response = await MyDialogs.yesAbortDialog(
                                  context: context,
                                  body: texts.messages.doYouWantToLogout);
                              if (!context.mounted) return;
                              if (response == DialogAction.abort) return;
                              context.read<SessionBloc>().logout();
                              appRouter.go('/');
                            },
                          ),
                        ],
                      ),
                    ),
                    _CustomListTle(
                      icon: Icons.delete,
                      color: Colors.red,
                      title: Helpers.firstStringCapitalization(
                          texts.label.cleanToken),
                      onTap: () async {
                        final response = await MyDialogs.yesAbortDialog(
                            context: context,
                            body: texts.messages
                                .doYouWantToLogoutAndRemoveTheTokenLinkedToThePhone);
                        if (!context.mounted) return;
                        if (response == DialogAction.abort) return;
                        context.read<SessionBloc>().logoutForceTokenApp();
                        appRouter.go('/');
                      },
                    ),
                    SpaceHelpers.verticalLong,
                  ],
                ),
              ),
              VersionAppContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    final user = context.read<SessionBloc>().state.user;
    final userBusiness =
        context.read<SessionBloc>().state.user?.userBusinessData;
    return Column(
      children: [
        SpaceHelpers.verticalNormal,
        CircleAvatar(
          backgroundColor: Palette.primaryColor,
          radius: 40,
          child: Icon(
            Icons.person,
            color: Palette.white,
            size: 60,
          ),
        ),
        SpaceHelpers.verticalNormal,
        MyText(
          user?.name ?? '',
          fontWeight: FontWeight.w800,
          color: Palette.primaryColor,
          size: SizeText.text3,
          maxLines: 4,
          textAlign: TextAlign.center,
        ),
        SpaceHelpers.verticalSmall,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_city,
              color: Palette.primaryColor,
              size: 20,
            ),
            SizedBox(width: 10),
            MyText(
              // '${bloc.dataBusinessLogin?.descriptionOffice}',
              userBusiness?.descriptionOffice ?? '',
              fontWeight: FontWeight.w400,
              size: SizeText.text6,
              color: Palette.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomListTle extends StatelessWidget {
  const _CustomListTle({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
    this.color = Palette.primaryColor,
  });
  final String title;
  final Function()? onTap;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      enabled: true,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 10,
      minVerticalPadding: 0,
      leading: Icon(
        icon,
        color: color,
        size: 18,
      ),
      title: MyText(
        title,
        fontWeight: FontWeight.w400,
        color: color,
        size: SizeText.text5 + 1,
      ),
      minLeadingWidth: 0,
      onTap: onTap,
    );
  }
}
