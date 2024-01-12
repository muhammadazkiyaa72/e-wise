import 'package:flutter/material.dart';
import 'package:ewise/presentation/chat/chat_screen.dart';
import 'package:ewise/presentation/profile/profile_screen.dart';
import 'package:ewise/presentation/status_pickup/status_pickup_screen.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/presentation/homepage/components/homepage.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColors.n90,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: AppColors.p40),
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.p50,
            ),
            label: 'Beranda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.library_books, color: AppColors.p40),
            icon: Icon(Icons.library_books_outlined, color: AppColors.p50),
            label: 'Pickup',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2'),
              child: Icon(Icons.chat, color: AppColors.p50),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.chat_outlined, color: AppColors.p50),
            ),
            label: 'Chat',
          ),
          NavigationDestination(
              selectedIcon: Icon(Icons.person, color: AppColors.p40),
              icon: Icon(Icons.person_outlined, color: AppColors.p50),
              label: 'Profile')
        ],
      ),
      body: <Widget>[
        // Home page
        const HomePage(),

        // Pickup page
        const Center(
          child: StatusPickupScreen(),
        ),

        // Chat page
        const Center(
          child: ChatScreen(),
        ),

        // Profile page
        const Center(
          child: ProfileScreen(),
        ),
      ][currentPageIndex],
    );
  }
}
