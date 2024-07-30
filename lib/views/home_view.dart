import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todoly/model/nav_bar.dart';
import 'package:todoly/views/post_view.dart';
import 'package:todoly/views/todo_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void updateindex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<NavBar> _navBarItems = <NavBar>[
    const NavBar(
      title: 'Tasks',
      icon: Icons.task,
      page: TodoView(),
    ),
    const NavBar(
      title: 'Posts',
      icon: Icons.history,
      page: PostView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _navBarItems.elementAt(_selectedIndex).page,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: _navBarItems
                  .map((e) => GButton(
                        icon: e.icon,
                        text: e.title,
                      ))
                  .toList(),
              selectedIndex: _selectedIndex,
              onTabChange: updateindex,
            ),
          ),
        ),
      ),
    );
  }
}
