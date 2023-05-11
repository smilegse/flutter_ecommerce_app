import 'package:ecommerce_app/ui/utils/styles.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/home/app_bar_icon_button.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/search_text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.notifications_none,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SearchTextFieldWidget(),
            const SizedBox(
              height: 16,
            ),
            HomeCarouselWidget(),
            const SizedBox(
              height: 16,
            ),
            RemarksTitleWidget(
              remarkName: 'Categories',
              onTapSelectAll: () {},
            )
          ],
        ),
      ),
    );
  }
}

class RemarksTitleWidget extends StatelessWidget {
  const RemarksTitleWidget({
    super.key, required this.remarkName, required this.onTapSelectAll,
  });

  final String remarkName;
  final VoidCallback onTapSelectAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          remarkName,
          style: titleTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onTapSelectAll,
          child: const Text(
            'See all',
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
