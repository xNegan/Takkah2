import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../../uitls/dialog/dialogs.dart';

class MapsOrderActiveDl extends StatefulWidget {
  @override
  _MapsOrderActiveDlState createState() => _MapsOrderActiveDlState();
}

enum PopupMenu { Problem }

class _MapsOrderActiveDlState extends State<MapsOrderActiveDl> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(24.774265, 46.738586);

  final Set<Marker> _markers = {
    Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(LatLng(24.492152, 39.612592).toString()),
      position: LatLng(24.492152, 39.612592),
      infoWindow: InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(LatLng(24.497150, 39.587169).toString()),
      position: LatLng(24.497150, 39.587169),
      infoWindow: InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
  };

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                  // border: Border.all(width: 1, color: AppColors.tkborder),
                  // borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xffF6F6F6)),
              child: Row(
                children: [
                  Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.linearToSrgbGamma(),
                          image: AssetImage(
                            'images/person.png',
                          )),
                    ),
                    // child: Image.asset('images/person.png')
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          text: 'محمد السيد',
                          fontSize: 15.sp,
                          color: AppColors.tkGreytxt,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        TextCustom(
                          text: 'رقم الطلب  #734535',
                          fontSize: 13.sp,
                          color: AppColors.tkGreytxt,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  ButtonApp(
                      fontSize: 17,
                      width: 130.w,
                      heigh: 40.h,
                      title: 'اصدار فاتوره',
                      onTap: () => Dialogs().invoice(context)),
                  // InkWell(
                  //   onTap: (){
                  //
                  //   },
                  //     child: Icon(Icons.more_vert,color: AppColors.drInActiveBnbIcon,))
                  _PopOutMenu()
                ],
              )),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(24.492152, 39.6125926),
              // target: LatLng(	24.492152, 39.6125926),
              // target: _center,
              zoom: 13.0,
            ),
            // initialCameraPosition: CameraPosition(
            //   target: LatLng(	24.492152, 39.6125926),
            //   // target: _center,
            //   zoom: 13.0,
            // ),
            mapType: _currentMapType,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,

            // onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: EdgeInsets.all(
              10.h,
            ),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: FloatingActionButton(
                onPressed: _onMapTypeButtonPressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: AppColors.maincolor,
                child: const Icon(Icons.change_circle_outlined, size: 36.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 80.h, start: 10.w, end: context.width * 0.8.w),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: InkWell(
                  onTap: () => Dialogs().calculater(context),
                  child: Row(
                    children: [
                      TextCustom(text: 'الحاسبه'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Icon(
                        Icons.calculate,
                        color: AppColors.maincolor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(13.sp),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Icon(
                        Icons.message,
                        color: AppColors.maincolor,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: ButtonApp(
                          title: "تم استلام الطلب",
                          fontSize: 16,
                          onTap: () => Dialogs().notifyDriver(context))),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      padding: EdgeInsets.all(13.sp),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Icon(
                        Icons.phone_in_talk,
                        color: AppColors.maincolor,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildContainer({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // height: 100.h,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r))),
        child: Column(
          children: [
            Icon(Icons.arrow_drop_up),
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 30.w, end: 30.w, bottom: 39.h, top: 27.h),
              padding: EdgeInsetsDirectional.only(
                  start: 125.w, end: 125.w, bottom: 13.h, top: 13.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.maincolor),
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              child: TextCustom(
                text: 'المندوب إستلم طلبك',
                fontSize: 14.sp,
                color: AppColors.maincolor,
              ),
            )
          ],
        ),
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

  Widget _PopOutMenu() {
    return PopupMenuButton<PopupMenu>(
      icon: Icon(
        Icons.more_vert,
        color: AppColors.tkGreytxt,
      ),
      offset: Offset(20.w, 40.h),
      elevation: 0,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0.r))),
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopupMenu>(
            value: PopupMenu.Problem,
            child: TextCustom(
              text: 'رفع شكوي',
              color: AppColors.lightBlack,
              fontSize: 14,
            ),
          ),
        ];
      },
      onSelected: (PopupMenu menu) {
        switch (menu) {
          case PopupMenu.Problem:
            // Get.to(NewAgenciesScreen());
            break;
        }
      },
    );
  }
}

class containerBottomSheet extends StatelessWidget {
  late String Title;
  late Color color;
  late bool showSucsesIcon;

  containerBottomSheet(
      {required this.Title, required this.color, required this.showSucsesIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 30.w, end: 30.w, top: 10.h),
      padding: EdgeInsetsDirectional.only(
          start: 10.w, end: 10.w, bottom: 13.h, top: 13.h),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Row(
        children: [
          TextCustom(
            text: Title,
            fontSize: 14.sp,
            color: color,
          ),
          Spacer(),
          showSucsesIcon
              ? SizedBox(
                  height: 20,
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                  ))
              : SizedBox(
                  height: 20,
                )
        ],
      ),
    );
  }
}
