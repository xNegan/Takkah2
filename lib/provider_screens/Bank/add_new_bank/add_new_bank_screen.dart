
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../global_widgets/text_custom.dart';
import '../../../uitls/app_colors.dart';
import '../controller/BankController.dart';


class AddNewBankScreen extends StatefulWidget {
  const AddNewBankScreen({Key? key}) : super(key: key);

  @override
  State<AddNewBankScreen> createState() => _AddNewBankScreenState();
}

class _AddNewBankScreenState extends State<AddNewBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextCustom(text: "اضافة بنك", fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFFAFAFAF),),
        leading: IconButton(
          onPressed: (){Get.back();},
          icon: Icon(Icons.arrow_back_ios, color:  Color(0xFFAFAFAF),),
        ),

        elevation: 0,
      ),

      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: 37.w,
          end: 34.w,
          top: 45.h
        ),
        children: [
          Form(
            child: Column(
              children: [
                TextField(
                  controller: BankGetx.to.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xFFE8E8E8),
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
                        color: Color(0xFFE8E8E8),
                      ),
                    ),
                    hintText: "اسم المستخدم",
                    hintStyle: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                SizedBox(height: 20.h,),
                TextField(
                  controller: BankGetx.to.iban,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xFFE8E8E8),
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
                        color: Color(0xFFE8E8E8),
                      ),
                    ),
                    hintText: "رقم الحساب",
                    hintStyle: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),

                TextField(
                  controller: BankGetx.to.mobile,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xFFE8E8E8),
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
                        color: Color(0xFFE8E8E8),
                      ),
                    ),
                    hintText: "رقم الجوال",
                    hintStyle: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 40.h ,),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 12.w,
              end: 12.w
            ),
            child: ElevatedButton(onPressed: (){
              BankGetx.to.addBank();
            }, child: TextCustom(text: "حفظ", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white,),
            style: ElevatedButton.styleFrom(
              primary: AppColors.maincolor,
              minimumSize: Size(double.infinity, 55.h),
            ),),
          )

        ],
      ),
    );
  }
}
