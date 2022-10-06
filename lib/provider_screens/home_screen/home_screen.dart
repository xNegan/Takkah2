import 'package:cached_network_image/cached_network_image.dart';
import 'package:takkah/preferences/user_preferences.dart';
import 'package:takkah/provider_screens/rating/ratings_screen.dart';
import 'package:takkah/provider_screens/updateScreen/updateProfile.dart';
import 'package:takkah/uitls/storage_getX.dart';
import '../../global_widgets/loading_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../branchs_screen/branchs_screen.dart';
import '../categories/categories_screen.dart';
import 'package:takkah/provider_screens/restaurant/restaurantGetx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    restaurantGetx.to.getRestaurantById(id:StorageGetX.restaurants);
    //restaurantGetx.to.getRestaurantById(id:UserPreferences().store_id.toString());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<restaurantGetx>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: controller.isLoadmyRestaurant
              ? LoadingData()
              : SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                _logoContainer(
                    LinkImage: controller.myRestaurant!.logo.toString(),
                    Email: controller.myRestaurant!.email.toString(),
                    Name:controller.myRestaurant!.name.toString(),
                    rating: 2),
                SizedBox(height: 100.h),
                // _settingsItem(
                //     startText: 'سجل الطلبات',
                //     endText: '',
                //     icon: Icons.history_edu_rounded),
                // SizedBox(height: 6.h),
                InkWell(
                  onTap: () {
                    Get.to(BranchsScreen());
                  },
                  child: _settingsItem(
                      startText: 'الفروع', endText: '', icon: Icons.map_rounded),
                ),
                SizedBox(height: 6.h),
                InkWell(
                  onTap: () {
                    Get.to(CategoriesScreen());
                  },
                  child: _settingsItem(
                      startText: 'الاقسام',
                      endText: '',
                      icon: Icons.layers_outlined),
                ),
                SizedBox(height: 6.h),
                InkWell(
                  onTap: () {
                    Get.to(RatingsScreen());
                  },
                  child: _settingsItem(
                    startText: 'التقييمات',
                    endText: '',
                    icon: Icons.star,
                  ),
                ),
                SizedBox(height: 6.h),
                _settingsItem(
                    startText: 'المبالغ المحصلة',
                    endText: '1235 ريال',
                    icon: Icons.message),
                SizedBox(height: 6.h),
                _settingsItem(
                    startText: 'الشروط والاحكام',
                    endText: '',
                    icon: Icons.description),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _logoContainer({required String LinkImage,
    required double rating,
    required String Email,
    required String Name,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      width: 324.w,
      height: 324.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.maincolor)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 130.w,
              height: 130.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xffEBEBEB),
                    blurRadius: 2,
                    blurStyle: BlurStyle.solid,
                    spreadRadius: 2)
              ], shape: BoxShape.circle),
              child: buildCachedNetworkImage(ImageUrl:LinkImage )
            // Image.network(
            //   LinkImage,
            // //  'https://brandslogos.com/wp-content/uploads/images/large/kfc-logo-black-and-white-1.png',
            //   fit: BoxFit.cover,
            //   width: 130.w,
            //   height: 130.h,
            // ),
          ),
          TextCustom(
            text: Name,
            color: Color(0xff7C7C7C),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TextCustom(
            text: Email,
            color: Color(0xffBBBBBB),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          RatingBar.builder(
            itemSize: 20.sp,
            initialRating: rating,
            minRating: 1,

            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            ignoreGestures: true,
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
              onPressed: () {
                Get.to(UpdateProfile());
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  primary: AppColors.maincolor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(84.w, 28.h),
                  maximumSize: Size(84.w, 28.h)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: 'تعديل',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  SizedBox(width: 3.w),
                  Icon(
                    Icons.border_color_rounded,
                    color: Colors.white,
                    size: 12.sp,
                  )
                ],
              ))
        ],
      ),
    );
  }


  Widget _settingsItem(
      {required String startText,
      required String endText,
      required IconData? icon}) {
    return Container(
      color: Color(0xFFFF6F6F6),
      // color: AppColors.drNotificationContainer,
      padding: EdgeInsets.only(
        left: 30.w,
        top: 17.h,
        bottom: 17.h,
        right: 40.w,
      ),
      child: Row(
        children: [
          TextCustom(
            text: startText,
            fontSize: 15,
            color: Color(0xFFAFAFAF),
          ),
          Spacer(),
          endText == ""
              ? Icon(
                  icon,
                  color: Color(0xffAFAFAF),
                  size: 25.sp,
                )
              : TextCustom(
                  text: endText,
                  fontSize: 15,
                  color: Color(0xFFAFAFAF),
                ),
          // TextCustom(
          //   text: endText,
          //   fontSize: 15,
          //   color: AppColors.drSettingText,
          // ),
        ],
      ),
    );
  }

  Widget _infoItem({required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextCustom(
          text: text,
        ),
        //SizedBox(width: 8.w),
        // Image.asset(
        //   'images/pin.png',
        //   width: 10.w,
        //   height: 10.h,
        // )
      ],
    );
  }
  CachedNetworkImage buildCachedNetworkImage({required String ImageUrl}) {
    return CachedNetworkImage(
        width: 130.w,
        height: 130.h,fit: BoxFit.cover,
        imageUrl: ImageUrl,
        placeholder: (context, url) =>Image.asset('images/loading.gif'),
        errorWidget: (context, url, error) => Image.asset('images/loading.gif')
    );
  }
}
