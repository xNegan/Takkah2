import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../provider_screens/problem/problem.dart';


class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);
  late BuildContext myContext;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  late BuildContext myContext;

  late Timer timer;
  TextEditingController messageController = TextEditingController();
  bool finsih = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFAFAFAF)),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            //size: 20.h,
          ),
        ),
        title: TextCustom(
          text: "الدردشة",
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Color(0xFFAFAFAF),
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Container(
                    width: 42.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("images/person.png"),
                  ),
                  Column(
                    children: [
                      TextCustom(
                        text: "محمد علي",
                        color: Color(0xFFA8A8A8),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        itemSize: 5.h,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xFFFDA000),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsetsDirectional.all(6),
                child: TextCustom(
                  text: "انتظر السداد",
                  color: Color(0xFFA8A8A8),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFBDBDBD),
                    ),
                    borderRadius: BorderRadius.circular(7.r)),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFFAFAFAF),
                        size: 24.h,
                      )),
                  // Image.asset("images/call.png"),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone_in_talk_outlined,
                        color: Color(0xFFAFAFAF),
                        size: 24.h,
                      )),

                  // IconButton(onPressed: (){
                  //
                  //   showMenu(context: context, items: [
                  //     "",
                  //     ""
                  //   ])
                  //
                  // }, icon: Icon(Icons.more_vert,color: Color(0xFFAFAFAF), size: 17.h,))

                  PopupMenuButton(

                      // add icon, by default "3 dot" icon
                      icon: Icon(
                        Icons.more_vert,
                        color: Color(0xFFAFAFAF),
                        size: 17.h,
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<int>(
                            onTap: () async {
                              await Future.delayed(Duration.zero);
                              dialog(context);
                            },
                            value: 0,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextCustom(
                                  text: "الغاء الطلب",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Color(0xFF707070),
                                ),
                                Icon(
                                  Icons.cancel_outlined,
                                  color: AppColors.maincolor,
                                  size: 14.h,
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 0,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextCustom(
                                  text: "تغيير المندوب",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Color(0xFF707070),
                                ),
                                // Image.asset("images/menu2.png")
                                Icon(
                                  Icons.sync_outlined,
                                  color: AppColors.maincolor,
                                  size: 14.h,
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            onTap: () async {
                              await Future.delayed(Duration.zero);
                            //  Get.to(Maps());
                            },
                            padding: EdgeInsets.all(10),
                            value: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextCustom(
                                  text: "تتبع الطلب",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Color(0xFF707070),
                                ),
                                // Image.asset("images/menu3.png")

                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.maincolor,
                                  size: 14.h,
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            onTap: () async {
                              await Future.delayed(Duration.zero);
                              Get.to(Problem());
                            },
                            value: 0,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextCustom(
                                  text: "رفع شكوى",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Color(0xFF707070),
                                ),
                                // Image.asset("images/menu4.png")
                                Icon(
                                  Icons.chat,
                                  color: AppColors.maincolor,
                                  size: 14.h,
                                )
                              ],
                            ),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        if (value == 0) {
                          print("My account menu is selected.");
                        } else if (value == 1) {
                          print("Settings menu is selected.");
                        } else if (value == 2) {
                          print("Logout menu is selected.");
                        }
                      }),
                ],
              )
            ],
          ),
          Visibility(
            visible: !finsih,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                  start: 12.w, end: 12.w, top: 9.h, bottom: 9.h),
              color: Color(0xFFF2F2F2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          text: "لديك 7 دقائق لالغاء الطلب او تغير المندوب",
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                        ),
                        Row(
                          children: [
                            TextCustom(
                              text: "ملاحظه:",
                              color: Color(0xFFEB5757),
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                            ),
                            TextCustom(
                              text:
                                  " 1 / الرجاء عدم التواصل خارج التطبيق.  2/ عدم تحويل اي مبلغ لحساب اخر",
                              color: Color(0xFF828282),
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: TextCustom(
                      text: "حاضر",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.maincolor,
                        minimumSize: Size(49.w, 25.h)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: Chat(
              messages: _messages,
              onAttachmentPressed: () {},
              onMessageTap: null,
              onPreviewDataFetched: null,
              onSendPressed: _handleSendPressed,
              showUserAvatars: true,
              showUserNames: true,
              user: _user,
              customBottomWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10.w, end: 10.w, bottom: 24.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // types.Message mess =  types.Message(
                            //      repliedMessage:
                            //      id: "23",
                            //      showStatus: true
                            //    );
                            _handleSendPressed(types.PartialText(
                                text: messageController.text));
                            messageController.text = "";
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.maincolor,
                                shape: BoxShape.circle),
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 17.h,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: TextField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                    hintText: 'اكتب رسالتك',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFB5B5B5),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                  onChanged: (value) {
                                    // types.TextMessage = "324";
                                  },
                                ),
                              ),
                              // TextCustom(text: "اكتب رسالتك"),
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Color(0xFFAFAFAF),
                                size: 22.w,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              theme: DefaultChatTheme(
                  // backgroundColor: Colors,
                  messageBorderRadius: 0,
                  inputBorderRadius: BorderRadius.circular(50),
                  inputPadding: EdgeInsets.zero,
                  inputTextColor: Color(0xFFB5B5B5),
                  inputBackgroundColor: Color(0xFFF9F9F9),
                  // inputMargin: EdgeInsets.zero,
                  attachmentButtonIcon: Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFFAFAFAF),
                  ),
                  attachmentButtonMargin: EdgeInsets.all(10)),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: messageController.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  _startTimer() {
    timer = Timer.periodic(Duration(minutes: 7), (timer) {
      setState(() {
        finsih = true;
      });
    });
  }

  dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Icon(
              Icons.warning_amber_outlined,
              size: 70.w,
              color: Colors.red,
            ),

            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
//         contentPadding: EdgeInsets.all(16),

            content: TextCustom(
              text: "هل تريد حذف الطلب ؟",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF434858),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Get.back(),
                child: TextCustom(
                    text: "نعم",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.maincolor,
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: TextCustom(
                    text: "الرجوع",
                    fontSize: 18,
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
}
