
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global_widgets/text_custom.dart';
import '../uitls/app_colors.dart';
import 'balance_withdrawal/balance_withdrawal_screen.dart';
import 'home_screen/home_screen.dart';
import 'main_orders_screen/main_orders_screen.dart';
import 'notification_screen/notification_screen.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home_repair_service_rounded,
    Icons.shopping_bag_rounded,
    Icons.notifications,
    Icons.person,
  ];
  final titlesList = <String>[
    'الرئيسية',
    'السحب من الرصيد',
    'الاشعارات',
    'الطلبات النشطة'
  ];
  final screensList = <Widget>[
    HomeScreen(),
    BalanceWithdrawalScreen(),
    NotificationScreen(),
    MainOrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screensList[_bottomNavIndex],
        bottomNavigationBar: Container(
            height: 96.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(19), topLeft: Radius.circular(19)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 0,
                    blurRadius: 6),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.0),
                topRight: Radius.circular(19.0),
              ),
              child: BottomNavigationBar(
                selectedLabelStyle: TextStyle(fontSize: 11.sp, height: 3.sp),
                unselectedLabelStyle: TextStyle(fontSize: 11.sp, height: 3.sp),
                currentIndex: _bottomNavIndex,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: AppColors.maincolor,
                unselectedItemColor: Color(0xffA9A9A9),
                onTap: (value) {
                  setState(() {
                    _bottomNavIndex = value;
                  });
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), label: 'الرئيسية'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.wallet), label: 'السحب من الرصيد'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.mark_email_unread_rounded),
                      label: 'الاشعارات'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.alarm), label: 'الطلبات النشطة'),
                ],
              ),
            )));
  }

  Column _bnbItem(int index, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconList[index],
          size: 24,
          color: color,
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextCustom(
              text: titlesList[index],
              color: AppColors.maincolor,
              fontSize: 11),
        )
      ],
    );
  }
}
