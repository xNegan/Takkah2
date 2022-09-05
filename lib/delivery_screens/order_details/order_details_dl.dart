import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';

class OrderDetailsScreenDl extends StatefulWidget {
  OrderDetailsScreenDl({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreenDl> createState() => _OrderDetailsScreenDlState();
}

class _OrderDetailsScreenDlState extends State<OrderDetailsScreenDl> {
  bool showPriceTextField = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 28.h),
              _orderWidget()
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(75.h),
      child: SafeArea(
        child: Container(
          height: 75.h,
          child: InkWell(
            onTap: () => Get.back(),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(width: 10.w),
              Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
                color: Color(0xffAFAFAF),
              ),
              TextCustom(text: 'رجوع', color: Color(0xffAFAFAF), fontSize: 15),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _orderWidget() {
    return Container(
      width: double.infinity,
      // height: 409.h,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
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
          ),
          SizedBox(height: 50.h),
          TextCustom(
            text: 'تفاصيل الطلب',
            color: Color(0xff4F4F4F),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 12.h),
          TextCustom(
            text: 'محتاج نص حبة دجاج و1 بيبسي دايت',
            color: Color(0xff828282),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 24.h),
          TextCustom(
            text: 'ملحوظات العميل',
            color: Color(0xff4F4F4F),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 12.h),
          TextCustom(
            text: lorimEpsum,
            color: Color(0xff828282),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 24.h),

          TextCustom(
            text: 'معلومات اضافية',
            color: Color(0xff4F4F4F),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 12.h),

          Container(
            padding: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 15.w,
              top: 17.h,
              bottom: 17.h
            ),
            decoration: BoxDecoration(
              color: Color(0xFFE8E8E8),
              borderRadius: BorderRadiusDirectional.circular(5.r)
            ),
            margin: EdgeInsetsDirectional.only(
              start: 11.w,
              end: 17.w
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                Row(
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.maincolor,),
                    TextCustom(text: "من", fontSize: 13, fontWeight: FontWeight.w400 , color: AppColors.maincolor,),
                    TextCustom(text: " السيد  ابراهيم علي ", fontSize: 13, fontWeight: FontWeight.w400 , color: Colors.black,),
                    TextCustom(text: "إلى ", fontSize: 13, fontWeight: FontWeight.w400 , color: AppColors.maincolor,),
                    TextCustom(text: "السيد  ابراهيم علي ", fontSize: 13, fontWeight: FontWeight.w400 , color: Colors.black,),
                  ],
                ),
                Icon(Icons.call, color: AppColors.maincolor,)
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          showPriceTextField
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 37.h,
                      width: 304.w,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                        // expands: true,
                        // maxLines: null,
                        // minLines: null,

                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.w),
                            suffixIcon: Icon(
                              Icons.monetization_on_outlined,
                              color: AppColors.maincolor,
                            ),
                            hintStyle: TextStyle(
                                fontSize: 12.sp, color: Color(0xffBDBDBD)),
                            hintText: '18 ر.س الى 20 .س',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide:
                                    BorderSide(color: AppColors.maincolor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide:
                                    BorderSide(color: AppColors.maincolor))),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.maincolor,
                              minimumSize: Size(180.w, 36.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.r)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          onPressed: () {
                            setState(() {
                              showPriceTextField = true;
                            });
                          },
                          child: TextCustom(
                            text: 'ارسال السعر',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white,
                          )),
                    ),
                  ],
                )
              : Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.maincolor,
                          minimumSize: Size(180.w, 36.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r)),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {
                        setState(() {
                          showPriceTextField = true;
                        });
                      },
                      child: TextCustom(
                        text: 'مستعد لتوصيل الطلب',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.white,
                      )),
                ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  String get lorimEpsum {
    return 'نالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع';
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
}
