import 'package:ecommerce_app/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/ui/screens/category_screen.dart';
import 'package:ecommerce_app/ui/screens/home_screen.dart';
import 'package:ecommerce_app/ui/screens/wish_list_screen.dart';
import 'package:ecommerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  final List<Widget> _screen = const[
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          _selectedIndex = value;
          if(mounted){
            setState(() {});
          }
        },
        elevation: 8,
        selectedItemColor: primaryColor,
        unselectedItemColor: lightGreyColor,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          color: lightGreyColor,
        ),
        currentIndex: _selectedIndex,

        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_outlined),),
          BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.grid_view_outlined),),
          BottomNavigationBarItem(label: 'Cart', icon: Icon(Icons.shopping_cart_outlined),),
          BottomNavigationBarItem(label: 'Wishlist', icon: Icon(Icons.favorite_border_outlined),)
        ],
      ),
    );
  }
}
