import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../app_colors.dart';

class Dialogs {
  invoice(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: TextCustom(
              text: "اصدار فاتوره",
              color: AppColors.tkTextPro,
              fontSize: 23,
              fontWeight: FontWeight.w400,
            )),
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
//         contentPadding: EdgeInsets.all(16),

            content: Column(mainAxisSize: MainAxisSize.min, children: [
              TextCustom(
                text: "رقم الطلب",
                color: AppColors.tkTextPro,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 13.h,
              ),
              TextCustom(
                text: "#734535",
                color: AppColors.tkTextPro,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 17.h,
              ),
              Icon(
                Icons.image_outlined,
                color: AppColors.maincolor,
                size: 37.w,
              ),
              SizedBox(
                height: 9.h,
              ),
              TextCustom(
                text: "صورة الفاتورة",
                color: AppColors.maincolor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextCustom(
                        text: "قيمة المشتريات",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "(طرد)",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextCustom(
                        text: "0",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "ريال",
                        color: AppColors.tkTextPro,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextCustom(
                        text: "ضريبة القيمه المضافه",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "15 %",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextCustom(
                        text: "7.56",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "ريال",
                        color: AppColors.tkTextPro,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 13.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextCustom(
                        text: "رسوم التوصيل",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextCustom(
                        text: "15",
                        color: AppColors.tkTextPro,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "ريال",
                        color: AppColors.tkTextPro,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextCustom(
                        text: "الإجمالي",
                        color: AppColors.tkTextPro,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextCustom(
                        text: "22.65",
                        color: AppColors.tkTextPro,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "ريال",
                        color: AppColors.tkTextPro,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              )
            ]),
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: TextCustom(
                    text: "ارسال الفاتوره",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.maincolor,
                ),
              )
            ],
            // height: 147.h,
            //   child: Column(
            //     children: [
            //       Icon(Icons.warning_amber_outlined, color: Colors.red,),
            //       TextCustom(text: "هل تريد حذف الطلب ؟" , fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF434858),),
            //       Row(
            //         children: [
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "نعم" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "الرجوع" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
          );
        });
  }

  calculater(
    BuildContext context,
  ) {
    int rest = 0;

    TextEditingController controller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: TextCustom(
              text: "الحاسبة",
              color: AppColors.maincolor,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            )),
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
//         contentPadding: EdgeInsets.all(16),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              TextCustom(
                text: "اجمالي التكلفة",
                color: AppColors.tkTextPro,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 13.h,
              ),
              TextCustom(
                text: "83.65",
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 46.h,
              ),
              Row(
                children: [
                  TextCustom(
                    text: "المدفوع",
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                      width: 116.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Color(0xFFBDBDBD),
                      )),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "100",
                            suffixText: "ريال",
                            // suffixIconConstraints: BoxConstraints(
                            //   minHeight: 40,
                            //   minWidth: 40
                            // ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            suffixStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp)
                            // suffix:  TextCustom(text: "ريال", color: Colors.black, fontSize: 11, fontWeight:FontWeight.w500 ,),
                            ),
                      )),
                ],
              ),
              Row(
                children: [
                  TextCustom(
                    text: "الباقي",
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 47.w,
                  ),

                  TextCustom(
                    text: rest.toString(),
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 45.w,
                  ),

                  TextCustom(
                    text: "ريال",
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),

                  // SizedBox(width: 26.w,),
                ],
              )
            ]),
            actions: [
              ElevatedButton(
                onPressed: () {
                  rest = cal(int.parse(controller.text), 23);
                },
                child: TextCustom(
                    text: "حساب الباقي",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.maincolor,
                ),
              )
            ],
            // height: 147.h,
            //   child: Column(
            //     children: [
            //       Icon(Icons.warning_amber_outlined, color: Colors.red,),
            //       TextCustom(text: "هل تريد حذف الطلب ؟" , fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF434858),),
            //       Row(
            //         children: [
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "نعم" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "الرجوع" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
          );
        });
  }

  notifyDriver(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      color: AppColors.maincolor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: TextCustom(
                    text: "شعار دايفر",
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
//         contentPadding: EdgeInsets.all(16),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              TextCustom(
                text: "المبلغ المحصل",
                color: AppColors.tkTextPro,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 13.h,
              ),
              TextCustom(
                text: "83.65",
                color: Color(0xFF707070),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 46.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    text: "من",
                    color: AppColors.tkTextPro,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text: "مطعم كنتاكي",
                        color: Color(0xFF707070),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "شارع الملك عبدالله - المدينه المنوره",
                        color: AppColors.tkTextPro,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )

                  // SizedBox(width: 26.w,),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    text: "الي",
                    color: AppColors.tkTextPro,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text: "محمد السيد",
                        color: Color(0xFF707070),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      TextCustom(
                        text: "طریق المسجد الحرام - العزيزية - مكة المكرمة",
                        color: AppColors.tkTextPro,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  )

                  // SizedBox(width: 26.w,),
                ],
              )
            ]),
            actions: [
              ElevatedButton(
                onPressed: () {
                  rateClient(context);
                },
                child: TextCustom(
                    text: "خروج",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors.maincolor),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: AppColors.maincolor),
                    primary: Colors.white,
                    minimumSize: Size(double.infinity, 55.h)),
              )
            ],
            // height: 147.h,
            //   child: Column(
            //     children: [
            //       Icon(Icons.warning_amber_outlined, color: Colors.red,),
            //       TextCustom(text: "هل تريد حذف الطلب ؟" , fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF434858),),
            //       Row(
            //         children: [
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "نعم" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "الرجوع" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
          );
        });
  }

  rateClient(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: TextCustom(
              text: "من فضلك قم بتقييم العميل",
              color: Color(0xFF434858),
              fontSize: 26,
              fontWeight: FontWeight.w500,
            )),
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
//         contentPadding: EdgeInsets.all(16),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star_border_outlined,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 13.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFA8A5A5)),
                ),
                child: TextField(
                    minLines: 5,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "اضف تعليقاً",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF707070),
                            fontSize: 13.sp),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none))),
              ),
            ]),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: ElevatedButton(
                  onPressed: () {},
                  child: TextCustom(
                      text: "ارسال",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.maincolor,
                      minimumSize: Size(double.infinity, 55.h)),
                ),
              )
            ],
            // height: 147.h,
            //   child: Column(
            //     children: [
            //       Icon(Icons.warning_amber_outlined, color: Colors.red,),
            //       TextCustom(text: "هل تريد حذف الطلب ؟" , fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF434858),),
            //       Row(
            //         children: [
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "نعم" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //           ElevatedButton(onPressed: (){}, child:
            //           TextCustom(text: "الرجوع" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
            //             style: ElevatedButton.styleFrom(
            //               primary: AppColors.maincolor,
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
          );
        });
  }

  int cal(int firstNumber, int secondNumber) {
    print(firstNumber - secondNumber);
    return firstNumber - secondNumber;
  }
}
