import 'package:flutter/material.dart';

import '../../core/config/palette.dart';
import '../../core/config/size_text.dart';
import '../../data/preferences/preferences_user.dart';
import '../pages/navigator/background_navigator.dart';
import '../pages/share_token/share_token_page.dart';
import '../pages/validate_partner/login/login_page.dart';
import '../pages/workers/home/workers_page.dart';
import 'my_dialogs.dart';
import 'my_text.dart';
import 'mysizedbox.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  final prefsUser = PreferencesUser();

  // final prefsUser = new PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Palette.white,
        elevation: 0,
        child: Column(
          children: <Widget>[
            //
            const MySizedBoxHeight(kDouble: 40),
            const _CabeceraDrower(), //
            const MySizedBoxHeight(kDouble: 20),

            Flexible(
                child: Column(
              children: [
                _CustomListTle(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    Navigator.pushNamed(context, BackGroundNavigator.routeName);
                  },
                ),
                _CustomListTle(
                  icon: Icons.people,
                  title: 'Colaboradores',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkersPage.init(context),
                        ));
                  },
                ),
                _CustomListTle(
                  icon: Icons.qr_code,
                  title: 'Compartir codigo',
                  onTap: () {
                    Navigator.pushNamed(context, ShareTokenPage.routeName);
                  },
                ),
                _CustomListTle(
                  title: 'Cerrar sesión',
                  icon: (Icons.exit_to_app_rounded),
                  onTap: () async {
                    final action = await MyDialogs.yesAbortDialog(
                        context: context,
                        title: 'Cerrar Sesión',
                        body: '¿Está seguro que desea cerrar la sesión?');

                    if (action == DialogAction.yes) {
                      prefsUser.logout();

                      if (context.mounted) {
                        Navigator.pushReplacementNamed(
                            context, LoginPage.routeName);
                      }
                    }

                    //
                  },
                ),
              ],
            )),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MyText(
                    text: '© 2022 JELAF',
                  ),
                  MyText(
                    text: 'V 1.0',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CabeceraDrower extends StatelessWidget {
  const _CabeceraDrower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Palette.green,
            radius: 40,
            child: Icon(
              Icons.person,
              color: Palette.white,
              size: 60,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(
                  text: 'Pedro Gómez',
                  fontWeight: FontWeight.w800,
                  color: Palette.blue,
                  size: SizeText.text3,
                ),
                const MySizedBoxHeight(kDouble: 5),
                Row(
                  children: const [
                    Icon(
                      Icons.location_city,
                      color: Palette.blue,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    MyText(
                      text: 'SUCURSAL LIMA',
                      fontWeight: FontWeight.w400,
                      size: SizeText.text6,
                      color: Palette.blue,
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_city,
                      color: Palette.blue,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    MyText(
                      text: 'OFICINA LIMA',
                      fontWeight: FontWeight.w400,
                      size: SizeText.text6,
                      color: Palette.blue,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomListTle extends StatelessWidget {
  const _CustomListTle({
    Key? key,
    required this.title,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      enabled: true,
      horizontalTitleGap: 16,
      minVerticalPadding: 0,
      leading: Icon(
        icon,
        color: Palette.colorApp,
        size: 20,
      ),
      title: MyText(
        text: title,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        size: SizeText.text4,
      ),
      minLeadingWidth: 0,
      onTap: onTap,
    );
  }
}
