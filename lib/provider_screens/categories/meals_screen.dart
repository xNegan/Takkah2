
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../global_widgets/loading_data.dart';
import '../../uitls/storage_getX.dart';
import '../register_screens/register_screens_meals.dart';
import '../restaurant/restaurantGetx.dart';
import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../meals_details/meals_details_screen.dart';


class MealsScreen extends StatefulWidget {
 String idCatogery;


 MealsScreen({required this.idCatogery});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    restaurantGetx.to.getMealsList(idRestunalt:StorageGetX().restaurants.toString(), idCatogery: widget.idCatogery);
   // restaurantGetx.to.getMeal(idMenu: widget.idMenu.toString());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextCustom(text: "الوجبات", fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFFAFAFAF),),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color:  Color(0xFFAFAFAF),),
        ),

        elevation: 0,
      ),
      body: GetBuilder<restaurantGetx>(
        builder: (controller)=>  SingleChildScrollView(
          child:controller.isLoadmyMealsList?Center(child: LoadingData())
          :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 24.w,
                  end: 24.w
                ),
                child: SizedBox(
                 height: 42.h,
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search, color: AppColors.maincolor,),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(0xFFEBEBF1),
                        ),
                      ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5),
                       borderSide: BorderSide(
                         color: Color(0xFFEBEBF1),
                       ),
                     ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(0xFFEBEBF1),
                        ),
                      ),
                      contentPadding: EdgeInsetsDirectional.only(
                        start: 12.w,
                        top: 13.h,
                        bottom: 14.h
                      ),
                      hintText: "ابحث عن الوجبات...",
                      hintStyle: TextStyle(
                        color: Color(0xFFAFAFAF),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: controller.MealsList.length,
                  padding: EdgeInsetsDirectional.only(
                      start: 24.w,
                      end: 24.w,
                      top: 40.h,
                      bottom: 100.h
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 48.w,
                      mainAxisSpacing: 20.h
                  ),
                  itemBuilder: (context, index){
                    var meail=controller.MealsList.elementAt(index);

                    print(meail.drinks);
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.maincolor
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              InkWell(
                                onTap: (){Get.to(EditMealsScreen(meals: meail));},
                                child: Container(
                                  width: 18.w,
                                  height: 18.h,
                                  child: Icon(Icons.edit, color: Colors.white, size: 8.h,),
                                decoration: BoxDecoration(
                                  color: AppColors.maincolor,

                                  borderRadius: BorderRadius.circular(3)
                                ),
                                ),
                              ),

                              Container(
                                width: 18.w,
                                height: 18.h,
                                child: Icon(CupertinoIcons.delete, color: Colors.white, size: 8.h,),
                                decoration: BoxDecoration(
                                    color: AppColors.maincolor,

                                    borderRadius: BorderRadius.circular(3)
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){Get.to(MealsDetailsScreen(idMeail: meail.id.toString(),));},
                            child: Column(
                              children: [
                                Image.network(meail.image.toString(), width: 76.w, height: 76.h,fit: BoxFit.cover,),
                                //   Image.asset("images/grid1.png", width: 76.w, height: 76.h,),
                                SizedBox(height: 10.h,),
                                TextCustom(text: meail.name.toString(), fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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

                                TextCustom(text: "\$${meail.price.toString()}", fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black,),

                              ],
                            ),
                          )


                        ]
                        ,
                      ),
                    );
                  }),


              Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 24.w,
                      end: 49.w
                  ),
                  child: ElevatedButton(onPressed: () => Get.to(RegisterScreenMeals(categoryId: widget.idCatogery,tag: "",)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.h,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.maincolor,
                              ),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.add,size: 12.h, color: AppColors.maincolor,),
                        ),

                        SizedBox(width: 3.w,),
                        TextCustom(text: "اضف وجبة جديد",fontSize: 14.h, color: AppColors.maincolor),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        side: BorderSide(
                            color: AppColors.maincolor
                        ),
                        elevation: 0
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

