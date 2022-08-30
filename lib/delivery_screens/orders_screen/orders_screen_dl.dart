import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../order_details/order_details_dl.dart';

class OrdersScreenDl extends StatefulWidget {
  OrdersScreenDl({Key? key}) : super(key: key);

  @override
  State<OrdersScreenDl> createState() => _OrdersScreenDlState();
}

class _OrdersScreenDlState extends State<OrdersScreenDl> {
  bool showORders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(height: 65.h),
              _buildSwitchRow(),
              showORders
                  ? Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => _orderWidget(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 19.h),
                          itemCount: 4))
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderWidget() {
    return InkWell(
      onTap: () => Get.to(OrderDetailsScreenDl()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 206.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9.r),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.solid,
                    color: Colors.grey.withOpacity(0.16),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 35.h,
                            ),
                            TextCustom(
                              text: 'محتاج نص حبة دجاج و1 بيبسي',
                              color: Color(0xff828282),
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                clipBehavior: Clip.antiAlias,
                                width: 39.w,
                                height: 39.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurStyle: BlurStyle.solid,
                                          color: Color(0xffAFAFAF),
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjFRrxLRvkXnZt3YvpE4fSJrITgfxtZ9Do8A&usqp=CAU',
                                  width: 39.w,
                                  height: 39.h,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(height: 8.h),
                            TextCustom(
                              text: 'سمر قندي',
                              color: Color(
                                0xff4F4F4F,
                              ),
                              fontSize: 11,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: TextCustom(
                          text: 'منذ 3 دقائق',
                          color: Color(0xffCBC5C5),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.person,
                            size: 20,
                            color: Color(0xffBDBDBD),
                          ),
                          TextCustom(
                            text: 'انت',
                            fontSize: 10,
                            color: Color(0xffBDBDBD),
                          )
                        ],
                      ),
                      indicatiorContainer(),
                      indicatiorContainer(outLined: true),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            border: Border.all(color: AppColors.maincolor)),
                        child: TextCustom(
                          text: '2 كم',
                          fontSize: 10,
                          color: AppColors.maincolor,
                        ),
                      ),
                      indicatiorContainer(outLined: true),
                      indicatiorContainer(outLined: true),
                      Column(
                        children: [
                          Icon(
                            Icons.fire_truck,
                            size: 20,
                            color: Color(0xffBDBDBD),
                          ),
                          TextCustom(
                            text: 'استلام الطلب',
                            fontSize: 10,
                            color: Color(0xffBDBDBD),
                          )
                        ],
                      ),
                      indicatiorContainer(outLined: true),
                      indicatiorContainer(outLined: true),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            border: Border.all(
                              color: Color(0xff828282),
                            )),
                        child: TextCustom(
                          text: '4 كم',
                          fontSize: 10,
                          color: Color(0xff828282),
                        ),
                      ),
                      indicatiorContainer(outLined: true),
                      indicatiorContainer(outLined: true),
                      Column(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Color(0xffBDBDBD),
                          ),
                          TextCustom(
                            text: 'تسليم',
                            fontSize: 10,
                            color: Color(0xffBDBDBD),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffE8E8E8),
                  minimumSize: Size(140.w, 25.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18.r),
                          bottomRight: Radius.circular(18.r))),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: 'دفع',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  SizedBox(width: 15.w),
                  Icon(
                    Icons.monetization_on_outlined,
                    size: 20.sp,
                    color: Colors.black,
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget indicatiorContainer({bool outLined = false}) {
    return Container(
      //  margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 14.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: outLined ? Colors.white : Color(0xffBDBDBD),
        borderRadius: BorderRadius.circular(10.r),
        border: outLined ? Border.all(color: Color(0xffBDBDBD)) : null,
      ),
    );
  }

  Container _buildSwitchRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurStyle: BlurStyle.solid,
          color: Colors.grey.withOpacity(0.16),
          blurRadius: 6,
          offset: Offset(0, 3),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 45.w,
            height: 20.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.solid,
                    color: Colors.grey.withOpacity(0.16),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Switch(
              value: showORders,
              onChanged: (value) {
                setState(() {
                  showORders = value;
                  print(showORders);
                });
              },
              //  activeColor: Colors.white,
              thumbColor: MaterialStateProperty.all(Colors.white),
              inactiveThumbColor: AppColors.maincolor,
              inactiveTrackColor: Colors.grey,

              activeTrackColor: AppColors.maincolor,
            ),
          ),
          TextCustom(
            text: 'محمد علي محمد',
            fontSize: 12,
          ),
          Container(
              clipBehavior: Clip.antiAlias,
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.solid,
                        color: Colors.black,
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjFRrxLRvkXnZt3YvpE4fSJrITgfxtZ9Do8A&usqp=CAU',
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
