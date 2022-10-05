
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../api_getX.dart';
import '../../../api_settings.dart';
import '../../../preferences/user_preferences.dart';
import '../../register_screens/register_screen.dart';
import '../models/categories.dart';
import '../models/driver.dart';
import '../models/nationality.dart';
import '../models/user.dart';
import '../statusAcoount.dart';
class CreateAccountController extends GetxController{

  static CreateAccountController get to => Get.find();

 // For stores
  TextEditingController? ownerNameController;
  TextEditingController? ownerPhoneNumberController;
  TextEditingController? passwordController;
  TextEditingController? employerPhoneNumberController;
  TextEditingController? casherPhoneNumberController;
  TextEditingController? mangerPhoneNumberController;
  TextEditingController? storeNameController;
  TextEditingController? storeEmailController;
  TextEditingController? pinCodeController;
  TextEditingController? logoController;
  TextEditingController? startDateController;
  TextEditingController? endDateController;
  TextEditingController? imageController;

  // For Delivery

  TextEditingController? fullNameController;
  TextEditingController? nationaltyController;
  TextEditingController? ageController;
  TextEditingController? phoneNumberController;
  TextEditingController? IDNumberController;
  TextEditingController? emailController;
  TextEditingController? pinController;
  TextEditingController? idFrontImageController;
  TextEditingController? personalImageController;
  TextEditingController? drivingLicenseController;
  TextEditingController? vehicleLicenseController;

//

  bool isLoading = true;
  String? carTypeSelected;
  Nationality? nationatlitySelected;
  // int? iDNationatlitySelected;

  GlobalKey<FormState> keyFormStore =  GlobalKey<FormState>();
  GlobalKey<FormState> keyFormDelivery =  GlobalKey<FormState>();

    DateTime? commercial_registry_start , commercial_registry_end;
   XFile? logo, commercial_registry_image, idFrontImage,
  personalImage,
  drivingLicense,
  vehicleLicense;
   final ImagePicker _pickerLogo = ImagePicker();
   final ImagePicker _pickerCommercialRegistryImage = ImagePicker();
   final ImagePicker _pickerIDFrontImage = ImagePicker();
   final ImagePicker _pickerPersonalImage = ImagePicker();
   final ImagePicker _pickerDrivingLicense = ImagePicker();
   final ImagePicker _pickerVehicleLicense = ImagePicker();
   String? formattedDateStart,  formattedDateEnd;

   int index = -1;
   String? pathLogo, pathConnericalRegImage;
 int? categoryId;

 double? latiude, lngtuide;
 List<Categories> categories = <Categories>[];
 List<Nationality> natioliteis = <Nationality>[];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
    getNationalites();
    ownerNameController = TextEditingController();
    ownerPhoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    employerPhoneNumberController = TextEditingController();
    casherPhoneNumberController = TextEditingController();
    mangerPhoneNumberController = TextEditingController();
    storeNameController = TextEditingController();
    storeEmailController = TextEditingController();
    pinCodeController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    logoController = TextEditingController();
    imageController = TextEditingController();
    commercial_registry_start = DateTime.now();
    commercial_registry_end = DateTime.now();


    fullNameController = TextEditingController();
    nationaltyController = TextEditingController();
    ageController = TextEditingController();
    phoneNumberController = TextEditingController();
    IDNumberController = TextEditingController();
    emailController = TextEditingController();
    pinController = TextEditingController();
    idFrontImageController = TextEditingController();
    personalImageController = TextEditingController();
    drivingLicenseController = TextEditingController();
    vehicleLicenseController = TextEditingController();


  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // for store
    ownerNameController!.dispose();
    ownerPhoneNumberController!.dispose();
    passwordController!.dispose();
    employerPhoneNumberController!.dispose();
    casherPhoneNumberController!.dispose();
    mangerPhoneNumberController!.dispose();
    storeNameController!.dispose();
    storeEmailController!.dispose();
    pinCodeController!.dispose();


    // for delivery
    fullNameController!.dispose();
    nationaltyController!.dispose();
    ageController!.dispose();
    phoneNumberController!.dispose();
    IDNumberController!.dispose();
    emailController!.dispose();
    pinController!.dispose();
    idFrontImageController!.dispose();
    personalImageController!.dispose();
    drivingLicenseController!.dispose();
    vehicleLicenseController!.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    // for store
    ownerNameController!.dispose();
    ownerPhoneNumberController!.dispose();
    passwordController!.dispose();
    employerPhoneNumberController!.dispose();
    casherPhoneNumberController!.dispose();
    mangerPhoneNumberController!.dispose();
    storeNameController!.dispose();
    storeEmailController!.dispose();
    pinCodeController!.dispose();


    // for delivery
    fullNameController!.dispose();
    nationaltyController!.dispose();
    ageController!.dispose();
    phoneNumberController!.dispose();
    IDNumberController!.dispose();
    emailController!.dispose();
    pinController!.dispose();
    idFrontImageController!.dispose();
    personalImageController!.dispose();
    drivingLicenseController!.dispose();
    vehicleLicenseController!.dispose();
  }

  bool checkFormStoreAccount() {
    final isValid = keyFormStore.currentState!.validate();
    print(isValid);
    if (!isValid) {
      print("not valid");
      return false;
    }else{
      keyFormStore.currentState!.save();
      print("Ready");
      createStoreAccount();
      return true;
    }

    // saveToShared();
  }


  bool checkFormDeliveryAccount() {
    final isValid = keyFormDelivery.currentState!.validate();
    print(isValid);
    if (!isValid) {
      print("not valid");
      return false;
    }else{
      keyFormDelivery.currentState!.save();
      print("Ready");
      createDeliveryAccount();
      return true;
    }

    // saveToShared();
  }
Future<Categories?> getCategoriesFromApi() async{
    isLoading = true;
    update();
  var url = Uri.parse(ApiSetting.categories);
  var response = await http.get(url,);
  print(response.statusCode);
  var jsonResponse  = jsonDecode(response.body);
  print(jsonResponse);
  if (response.statusCode == 200) {
    var jsonResponse  = jsonDecode(response.body);
    print(response.statusCode);
    print(jsonResponse.runtimeType);
    print(jsonResponse);
    // List<Categories> list = jsonResponse.map((e) =>Categories.fromJson(e)).toList() as List<Categories>;
    isLoading = false;
    update();
    return Categories.fromJson(jsonResponse);
  }else{
    isLoading = false;
    update();
    return null;
  }
}

  Future<Nationality?> getNationalityFromApi() async{
    var url = Uri.parse(ApiSetting.baseUrl + "constants?key=NATIONALITY");
    var response = await http.get(url,);
    print(response.statusCode);
    var jsonResponse  = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      var jsonResponse  = jsonDecode(response.body);
      print(response.statusCode);
      print(jsonResponse.runtimeType);
      print(jsonResponse);
      // List<Categories> list = jsonResponse.map((e) =>Categories.fromJson(e)).toList() as List<Categories>;

      return Nationality.fromJson(jsonResponse);
    }else{

      return null;
    }
  }


void getCategories() async {
    Categories? cat = await getCategoriesFromApi();
    categories.add(cat!);
    update();
  }

  void getNationalites() async {
   // Nationality? nationality = await getNationalityFromApi();
   // natioliteis.add(nationality!);
    update();
  }
pickLogo() async{
  final XFile? image = await _pickerLogo.pickImage(source: ImageSource.gallery);
  if(image != null){
    logo = image;
    pathLogo = image.path;
    logoController!.text = image.path;
    update();
  }
}
  pickPersonalImage() async{
    final XFile? image = await _pickerPersonalImage.pickImage(source: ImageSource.gallery);
    if(image != null){
      personalImage = image;
      // pathLogo = image.path;
      personalImageController!.text = image.path;
      update();
    }
  }
  pickID() async{
    final XFile? image = await _pickerIDFrontImage.pickImage(source: ImageSource.gallery);
    if(image != null){
      idFrontImage = image;
      // pathLogo = image.path;
      idFrontImageController!.text = image.path;
      update();
    }
  }

  pickDrivingLicense() async{
    final XFile? image = await _pickerDrivingLicense.pickImage(source: ImageSource.gallery);
    if(image != null){
      drivingLicense = image;
      // pathLogo = image.path;
      drivingLicenseController!.text = image.path;
      update();
    }
  }


  pickVehicleLicense() async{
    final XFile? image = await _pickerVehicleLicense.pickImage(source: ImageSource.gallery);
    if(image != null){
      vehicleLicense = image;
      // pathLogo = image.path;
      vehicleLicenseController!.text = image.path;
      update();
    }
  }


  pickCommercialRegistry() async{
    final XFile? image = await _pickerCommercialRegistryImage.pickImage(source: ImageSource.gallery);
    if(image != null){
      commercial_registry_image = image;
      pathConnericalRegImage = image.path;
      imageController!.text = image.path;

      update();
    }
  }


  Future<void> selectDateStart(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: commercial_registry_start!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != commercial_registry_start) {
      commercial_registry_start = picked;
      formattedDateStart  = DateFormat('yyyy-MM-dd').format(commercial_registry_start!);
startDateController!.text =  formattedDateStart!;
    update();
    }
  }

  Future<void> selectDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: commercial_registry_end!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != commercial_registry_end) {
      commercial_registry_end = picked;
      formattedDateEnd = DateFormat('yyyy-MM-dd').format(commercial_registry_end!);
endDateController!.text = formattedDateEnd!;
      update();
    }
  }

selectCategory({required int currentIndex, required int id}){
    index = currentIndex;
    categoryId = id;
    update();
}
  void createStoreAccount() async {

    try {
      ApiGetX.to.onLoading(isShow: true);
    // showAlertDialog(context, "Uploading Property. Please wait...");

    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiSetting.createAccountResurant),
    );
    Map<String, String> headers = {'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'};

    // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
    // JSON_UNESCAPED_UNICODE
    request.headers.addAll(headers);
    request.fields
        .addAll({"mobile" : ownerPhoneNumberController!.text});

    request.fields
        .addAll({"name" : ownerNameController!.text});
    request.fields
        .addAll({"email" : storeEmailController!.text});
    request.fields
        .addAll({"category_id" : categoryId.toString()});
    request.fields
        .addAll({"owner_name" : ownerPhoneNumberController!.text});
    request.fields
        .addAll({"owner_phone" : ownerPhoneNumberController!.text});
    request.fields
        .addAll({"employee_phone" : ownerPhoneNumberController!.text});
    request.fields
        .addAll({"casher_phone" : ownerPhoneNumberController!.text});
    request.fields
        .addAll({"manger_phone" : ownerPhoneNumberController!.text});
    request.fields
        .addAll({"manger_phone" : ownerPhoneNumberController!.text});


    request.files.add(await http.MultipartFile.fromPath(
      'logo', logo!.path,
       ));
    request.files.add(await http.MultipartFile.fromPath(
      'commercial_registry_image', commercial_registry_image!.path,
    ));
    var res = await request.send();

    print('Response:: $res');
    if(res.statusCode == 200){
      print(res);
      print(res.statusCode);
      // print("This is response:" + res.toString());
      final respStr = await res.stream.bytesToString();
      List<User> values = [];
      // print(respStr);

      User user  = User.fromJson(jsonDecode(respStr));
   //   User user  = User.fromJson(jsonDecode(respStr));
      if(user != null){
        ApiGetX.to.onLoading(isShow: false);
        UserPreferences().saveStore(user);
       print("ID:: ${user.data!.id}");
     //   print("ID:: ${user.data!.token}");
        Get.to(StatusAcount());
        // Get.showSnackbar(GetSnackBar(
        //   title: "تم التسجيل بنجاح",
        //   message: "تم التسجيل بنجاح",
        //   backgroundColor: Colors.green,
        // ));
      }
    }else{
      ApiGetX.to.onLoading(isShow: false);
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();

      print(jsonDecode(respStr));
      ApiGetX.to.showDialogFailed(Title: 'خطأ في ادخال البيانات');
      // Get.showSnackbar(GetSnackBar(
      //   title: "خطأ في ادخال البيانات",
      //   message: "خطأ في ادخال البيانات",
      //   backgroundColor: Colors.red,
      // ));
    }

  // // print(map["fileUrl"]);
    // print(res.statusCode);
    // print("RESPONSE:: $map");

  }catch (error) {
      // EasyLoading.dismiss();
      //  displayDialog(error);
      print(error);
      return null;
    }}

    void createDeliveryAccount() async {


    // showAlertDialog(context, "Uploading Property. Please wait...");

    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiSetting.createAccountDelivery),
    );
    Map<String, String> headers = {'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'};

    // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
    // JSON_UNESCAPED_UNICODE
    request.headers.addAll(headers);
    request.fields
        .addAll({"mobile" : jsonEncode(phoneNumberController!.text)});

    request.fields
        .addAll({"name" : jsonEncode(ownerNameController!.text)});
    request.fields
        .addAll({"email" : jsonEncode(storeEmailController!.text)});
    request.fields
        .addAll({"nationality_id" : jsonEncode(nationatlitySelected!.data!.first.id)});
    request.fields
        .addAll({"car_type" : jsonEncode(carTypeSelected)});
    request.fields
        .addAll({"age" : jsonEncode(ageController!.text)});
    request.fields
        .addAll({"identity_number" : jsonEncode(IDNumberController!.text)});
    // request.fields
    //     .addAll({"type" : jsonEncode("DRIVER")});
    request.files.add(await http.MultipartFile.fromPath(
      'identity_number_image', idFrontImage!.path,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'image', personalImage!.path,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'driving_license', drivingLicense!.path,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'vehicle_license', vehicleLicense!.path,
    ));
    var res = await request.send();

    if(res.statusCode == 200){
      print(res);
      print(res.statusCode);
      // print("This is response:" + res.toString());
      final respStr = await res.stream.bytesToString();
      List<User> values = [];
      // print(respStr);

      Driver user  = Driver.fromJson(jsonDecode(respStr));
      if(user != null){
        UserPreferences().saveDriver(user);
        Get.to(StatusAcount());
        Get.showSnackbar(GetSnackBar(
          title: "تم التسجيل بنجاح",
          message: "تم التسجيل بنجاح",
          backgroundColor: Colors.green,
        ));
      }
    }else{
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();


      print(jsonDecode(respStr));
      Get.showSnackbar(GetSnackBar(
        title: "خطأ في ادخال البيانات",
        message: "خطأ في ادخال البيانات",
        backgroundColor: Colors.red,
      ));
    }

    // // print(map["fileUrl"]);
    // print(res.statusCode);
    // print("RESPONSE:: $map");
  }
  Future<bool> updateLocation() async{

    print( UserPreferences().getTokenStore());
    print("From update");
    var url = Uri.parse(ApiSetting.updatelocation);
    var response = await http.post(url, body: {
      "latitude": latiude.toString(),
      "longitude": lngtuide.toString(),
    },
    headers: {
      "Authorization" : UserPreferences().getTokenStore(),
    }

    );
    print("Store Token::: ${UserPreferences().getTokenStore()}");
    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      Get.snackbar("نجاح", "تم حفظ الموقع بنجاح",backgroundColor: Colors.green);
      Get.offAll(RegisterScreen());
      return true;
    }
    Get.snackbar("خطآ ", "خطأ في حفظ بيانات الموقع",backgroundColor: Colors.red);
    return false;
  }





}