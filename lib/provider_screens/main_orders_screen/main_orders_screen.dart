import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../order_details/order_details_screen.dart';
import '../problem/problem.dart';

class MainOrdersScreen extends StatefulWidget {
  MainOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MainOrdersScreen> createState() => _MainOrdersScreenState();
}

enum PopupMenu { Details, Problem }

class _MainOrdersScreenState extends State<MainOrdersScreen> {
  int _duration = 10;
  final CountDownController _CountDownController = CountDownController();
  List<String> items = [
    'المندوب تاخر',
    'المندوب لا يرد على رسائلي',
    'استلمت الطلب الغلط',
    'الطلب ناقص',
    'سبب اخر',
  ];
  String? selectedItem = 'المندوب تاخر';
  int index = 0;

  ////////////////
  List<String> currentOrdersStatus = [
    'دليفري',
    'شخصي',
    'محلي',
  ];
  String currentOrdersStatusSelectedItem = 'دليفري';
  ///////////////

  ////////////////
  List<String> previousOrdersStatus = [
    'دليفري',
    'شخصي',
    'محلي',
  ];
  String previousOrdersStatusSelectedItem = 'دليفري';
  ///////////////

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            const Divider(
              color: Color(0xffC1C1C1),
              thickness: 1,
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                _currentOrdersView(),
                _previousOrdersView(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _previousOrdersView() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          height: 44.h,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: ((context, index) => SizedBox(width: 20.w)),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: previousOrdersStatus.length,
            itemBuilder: ((context, index) => _orderTypeContainer(
                  isSelected: previousOrdersStatusSelectedItem ==
                      previousOrdersStatus[index],
                  text: previousOrdersStatus[index],
                  onTap: () {
                    setState(() {
                      previousOrdersStatusSelectedItem =
                          previousOrdersStatus[index];
                    });
                  },
                )),
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.separated(
            separatorBuilder: ((context, index) => SizedBox(height: 10.h)),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: ((context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      //  selectedValue = items[index];
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 13.h),
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 1, color: AppColors.tkborder),
                          // borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xffF6F6F6)),
                      child: Row(
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.linearToSrgbGamma(),
                                  image: AssetImage(
                                    'images/beak.png',
                                  )),
                            ),
                            // child: Image.asset('images/person.png')
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                  text: 'طلب وجبه كومبو من البيك',
                                  fontSize: 15.sp,
                                  color: Color(0xffAFAFAF),
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Image.asset('images/clock.png')),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextCustom(
                                      text: 'منذ 4 آيام',
                                      fontSize: 12.sp,
                                      color: AppColors.hintText,
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Container(
                                        child: Image.asset(
                                            'images/money-recive.png')),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextCustom(
                                      text: '135 ريال',
                                      fontSize: 12.sp,
                                      color: AppColors.hintText,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          // InkWell(
                          //   onTap: (){
                          //
                          //   },
                          //     child: Icon(Icons.more_vert,color: AppColors.drInActiveBnbIcon,))
                          _PopOutMenu()
                        ],
                      )),
                )),
          ),
        ),
      ],
    );
  }

  Widget _currentOrdersView() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          height: 44.h,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: ((context, index) => SizedBox(width: 20.w)),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: currentOrdersStatus.length,
            itemBuilder: ((context, index) => _orderTypeContainer(
                  isSelected: currentOrdersStatusSelectedItem ==
                      currentOrdersStatus[index],
                  text: currentOrdersStatus[index],
                  onTap: () {
                    setState(() {
                      currentOrdersStatusSelectedItem =
                          currentOrdersStatus[index];
                    });
                  },
                )),
          ),
        ),
        SizedBox(height: 30.h),
        Expanded(
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              itemBuilder: (context, index) => _currentOrderWidet(),
              separatorBuilder: (context, index) => SizedBox(height: 5.h),
              itemCount: 1),
        ),
      ],
    );
  }

  InkWell _orderTypeContainer(
      {required String text,
      required bool isSelected,
      required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 7.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.maincolor),
          borderRadius: BorderRadius.circular(5.r),
          color: isSelected ? AppColors.maincolor : Colors.white,
        ),
        child: TextCustom(
          text: text,
          color: isSelected ? Colors.white : AppColors.maincolor,
        ),
      ),
    );
  }

  Container _currentOrderWidet() {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  'https://d34u8crftukxnk.cloudfront.net/slackpress/prod/sites/6/E12KS1G65-W0168RE00G7-133faf432639-512.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  TextCustom(
                    text: 'محمد علي',
                    fontSize: 16,
                    color: Color(0xffABABAB),
                  ),
                  RatingBar.builder(
                    itemSize: 15.sp,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 5.h),
                  TextCustom(
                    text: 'رقم الطلب 1654',
                    fontSize: 10,
                    color: Color(0xffABABAB),
                  ),
                ],
              ),
              //Spacer(),
              // Column(
              //   children: [
              //     Icon(
              //       Icons.check_circle,
              //       color: Color(0xff0BD42C),
              //     ),
              //     TextCustom(
              //       textDecoration: TextDecoration.underline,
              //       text: 'تم اصدار الفاتورة',
              //       fontSize: 10,
              //       color: Color(0xffABABAB),
              //     ),
              //   ],
              // )
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => Get.to(OrderDetailsScreen()),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.my_library_books_outlined,
                      color: AppColors.maincolor,
                    ),
                    SizedBox(height: 6.h),
                    TextCustom(
                      text: 'تفاصيل الطلب',
                      fontSize: 12,
                      color: Color(0xffABABAB),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.phone_in_talk_outlined,
                    color: AppColors.maincolor,
                  ),
                  SizedBox(height: 6.h),
                  TextCustom(
                    text: 'اتصال',
                    fontSize: 12,
                    color: Color(0xffABABAB),
                  ),
                ],
              ),
              InkWell(
                //   onTap: () => Get.to(ChatScreen()),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: AppColors.maincolor,
                    ),
                    SizedBox(height: 6.h),
                    TextCustom(
                      text: 'دردشة',
                      fontSize: 12,
                      color: Color(0xffABABAB),
                    ),
                  ],
                ),
              ),
              if (currentOrdersStatusSelectedItem == currentOrdersStatus[2])
                InkWell(
                  onTap: () {
                    //Dialog
                    if (Platform.isAndroid) {
                      dialog(onTap: () {
                        Get.back();
                        dialogSucsess();
                      });
                    } else {
                      Get.dialog(CupertinoAlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                    //  color: Colors.green,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(50))),
                                child: Icon(
                                  Icons.clear,
                                  size: 80,
                                  color: AppColors.redColor,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextCustom(
                                text: "Title",
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                // color: AppColors.mainYellow,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: TextCustom(
                                  text: 'Ok',
                                  color: AppColors.redColor,
                                ))
                          ]));
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.more_time_outlined,
                        color: AppColors.maincolor,
                      ),
                      SizedBox(height: 6.h),
                      TextCustom(
                        text: 'اضافة الوقت',
                        fontSize: 12,
                        color: Color(0xffABABAB),
                      ),
                    ],
                  ),
                ),

              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Icon(
              //       Icons.location_on_outlined,
              //       color: AppColors.drAddLocation,
              //     ),
              //     SizedBox(height: 6.h),
              //     TextCustom(
              //       text: 'تتبع',
              //       fontSize: 12,
              //       color: Color(0xffABABAB),
              //     ),
              //   ],
              // ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                _CountDownController.start();
              },
              child: Text('asd')),
          ElevatedButton(
              onPressed: () {
                _CountDownController.pause();

                setState(() {
                  _duration = 100;
                  // _duration = 60;
                  // _CountDownController.resume();
                });
              },
              child: Text('asd')),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50.h),
              TextCustom(
                text: 'الوقت لتجهيز الطلب',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.maincolor,
              ),
              SizedBox(height: 20.h),
              CircularCountDownTimer(
                duration: _duration,
                initialDuration: 0,
                controller: _CountDownController,
                width: 124.w,
                height: 124.h,
                ringColor: Colors.grey[300]!,
                fillColor: AppColors.maincolor,
                backgroundColor: Colors.white,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.maincolor,
                    fontWeight: FontWeight.w500),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
              ),
              SizedBox(height: 25.h),
            ],
          ),

          ////
        ],
      ),
    );
  }

  Future<dynamic> dialog({
    required Function() onTap,
    // required TextEditingController controller,
  }) {
    return Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(
              text: "إضافة وقت التجهيز",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // color: AppColors.mainYellow,
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 80.w, end: 80.w),
              height: 85.h,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.maincolor)),
              child: TextFormField(
                //  controller: controller,
                keyboardType: TextInputType.datetime,
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: true,
                  selectAll: true,
                ),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'ادخل الوقت',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.sp,
                    color: AppColors.lGray,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 50.w, end: 50.w),
                height: 50.h,
                decoration: new BoxDecoration(
                    color: AppColors.maincolor,
                    borderRadius: new BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: TextCustom(
                    text: "تأكيد",
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
    );
  }

  Future<dynamic> dialogSucsess() {
    return Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/check.png',
              width: 100.w,
            ),
            SizedBox(
              height: 50.h,
            ),
            TextCustom(
              text: "تم إضافة الوقت بنجاح",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // color: AppColors.mainYellow,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      bottom: _tabBar(),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: TextCustom(
        text: 'الطلبات',
        fontSize: 18,
        color: AppColors.maincolor,
      ),
      // leading: InkWell(
      //   onTap: () {},
      //   child: Icon(
      //     Icons.arrow_back_ios,
      //     color: AppColors.drInActiveBnbIcon,
      //   ),
      // )
    );
  }

  TabBar _tabBar() {
    return TabBar(
        onTap: ((value) {
          setState(() {
            index = value;
          });
        }),
        labelPadding: EdgeInsets.zero,
        indicatorColor: Colors.transparent,
        labelColor: AppColors.maincolor,
        unselectedLabelColor: Color(0xFFAFAFAF),
        tabs: [
          _customTab(
              text: 'الطلبات الحالية',
              isSelected: index == 0,
              hideSideBorder: false),
          _customTab(
              text: 'الطلبات السابقة',
              isSelected: index == 1,
              hideSideBorder: false),
        ]);
  }

  Widget _customTab(
      {required String text, isSelected, bool hideSideBorder = true}) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
          border: hideSideBorder
              ? null
              : Border(
                  right: BorderSide(
                      color: hideSideBorder ? Colors.red : Color(0xffC1C1C1),
                      width: 1,
                      style: BorderStyle.solid))),
      child: Tab(
          icon: TextCustom(
        text: text,
        fontSize: 16,
        color: isSelected ? AppColors.maincolor : Color(0xFFAFAFAF),
      )),
    );
  }

  Widget _PopOutMenu() {
    return PopupMenuButton<PopupMenu>(
      icon: Icon(
        Icons.more_vert,
        color: Color(0xFFAFAFAF),
      ),
      offset: Offset(20.w, 40.h),
      elevation: 0,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0.r))),
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopupMenu>(
            value: PopupMenu.Details,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: 'تفاصيل الطلب',
                  color: AppColors.lightBlack,
                  fontSize: 14,
                ),
                Divider()
              ],
            ),
          ),
          PopupMenuItem<PopupMenu>(
            value: PopupMenu.Problem,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: 'رفع شكوي',
                  color: AppColors.lightBlack,
                  fontSize: 14,
                ),
                Divider()
              ],
            ),
          ),
        ];
      },
      onSelected: (PopupMenu menu) {
        switch (menu) {
          case PopupMenu.Details:
            Get.to(OrderDetailsScreen());
            break;
          case PopupMenu.Problem:
            Get.to(Problem());
            break;
        }
      },
    );
  }
}
