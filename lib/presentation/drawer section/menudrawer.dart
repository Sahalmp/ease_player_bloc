import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ease_player_bloc/application/home/home_bloc.dart';
import 'package:ease_player_bloc/main.dart';
import 'package:ease_player_bloc/presentation/drawer%20section/otherscreens.dart';
import 'package:ease_player_bloc/presentation/drawer%20section/watchhistory.dart';
import 'package:ease_player_bloc/presentation/drawer%20section/widgets/menuitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/navigations/nextpage.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.menu, size: 40),
                ),
                title: const Padding(
                  padding: EdgeInsets.only(top: 11.0, left: 16.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return MenuItems(
                      menulisticon: Icons.dark_mode,
                      menulisttitle: 'Darkmode',
                      trailingitem: Switch(
                          value: state.theme,
                          onChanged: (value) {
                            BlocProvider.of<HomeBloc>(context)
                                .add(Changetheme(theme: value));

                            !state.theme
                                ? AdaptiveTheme.of(context).setDark()
                                : AdaptiveTheme.of(context).setLight();
                          }));
                },
              ),
              MenuItems(
                  menulisticon: Icons.history,
                  menulisttitle: 'Watch History',
                  ontapfunction: () =>
                      nextPage(page: const WatchHistory(), context: context)),
              const MenuItems(
                  menulisticon: Icons.share_outlined, menulisttitle: 'Share'),
              MenuItems(
                  menulisticon: Icons.privacy_tip_outlined,
                  menulisttitle: 'Privacy Policy',
                  ontapfunction: () =>
                      nextPage(page: PrivacyPolicyPage(), context: context)),
              MenuItems(
                  menulisticon: Icons.info_outline,
                  menulisttitle: 'About',
                  ontapfunction: () =>
                      nextPage(page: const AboutPage(), context: context)),
            ],
          ),
        ),
      ),
    );
  }
}
