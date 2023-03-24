import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/features/home/presentation/pages/home_screen.dart';
import 'package:ecom_clean_code/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  final _screensList = const [
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _screensList[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6.0),
          topRight: Radius.circular(6.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primaryDark,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: AppColors.blueDark,
          selectedFontSize: 12.0,
          currentIndex: _currentIndex,
          onTap: ((newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          }),
          items: const [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.grid_view_rounded),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.inventory),
                ),
                label: 'Products'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.person),
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
