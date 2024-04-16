import 'package:app_maintain/other/color.dart';
import 'package:app_maintain/ui/main/home/home_page.dart';
import 'package:app_maintain/ui/main/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MainPageControllerState();
}

class _MainPageControllerState extends State<MyBottomNavigationBar> {
  List<Widget> _pages = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppWhite,
      body: _pages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          // if (index == 2) {
          //   return const HomePage();
          // }
          setState(() {
            _currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainAppWhite,
        unselectedItemColor: greyLightColor,
        selectedItemColor: blueDark,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 32,
              color: greyLightColor,
            ),
            activeIcon: Icon(
              Icons.home_outlined,
              size: 32,
              color: blueDark,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_giftcard_rounded,
              size: 32,
              color: greyLightColor,
            ),
            activeIcon: Icon(
              Icons.wallet_giftcard_rounded,
              size: 32,
              color: blueDark,
            ),
            label: 'Ưu đãi',
          ),
          BottomNavigationBarItem(
              icon: Container(
                height: 18,
              ),
              label: 'Mã QR'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 32,
              color: greyLightColor,
            ),
            activeIcon: Icon(
              Icons.history,
              size: 32,
              color: blueDark,
            ),
            label: 'Lịch sử GD',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 32,
              color: greyLightColor,
            ),
            activeIcon: Icon(
              Icons.person_outline,
              size: 32,
              color: blueDark,
            ),
            label: 'Thông tin',
          ),
        ],
        selectedFontSize: 12,
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: blueDark,
          borderRadius: BorderRadius.circular(28),
        ),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.qr_code_outlined,
              size: 32,
              color: mainAppWhite,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
