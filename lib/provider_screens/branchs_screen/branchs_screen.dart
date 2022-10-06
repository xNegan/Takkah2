// import '../../global_widgets/text_custom.dart';
// import '../../uitls/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../uitls/app_consts.dart';
//
// class BranchsScreen extends StatelessWidget {
//   BranchsScreen({Key? key}) : super(key: key);
//   TextEditingController controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: (() => Get.back()),
//             icon: Icon(
//               Icons.arrow_back_ios,
//               size: 25.sp,
//               color: Color(0xffAFAFAF),
//             )),
//       ),
//       body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 36.w),
//           child: ListView.separated(
//               shrinkWrap: true,
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (context, index) => _branchContainer(),
//               separatorBuilder: (context, index) => Divider(
//                     height: 80.h,
//                   ),
//               itemCount: 3)),
//     );
//   }
//
//   Container _branchContainer() {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               TextCustom(
//                 text: 'فرع 1',
//                 color: Color(0xff828282),
//                 fontSize: 13,
//               ),
//               Spacer(),
//               TextButton(
//                   style: TextButton.styleFrom(
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap),
//                   onPressed: () {},
//                   child: TextCustom(
//                     text: 'تعديل الفرع',
//                     color: Color(0xff707070),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   )),
//               SizedBox(width: 28.w),
//               TextButton(
//                   style: TextButton.styleFrom(
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap),
//                   onPressed: () {
//                     showDialogConform(
//                         Title: 'هل أنت متأكد من حذف الفرع',
//                         cancel: () {
//                           Get.back();
//                         });
//                   },
//                   child: TextCustom(
//                     text: 'حذف الفرع',
//                     color: Color(0xff707070),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   )),
//             ],
//           ),
//           TextCustom(
//             text: 'الموقع',
//             color: Color(0xffBBBBBB),
//             fontSize: 14,
//           ),
//           SizedBox(height: 8.h),
//
//           // SizedBox(
//           //   height: 47.h,
//           //   child: TextField(
//           //     style: TextStyle(fontSize: 14.sp, color: Color(0xff707070)),
//           //     decoration: InputDecoration(
//           //       contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
//           //       suffixIcon: Icon(
//           //         Icons.add_location_outlined,
//           //         color: Color(0xffB9B9B9),
//           //         size: 25.sp,
//           //       ),
//           //       focusedBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(7.r),
//           //         borderSide: BorderSide(
//           //           color: Color(0xffEBEBEB),
//           //         ),
//           //       ),
//           //       enabledBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(7.r),
//           //         borderSide: BorderSide(
//           //           color: Color(0xffEBEBEB),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7.r),
//               border: Border.all(
//                 color: Color(0xffEBEBEB),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextCustom(
//                   text: 'شارع الملك عبد الله - المدينة المنورة',
//                   color: Color(0xff707070),
//                   fontSize: 14,
//                 ),
//                 Icon(
//                   Icons.add_location_outlined,
//                   color: Color(0xffB9B9B9),
//                   size: 25.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 18.h),
//
//           TextCustom(
//             text: 'مواعيد العمل',
//             color: Color(0xffBBBBBB),
//             fontSize: 14,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextCustom(
//                 text: ':الايام',
//                 color: Color(0xff828282),
//                 fontSize: 13,
//               ),
//               TextCustom(
//                 text: 'من',
//                 color: Color(0xff828282),
//                 fontSize: 13,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7.r),
//                   border: Border.all(
//                     color: Color(0xffEBEBEB),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextCustom(
//                       text: 'السبت',
//                       color: Color(0xff828282),
//                       fontSize: 13,
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       color: Color(0xff7C7C7C),
//                     )
//                   ],
//                 ),
//               ),
//               TextCustom(
//                 text: 'الى',
//                 color: Color(0xff828282),
//                 fontSize: 13,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7.r),
//                   border: Border.all(
//                     color: Color(0xffEBEBEB),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextCustom(
//                       text: 'الخميس',
//                       color: Color(0xff828282),
//                       fontSize: 13,
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       color: Color(0xff7C7C7C),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextCustom(
//                 text: ':الايام',
//                 color: Color(0xff828282),
//                 fontSize: 13,
//               ),
//               TextCustom(
//                 text: 'من',
//                 color: Color(0xff828282),
//                 fontSize: 13,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7.r),
//                   border: Border.all(
//                     color: Color(0xffEBEBEB),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextCustom(
//                       text: 'السبت',
//                       color: Color(0xff828282),
//                       fontSize: 13,
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       color: Color(0xff7C7C7C),
//                     )
//                   ],
//                 ),
//               ),
//               TextCustom(
//                 text: 'الى',
//                 color: Color(0xff828282),
//                 fontSize: 13,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7.r),
//                   border: Border.all(
//                     color: Color(0xffEBEBEB),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextCustom(
//                       text: 'الخميس',
//                       color: Color(0xff828282),
//                       fontSize: 13,
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       color: Color(0xff7C7C7C),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../../const/Models/Day.dart';
import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/loading_data.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';
import '../../uitls/app_consts.dart';
import '../../uitls/storage_getX.dart';
import '../restaurant/restaurantGetx.dart';

class BranchsScreen extends StatefulWidget {
  BranchsScreen({Key? key}) : super(key: key);

  @override
  State<BranchsScreen> createState() => _BranchsScreenState();
}

class _BranchsScreenState extends State<BranchsScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    print(StorageGetX.id);
    restaurantGetx.to.getDayList();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(restaurantGetx.to.myRestaurant!.rate.toString());

    return GetBuilder<restaurantGetx>(

      builder: (controller)=>Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: (() => Get.back()),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25.sp,
                color: Color(0xffAFAFAF),
              )),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await buildBottomSheet(context: context);
          },
          label: const Text('اضافة فرع'),
          icon: const Icon(Icons.add),
          backgroundColor: AppColors.maincolor,
        ),
        body:controller.isLoadmyRestaurant?LoadingData():
        controller.myRestaurant?.branches==null?Center(child: TextCustom(text: "لا يوجد فروع مضافة"),)
            :
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var branch=controller.myRestaurant!.branches!.elementAt(index);
                  return _branchContainer(
                      namebranch: branch.name.toString(),
                      Address: branch.address.toString(),
                      EndDay: branch.endDayName.toString(),
                      StartDay: branch.startDayName.toString(),
                      EndTime: branch.endTime.toString(),
                      StartTime: branch.startTime.toString(),
                      idBranch:  branch.id.toString(),
                      Ondelete: () async {
                        Get.back();
                        await controller.DeleteBranch(idBranch: branch.id.toString());}
                  );

                },
                separatorBuilder: (context, index) => Divider(
                  height: 80.h,
                ),
                // itemCount: 1
                itemCount: controller.myRestaurant!.branches!.length==null?0 :controller.myRestaurant!.branches!.length
            )),
      ),
    );
  }

  buildBottomSheet({required BuildContext context,bool isUpdate= false,String? idBranch}) async {
    Get.bottomSheet(
      GetBuilder<restaurantGetx>(
        builder: (controller)=> Padding(
          padding: EdgeInsets.all(15.sp),
          child: SizedBox(
            height: 600.h,
            child: ListView(
              children: [
                Row(
                  children: [
                    Spacer(),
                    isUpdate?
                    TextCustom(
                      text: 'تعديل فرع',
                      color: AppColors.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    )
                        :
                    TextCustom(
                      text: 'اضافة فرع',
                      color: AppColors.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.close)),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      TextCustom(
                        text: 'الموقع',
                        color: Color(0xffBBBBBB),
                        fontSize: 14,
                      ),
                      SizedBox(height: 8.h),


                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color:Colors.grey.shade300),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCustom(
                              text: controller.addressName.isNotEmpty?controller.addressName:'',
                              color: Color(0xff707070),
                              fontSize: 14,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlacePicker(
                                      // apiKey:  "AIzaSyDrTiLARexSQDjbyPA1qwwDK-DCLu4l4mc",
                                      apiKey: "AIzaSyBw24W-zvipTztLpP14gibuLXrci-8ken0",
                                      onPlacePicked: (result) async {
                                        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                                        print(result.formattedAddress);
                                        controller.SetAddress(address: result.formattedAddress.toString());
                                        await controller.SaveLautLong(yourAddress: result.formattedAddress.toString());
                                        print(controller.Mylaut);
                                        print(controller.Mylong);
                                        // List<Location> locations = await locationFromAddress(result.formattedAddress.toString());
                                        // print(locations.first.latitude);
                                        // print(locations.first.longitude);

                                        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                                        // Navigator.of(context).pop();
                                        Get.back();

                                        // navigateTo(
                                        //     context,
                                        //     ChooseGovern(
                                        //       passed: [
                                        //         result.formattedAddress.toString(),
                                        //         result.geometry.location.lat.toString(),
                                        //         result.geometry.location.lng.toString()
                                        //       ],
                                        //     ));
                                      },
                                      initialPosition: LatLng(0, 0),
                                      useCurrentLocation: true,
                                      usePlaceDetailSearch: true,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.add_location_outlined,
                                color: Color(0xffB9B9B9),
                                size: 25.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.h),
                      TextFieldCustom(
                        controller: controller.nameBranch,
                        textInputType: TextInputType.text,
                        textHint: 'اسم الفرع',
                        hintColor: AppColors.blackColor,
                      ),
                      SizedBox(height: 18.h),

                      TextCustom(
                        text: 'مواعيد العمل',
                        color: Color(0xffBBBBBB),
                        fontSize: 14,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(
                            text: ':الايام',
                            color: Color(0xff828282),
                            fontSize: 13,
                          ),
                          TextCustom(
                            text: 'من',
                            color: Color(0xff828282),
                            fontSize: 13,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(
                                color: Color(0xffEBEBEB),
                              ),
                            ),
                            child: DropdownButton<Day>(
                              value: controller.StartDaySelected,
                              isDense: true,
                              enableFeedback: false,
                              items: controller.DayList
                                  .map((Day value) {
                                return DropdownMenuItem<
                                    Day>(
                                    value: value,
                                    child: TextCustom(text:value.value ??
                                        "" ,fontSize: 12.sp,)

                                );
                              }).toList(),
                              onChanged: (Day? value) {
                                setState(() {
                                  controller.setStartDaySelected(day:  value!);
                                });
                              },
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     TextCustom(
                            //       text: "StartDay",
                            //       color: Color(0xff828282),
                            //       fontSize: 13,
                            //     ),
                            //     Icon(
                            //       Icons.arrow_drop_down,
                            //       color: Color(0xff7C7C7C),
                            //     )
                            //   ],
                            // ),
                          ),

                          TextCustom(
                            text: 'الى',
                            color: Color(0xff828282),
                            fontSize: 13,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(
                                color: Color(0xffEBEBEB),
                              ),
                            ),
                            child: DropdownButton<Day>(
                              value: controller.EndDaySelected,
                              isDense: true,
                              enableFeedback: false,
                              items: controller.DayList
                                  .map((Day value) {
                                return DropdownMenuItem<
                                    Day>(
                                    value: value,
                                    child: TextCustom(text:value.value ??
                                        "" ,fontSize: 12.sp,)

                                );
                              }).toList(),
                              onChanged: (Day? value) {
                                setState(() {
                                  controller.setEndDaySelected(day: value!);

                                });
                              },
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     TextCustom(
                            //       text: "StartDay",
                            //       color: Color(0xff828282),
                            //       fontSize: 13,
                            //     ),
                            //     Icon(
                            //       Icons.arrow_drop_down,
                            //       color: Color(0xff7C7C7C),
                            //     )
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(
                            text: ':الوقت',
                            color: Color(0xff828282),
                            fontSize: 13,
                          ),
                          TextCustom(
                            text: 'من',
                            color: Color(0xff828282),
                            fontSize: 13,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(
                                color: Color(0xffEBEBEB),
                              ),
                            ),
                            child:
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? result = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),


                                );
                                if (result != null) {
                                  // var format = DateFormat.yMd('ar');
                                  // var dateString = format.format(DateTime.now());
                                  print(result.format(context));
                                  controller.setStartTime(time: result.format(context));
                                  // MoaeedGetX.to.setTimeMoaeed(fTime: result.format(context));
                                }

                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextCustom(
                                    text: controller.StartTime,
                                    color: Color(0xff828282),
                                    fontSize: 13,
                                  ),
                                  SizedBox(width: 3.w,),
                                  Icon(
                                    Icons.access_time,
                                    color: Color(0xff7C7C7C),
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          TextCustom(
                            text: 'الى',
                            color: Color(0xff828282),
                            fontSize: 13,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(
                                color: Color(0xffEBEBEB),
                              ),
                            ),
                            child:
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? result = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),


                                );
                                if (result != null) {
                                  // var format = DateFormat.yMd('ar');
                                  // var dateString = format.format(DateTime.now());
                                  print(result.format(context).substring(0, 4));
                                  controller.setEndTime(time: result.format(context));
                                  // MoaeedGetX.to.setTimeMoaeed(fTime: result.format(context));
                                }

                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextCustom(
                                    text: controller.EndTime,
                                    color: Color(0xff828282),
                                    fontSize: 13,
                                  ),
                                  SizedBox(width: 3.w,),
                                  Icon(
                                    Icons.access_time,
                                    color: Color(0xff7C7C7C),
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                ButtonApp(
                  onTap: () async {
                    isUpdate?await restaurantGetx.to.updateBranch(idBranch: idBranch.toString())
                        :
                    await restaurantGetx.to.addBranch();
                    // Get.back();
                    // Get.back();
                  },
                  title: 'حفظ',
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }

  Container _branchContainer({
    required String namebranch,
    required String Address,
    required String StartDay,
    required String EndDay,
    required String StartTime,
    required String EndTime,
    required String idBranch,
    required Function() Ondelete,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              TextCustom(
                text: namebranch,
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Spacer(),
              TextButton(
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () async {
                    // restaurantGetx.to.removeBranchData();

                    await buildBottomSheet(context: context,idBranch: idBranch,isUpdate: true);

                  },
                  child: TextCustom(
                    text: 'تعديل الفرع',
                    color: Color(0xff707070),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(width: 28.w),
              TextButton(
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {
                    showDialogConform(
                        Title: 'هل أنت متأكد من حذف الفرع',
                        conform: Ondelete,
                        cancel: () {
                          Get.back();
                        });
                  },
                  child: TextCustom(
                    text: 'حذف الفرع',
                    color: Color(0xff707070),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          TextCustom(
            text: 'الموقع',
            color: Color(0xffBBBBBB),
            fontSize: 14,
          ),
          SizedBox(height: 8.h),

          // SizedBox(
          //   height: 47.h,
          //   child: TextField(
          //     style: TextStyle(fontSize: 14.sp, color: Color(0xff707070)),
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          //       suffixIcon: Icon(
          //         Icons.add_location_outlined,
          //         color: Color(0xffB9B9B9),
          //         size: 25.sp,
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(7.r),
          //         borderSide: BorderSide(
          //           color: Color(0xffEBEBEB),
          //         ),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(7.r),
          //         borderSide: BorderSide(
          //           color: Color(0xffEBEBEB),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(
                color: Color(0xffEBEBEB),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                  text: Address,
                  color: Color(0xff707070),
                  fontSize: 14,
                ),
                Icon(
                  Icons.add_location_outlined,
                  color: Color(0xffB9B9B9),
                  size: 25.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),

          TextCustom(
            text: 'مواعيد العمل',
            color: Color(0xffBBBBBB),
            fontSize: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(
                text: ':الايام',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              TextCustom(
                text: 'من',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: StartDay,
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff7C7C7C),
                    )
                  ],
                ),
              ),
              TextCustom(
                text: 'الى',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: EndDay,
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff7C7C7C),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(
                text: ':الوقت',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              TextCustom(
                text: 'من',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: StartTime,
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    SizedBox(width: 3.w,),
                    Icon(
                      Icons.access_time,
                      color: Color(0xff7C7C7C),
                      size: 20.sp,
                    )
                  ],
                ),
              ),
              TextCustom(
                text: 'الى',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: EndTime,
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    SizedBox(width: 2.w,),
                    Icon(
                      Icons.access_time,
                      color: Color(0xff7C7C7C),
                      size: 20.sp,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  void openBottomSheet({required Widget widget}) {
    Get.bottomSheet(
      widget,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
    );
  }
}
