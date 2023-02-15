import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/data/preferences/preferences_user.dart';
import 'package:calendario/presentation/pages/navigator/background_navigator.dart';
import 'package:calendario/presentation/widgets/my_dialogs.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/mysizedbox.dart';
import 'package:flutter/material.dart';

import '../pages/validate_partner/login/login_page.dart';

class DrawerMenu extends StatelessWidget {
  final prefsUser = PreferencesUser();

  DrawerMenu({Key? key}) : super(key: key);

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
                  icon: Icons.home,
                  title: 'Agenda',
                  onTap: () {
                    Navigator.pushNamed(context, BackGroundNavigator.routeName);
                  },
                ),
                _CustomListTle(
                  icon: Icons.home,
                  title: 'Invoice',
                  onTap: () {
                    Navigator.pushNamed(context, BackGroundNavigator.routeName);
                  },
                ),
                _CustomListTle(
                  icon: Icons.home,
                  title: 'Clientes',
                  onTap: () {
                    Navigator.pushNamed(context, BackGroundNavigator.routeName);
                  },
                ),
                _CustomListTle(
                  icon: Icons.home,
                  title: 'Mi cuenta',
                  onTap: () {
                    Navigator.pushNamed(context, BackGroundNavigator.routeName);
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
                      prefsUser.dispose();

                      Navigator.pushReplacementNamed(
                          context, LoginPage.routeName);
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
  final String title;
  final Function()? onTap;
  final IconData icon;
  const _CustomListTle({
    Key? key,
    required this.title,
    this.onTap,
    required this.icon,
  }) : super(key: key);

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
