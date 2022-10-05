import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/provider_screens/restaurant/restaurantGetx.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../../uitls/app_consts.dart';

class MealsDetailsScreen extends StatefulWidget {

  String idMeail;

  MealsDetailsScreen({required this.idMeail});

  @override
  State<MealsDetailsScreen> createState() => _MealsDetailsScreenState();
}

class _MealsDetailsScreenState extends State<MealsDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    restaurantGetx.to.getMeal(idMenu: widget.idMeail.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextCustom(text: "تفاصيل الوجبة", fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFFAFAFAF),),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color:  Color(0xFFAFAFAF)),
        ),
        elevation: 0,
      ),

      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: 24.w,
          end: 24.w
        ),
        children: [
          Image.asset("images/mix.png", width: 261.w, height: 261.h, fit: BoxFit.cover,),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.maincolor
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsetsDirectional.only(
              start: 12.w,
              top: 12.h,
              bottom: 52.h
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(text: "الوجبة", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,),
                TextCustom(text: "برجر بروست", fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black,),
                TextCustom(text: "السعر", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,),
                TextCustom(text: "\$6.5.00", fontSize: 14, fontWeight: FontWeight.w500, color:AppColors.maincolor,),
                TextCustom(text: "الوصف", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,),
                TextCustom(text: "3 قطع دجاج + كول سلو صغير + رز + كوكيز + مشروب وسط من اختيارك", fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF817F7F),),
                TextCustom(text: "التقييم والمراجعة", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,),
                Row(
                  children: [
                    TextCustom(text: "(50)", fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFAFAFAF),),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 10.h,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.6),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Color(0xFFFAB44B),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h,),


          ElevatedButton(onPressed: (){}, child: TextCustom(text: "تعديل", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white,),
          style: ElevatedButton.styleFrom(
            primary: AppColors.maincolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            )
          ),

          ),
          SizedBox(height: 12.h,),

          ElevatedButton(onPressed: (){showDialogConform(Title: 'هل أنت متأكد من حذف الوجبة',cancel: (){Get.back();});}, child: TextCustom(text: "حذف", fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.maincolor,),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                side: BorderSide(
                  color: AppColors.maincolor
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                )
            ),

          )



        ],
      ),
    );
  }
}
