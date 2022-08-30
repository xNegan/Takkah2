import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';


class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios,color: Color(0xFFAFAFAF)),),
        title: TextCustom(text: "تفاصيل الطلب", fontWeight: FontWeight.w500, fontSize: 18,color: Color(0xFFAFAFAF),),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: 55.h,
          start: 24.w,
          end: 26.w
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFEEEEEE),
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.w,
              horizontal: 12.w
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("images/kfc.png") ,
                    ),
                    SizedBox(width: 8.w,),

                    Column(
                      children: [
                        TextCustom(text: "طلبك من", color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 15,),
                        TextCustom(text: "كنتاكي", color: Color(0xFF1A1A1A), fontWeight: FontWeight.w500, fontSize: 16,),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Icon(Icons.add, color: Colors.white,),
                    decoration: BoxDecoration(
                      color: AppColors.maincolor,
                      shape: BoxShape.circle
                    ),
                    ),
                    SizedBox(height: 5.h,),
                    TextCustom(text:"إضافة طلبات", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 8.h,),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFEEEEEE),
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            padding: EdgeInsets.symmetric(
                vertical: 15.w,
                horizontal: 12.w
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(text: "تفاصيل طلبك", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15,),

                    InkWell(
                    onTap: (){
                      dialog(context);
                    },
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 12.h, color: AppColors.textColor ,),
                          TextCustom(text: "حذف الكل", color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 10,),
                        ],
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 17.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                        TextCustom(text: "1 x", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12,),
                        TextCustom(text: "مكس زنجر وتويستر ناري", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16,),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        TextCustom(text: "55", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12,),
                        TextCustom(text: "ريال", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 7,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 7.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    TextCustom(text:"عادي , سفن أب", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                    TextCustom(text:"55", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                  ],
                ),
                SizedBox(height: 7.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    TextCustom(text:"الأضافات: +2 قطعه ستريبس حار", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                    TextCustom(text:"5", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                  ],
                ),
                SizedBox(height: 17.h,),

                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.edit,size: 9.h, color: AppColors.textColor ,),
                        TextCustom(text:"تعديل", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),

                      ],
                    ),

                    InkWell(
                      onTap: (){
                        dialog(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.delete,size: 12.h, color: AppColors.textColor ,),
                          TextCustom(text:"حذف", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 8.h,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFEEEEEE),
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            padding: EdgeInsets.symmetric(
                vertical: 15.w,
                horizontal: 12.w
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(text: "تفاصيل الدفع", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15,),

                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(text: "قيمة المشتريات", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12,),
                    Row(
                      children: [
                        TextCustom(text: "55", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12,),

                        TextCustom(text: "ريال", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 7,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    TextCustom(text:"ضريبة القيمه المضافه %15", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                    Row(
                      children: [
                        TextCustom(text:"55", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                        TextCustom(text: "ريال", color: AppColors.maincolor, fontWeight: FontWeight.w500, fontSize: 7,),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    TextCustom(text:"رسوم التوصيل", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),


                    Row(
                      children: [
                        TextCustom(text:"15", color: AppColors.textColor, fontSize: 10, fontWeight: FontWeight.w400,),
                        TextCustom(text: "ريال", color: AppColors.maincolor, fontWeight: FontWeight.w500, fontSize: 7,),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 16.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    TextCustom(text:"الإجمالي", color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500,),
                    Row(
                      children: [
                        TextCustom(text:"77", color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500,),
                        TextCustom(text:"ريال", color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500,),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 41.h,),


          // ElevatedButton(onPressed: (){}, child: TextCustom(text:"الانتقال إلى الدفع", color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400,),
          //   style: ElevatedButton.styleFrom(
          //     primary: AppColors.maincolor,
          //     minimumSize: Size(double.infinity, 55.h),
          //   ),)
        ],
      ),
    );


  }

  dialog(BuildContext context){
   return  showDialog(
        context: context,

        builder: (context){
      return  AlertDialog(



title:        Icon(Icons.warning_amber_outlined, size: 70.w, color: Colors.red,),

alignment: Alignment.center,
actionsAlignment: MainAxisAlignment.center,
//         contentPadding: EdgeInsets.all(16),

        content: TextCustom(text: "هل تريد حذف الطلب ؟" , fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF434858),),
        actions: [

          ElevatedButton(
            onPressed: (){},
            child: TextCustom(text: "نعم" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
            style: ElevatedButton.styleFrom(
              primary: AppColors.maincolor,

            ),

          ),

          ElevatedButton(
            onPressed: (){},
            child: TextCustom(text: "الرجوع" , fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
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


}
