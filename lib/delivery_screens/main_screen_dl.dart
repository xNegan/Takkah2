import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global_widgets/text_custom.dart';
import '../uitls/app_colors.dart';
import 'maps_order_active/maps_order_active_dl.dart';
import 'notification_screen/notification_screen_dl.dart';
import 'orders_screen/orders_screen_dl.dart';
import 'settings_screen/settings_screen_dl.dart';

class MainScreenDl extends StatefulWidget {
  MainScreenDl({Key? key}) : super(key: key);

  @override
  State<MainScreenDl> createState() => _MainScreenDlState();
}

class _MainScreenDlState extends State<MainScreenDl> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home_repair_service_rounded,
    Icons.shopping_bag_rounded,
    Icons.notifications,
    Icons.person,
  ];
  final titlesList = <String>['الرئيسية', 'الطلبات', 'الاشعارات', 'الاعدادات'];
  final screensList = <Widget>[
    MapsOrderActiveDl(),
    OrdersScreenDl(),
    NotificationScreenDl(),
    SettingsScreenDl(),
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
                      icon: Icon(Icons.access_alarms_sharp), label: 'التوصيل'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.my_library_books_outlined),
                      label: 'الطلبات'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.mark_email_unread_rounded),
                      label: 'الاشعارات'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'الاعدادات'),
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
              color: AppColors.drInActiveBnbIcon,
              fontSize: 11),
        )
      ],
    );
  }
}
