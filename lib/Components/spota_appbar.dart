import 'package:flutter/material.dart';

import '../constants.dart';

class SpotaAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SpotaAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0,
      leadingWidth: 0,
      title: const Text("Spota", style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontFamily: "Oxanium",
        fontWeight: FontWeight.normal,
      ),),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu,
              color: Colors.white,
              size: 36),
        )
      ],
    );
  }
}