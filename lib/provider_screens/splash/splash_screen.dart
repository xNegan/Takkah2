import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../delivery_screens/main_screen_dl.dart';
import '../../uitls/storage_getX.dart';
import '../Auth/loginAs.dart';
import '../main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      StorageGetX.isLogin?RouteMain()
          :
      Get.offAll(LginAS());
    });
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFFA9C21),
              Color(0xFFC05501),

            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("images/splachicon.png", width: 200),
                  SizedBox(height: 10),
                  //Text('َتكه | Takkah'),
                  Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Takkah | ',style:  TextStyle(  fontSize: 40, color:Colors.white,),
                      ),
                      Text('تكة',style:  TextStyle(  fontSize: 40, color:Colors.white,),
                      ),


                    ],),

                ],
              )

            ),
            SizedBox(height: context.height/4),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_sharp,color: Colors.white,size: 20,),
                Text(' !اطلب الي بخاطرك',style:  TextStyle(  fontSize: 20, color:Colors.white,),
                ),

              ],
            ),
            SizedBox(height: context.height*0.05),
          ],
        ),
      )
      );
  }
  void RouteMain(){
    if(StorageGetX.Type=='RESTAURANT'){Get.offAll(MainScreen());}
    if(StorageGetX.Type=='DRIVER'){Get.offAll(MainScreenDl());}
    if(StorageGetX.Type=='USER'){}
  }
}
