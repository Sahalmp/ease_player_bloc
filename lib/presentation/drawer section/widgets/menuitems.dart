import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
    required this.menulisticon,
    required this.menulisttitle,
      this.trailingitem,
      this.ontapfunction,
  }) : super(key: key);

  final IconData menulisticon;
  final  String menulisttitle;
  final   trailingitem;
  final   ontapfunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(menulisticon),
      title: Text(
        menulisttitle,
      ),
      trailing: trailingitem,
      onTap: ontapfunction,
    );
  }
}