
import 'package:flutter/material.dart';

import '../widgets/app_bar_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person,
              onTap: (){},
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: (){},
            ),
            AppBarIconButton(
              iconData: Icons.notifications_none,
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}


