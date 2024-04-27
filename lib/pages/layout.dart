import 'package:flutter/material.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/pages/cart.dart';
import 'package:shopping_app/pages/home.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List<Widget> pages = [const HomePage(), const CartPage()];
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shoes Collection",
          style: TextStyle(
            color: CustomColors.darkBlue,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        selectedFontSize: 0,
        unselectedFontSize: 0,
      ),
    );
  }
}
