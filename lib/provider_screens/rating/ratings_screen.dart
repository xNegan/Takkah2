// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../../global_widgets/text_custom.dart';
// class RatingsScreen extends StatelessWidget {
//   const RatingsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: TextCustom(text: "التقيمات", fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFFAFAFAF),),
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(Icons.arrow_back_ios, color:  Color(0xFFAFAFAF)),
//         ),
//         elevation: 0,
//       ),
//
//       body: ListView(
//         shrinkWrap: true,
//         padding: EdgeInsetsDirectional.only(
//             start: 36.w,
//             // top: 65.h,
//             end: 30.w
//         ),
//         physics: ScrollPhysics(),
//         children: [
//           TextCustom(text: "120 تقييم", color: Color(0xFF707070), fontSize: 12, fontWeight: FontWeight.w400,),
//
//           SizedBox(height: 20.h,),
//           ListView.builder(
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               itemCount: 10,
//               itemBuilder: (context, index){
//                 return Container(
//                   margin: EdgeInsets.only(
//                       bottom: 16.h
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             child: Icon(Icons.person, color: Color(0xFF707070),),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                   color: Color(0xFF707070)
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10.w,),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               TextCustom(text: "محمد علي", color: Color(0xFF707070), fontSize: 10, fontWeight: FontWeight.w400,),
//                               RatingBar.builder(
//                                 initialRating: 3,
//                                 minRating: 1,
//                                 itemSize: 5.h,
//                                 direction: Axis.horizontal,
//                                 allowHalfRating: true,
//                                 itemCount: 5,
//                                 itemPadding: EdgeInsets.symmetric(horizontal: 0),
//                                 itemBuilder: (context, _) => Icon(
//                                   Icons.star,
//                                   color: Color(0xFFFDA000),
//                                 ),
//                                 onRatingUpdate: (rating) {
//                                   print(rating);
//                                 },
//                               ),
//
//                               //  الأكل ممتاز جدا وصل ساخن و فريش
//                               TextCustom(text: "الأكل ممتاز جدا وصل ساخن و فريش", color: Color(0xFF707070), fontSize: 7, fontWeight: FontWeight.w400,),
//
//                             ],
//                           )
//                         ],
//                       ),
//                       Divider(),
//                     ],
//                   ),
//                 );
//               }),
//           // ElevatedButton(onPressed: (){}, child:  TextCustom(text: "اضف تقييم", color: Colors.white,),
//           //   style: ElevatedButton.styleFrom(
//           //       primary: Color(0xFF636EE6),
//           //       minimumSize: Size(double.infinity, 48.h)
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../global_widgets/text_custom.dart';
import '../restaurant/restaurantGetx.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<restaurantGetx>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextCustom(
            text: "التقيمات",
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xFFAFAFAF),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFAFAFAF)),
          ),
          elevation: 0,
        ),
        body: controller.myRestaurant?.ratings == null
            ? Center(
          child: TextCustom(text: "لا يوجد تقيمات مضافة"),
        )
            : ListView(
          shrinkWrap: true,
          padding: EdgeInsetsDirectional.only(
              start: 36.w,
              // top: 65.h,
              end: 30.w),
          physics: ScrollPhysics(),
          children: [
            TextCustom(
              text:
              "${controller.myRestaurant?.ratings?.length.toString()} تقييم ",
              color: Color(0xFF707070),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),

            SizedBox(
              height: 20.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: controller.myRestaurant?.ratings?.length,
                itemBuilder: (context, index) {
                  var rate =
                  controller.myRestaurant?.ratings?.elementAt(index);
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF707070),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                Border.all(color: Color(0xFF707070)),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                  text: rate!.userName.toString(),
                                  color: Color(0xFF707070),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                RatingBar.builder(
                                  initialRating: rate!.rate! + 0.0,
                                  minRating: 1,
                                  itemSize: 5.h,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xFFFDA000),
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),

                                //  الأكل ممتاز جدا وصل ساخن و فريش
                                TextCustom(
                                  text: rate.text.toString(),
                                  color: Color(0xFF707070),
                                  fontSize: 7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  );
                }),
            // ElevatedButton(onPressed: (){}, child:  TextCustom(text: "اضف تقييم", color: Colors.white,),
            //   style: ElevatedButton.styleFrom(
            //       primary: Color(0xFF636EE6),
            //       minimumSize: Size(double.infinity, 48.h)
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
