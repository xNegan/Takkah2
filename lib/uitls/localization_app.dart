import 'package:get/get.dart';

class LocalizationApp implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': {
          'no attachments': 'No attachments',
          'open file': 'Open file',
          'launchTitle': "OFFERS",
          'launch': "LOGO",
          'languageEn': 'English language',
          'languageAr': 'Arabic language',
          'language': 'language',
          'Deactivate': 'Deactivate',
          'Logout': 'Logout',
          'NoData': 'No Data',
          'save': 'save',
          'Nationality': 'Nationality',
          'nameAr': 'Arabic name',
          'nameEn': 'English name',
          'success': 'Add Success',
          'sc': 'success',
          'failed': 'failed',
          'DeleteFailed': 'Delete failed',
          'company': 'Company',
          'sessionType': 'Session Type',
          'classification': 'Classification',
          'sessionDesc': 'Session Decision',
          'sessionPlace': 'Session Place',
          'roll': 'Roll Session',
          'kindwork': 'Kind Work',
          'Typework': 'Type Work',
          'contacts': 'Contacts',
          'resalt no data': 'Sorry, there are no matching data',
          'Addcontacts': 'Add Contacts',
          'coforimDelete': 'Are you sure to delete?',
          'conforim': 'Confirm',
          'cancel': 'Cancel',
          'update': 'Update',
          'delete': 'Delete',
          'Contacts': 'Contacts',
          'Files management': 'Files management',
          'dashboard': 'Dashboard',
          'administrativeWorks': 'Administrative Works',
          'Appointments': 'Appointments',
          'agencies': 'Agencies',
          'contracts': 'Contracts',
          'scheduleOfWork': 'Schedule Of Work',
          'reports': 'Reports',
          'DailyUpdates': 'Daily Updates',
          'Reminders': 'Reminders',
          'statistics': 'Statistics',
          'vision': 'Vision for law firm management',
          'appname': 'Vision',
          'main': 'Main',
          'search': 'Search',
          'profile': 'Profile',
          'loading': 'Loading  ...',
          /////////////////////////
          /// statistics screen///
          'files': 'Files',
          'stages': 'Stages',
          'sessions': 'Sessions',
          'accounts': 'Accounts',
          'work': 'Work',
          'delete done': 'Deleted successfully',
          'file status': 'File status',
          'file source': 'File Source',
          'file subject': 'File subject',
          'close type': 'Close type',
          'file meditor': 'File meditor',
          'file type': 'File type',

          'stage status': 'Stage status',
          'stage employee': 'Stage employee',
          'stage office': 'Stage office',
          'stage level': 'Stage level',
          'stage type': 'Stage type',
          'stage court': 'Stage court',
          'stage result': 'Stage result',

          'all': 'All',
          'monthly': 'Monthly',
          'yearly': 'Yearly',

          'session type': 'Session Type',
          'session employee': 'Session Employee',
          'session role': 'Session role',
          'session decision': 'Session decision',
          'session adjective': 'Session adjective',

          'account PV': 'Account PV',
          'account RV': 'Account RV',
          'account contract': 'Account contract',

          'work status': 'Work status',
          'work employee': 'Work employee',
          'work type': 'Work type',

          'total': 'Total',
          'choose date': 'Choose date',
          'date from': 'Date from',
          'date to': 'Date to',

          ////////////////////////
          /// Remembers Screen ///
          'reminders': 'Reminders',
          'clients': 'Clients',
          'employees': 'Employees',
          'excutes': 'Excutes',
          'warnings': 'Warnings',
          'works': 'Works',

          'end': 'End',
          'unstart': 'Unstart',
          'attachments': 'Attachments',

          'used': 'Used',
          'without agency': 'Without agency',
          'without contract': 'Without contract',
          'new file': 'New file',

          'passport': 'Passport',
          'id': 'Id',
          'driving license': 'Driving License',

          'contract end': 'Contract end',
          'new contract': 'new contract',
          'contract attachments': 'Contract Attachments',
          'contract payment': 'Contract payment',
          'contract stage': 'Contract stage',

          'documents': 'Documents',

          'duration': 'Duration',

          'session reminder': 'Session reminder',
          'session unrefresh': 'Session Unrefresh',
          'session replay': 'Session replay',
          'session attachments': 'session attachments',

          'duration end': 'Duration end',

          'work unrefresh': 'Work unrefresh',
          'work reminder': 'Work reminder',

          /////////////////////////////////////
          ////// Detail Remember Screen ///////

          'agency number': 'Agency number',
          'agency place': 'Agency place',
          'department name': 'Department name',
          'agency type': 'Agency type',
          'branch name': 'Branch name',
          'start date': 'Start date',
          'end date': 'End date',

          'empty': 'Empty',

          'stage number': 'Stage number',
          'client name': 'Client name',
          'opponents': 'Opponents',
          'subjects': 'Subjects',
          'stage subject': 'Stage subject',
          'last date': 'Last date',

          'nationality': 'Nationality',
          'id date': 'Id date',
          'id expiry': 'Id expiry',
          'residency number': 'Residency number',
          'sponsor name': 'Sponsor name',
          'passport date': 'Passport date',
          'passport expiry': 'Passport expiry',
          'license number': 'License number',
          'license expiry': 'License expiry',

          'contract number': 'Contract number',
          'contract date': 'Contract date',
          'contract amount': 'Contract amount',
          'contract start': 'Contract start',
          'contract ends': 'Contract end',

          'employee name': 'Employee name',
          'id number': 'Id number',
          'residency expiry': 'Residency expiry',

          'full name': 'Full name',
          'excute date': 'Excute date',
          'excute expiry': 'Excute expiry',
          'excute name': 'Excute name',
          'excute type': 'Excute type',
          'status': 'Status',
          'notes': 'Notes',
          'linke': 'Linke',
          'excute duration': 'Excute duration',

          'office name': 'Office name',
          'court name': 'Court name',
          'session place': 'Session place',
          'session subject': 'Session subject',
          'session date': 'Session date',

          'warning number': 'Warning number',
          'warning date': 'Warning date',
          'warning duration': 'Warning duration',
          'warning expiry': 'Warning expiry',
          'warning name': 'Warning name',
          'subject': 'Subject',

          'description': 'Description',
          'status date': 'Status date',
          'case number': 'Case number',
          'work kind': 'Work kind',

          //////////////////////////////////
          ///////  Daily update screen ////

          'daily updates': 'Daily updates',
          'view updates': 'View updates',

          ///////////////////////////////////////////
          ///////  view sessions & works screen ////

          'administrative works': 'Administrative works',
          'no sessions for this day': 'No sessions for this day',
          'no administrative works for this day':
              'No administrative works for this day',
          'file number': 'File number',
          'lawsuit number': 'Lawsuit number',
          'lawsuit type': 'Lawsuit type',
          'case': 'Case',
          'court': 'Court',
          'client name and nickname': 'Client name\nand nickname',
          'opponent name and nickname': 'Opponent name\nand nickname',
          'previous session': 'Previous session',

          'work cause': 'Work cause',
          'creator': 'Creator',
          'assigned': 'Assigned',
          'last date to excute': 'Last date to excute',
          'requirment': 'Requirment',
          'new': 'New',
          'print': 'Print',

          ///////////////////////////////////////////
          /////// Main Reports Screen ////////////////

          'files reports': 'File reports',
          'cases reports': 'Cases reports',
          'sessions reports': 'Sessions reports',
          'warnings reports': 'Warnings reports',
          'excutes reports': 'Excutes reports',
          'announcement reports': 'Announcement reports',

          ///////////////////////////////////////////
          /////// File Reports Screen ////////////////

          'file followers': 'File followers',
          'subject details': 'Subject details',
          'file open date': 'File open date',
          'file close date': 'File close date',

          ///////////////////////////////////////////
          /////// Stage Reports Screen ////////////////

          'last session date and decision': 'last session\ndate and decision',
          'next session date': 'Next session date',
          'file details': 'File details',

          ///////////////////////////////////////////
          /////// jalsat Reports Screen ////////////////

          'stage': 'Stage',
          'current session decision': 'Current session\ndecision',
          'next session': 'Next session',
          'link': 'Link',

          ///////////////////////////////////////////
          /////// Warning Reports Screen ////////////////

          'number': 'Number',
          'register date': 'Register date',
          'announcment date': 'Announcment date',

          ///////////////////////////////////////////
          /////// Excutes Reports Screen ////////////////

          'search result': 'Search result',
          'client': 'Client',
          'date': 'Date',
          'excute status': 'Excute status',
          'excute': 'Excute',

          ///////////////////////////////////////////
          /////// Informing Reports Screen ////////////////

          'no added announcments': 'No added announcments',
          'announcment number': 'Announcment\nnumber',
          'announcment classification': 'Announcment\nclassification',
          'announcment type': 'Announcment type',
          'announcment status': 'Announcment\nstatus',
          'announcment follower': 'Announcment\nfollower',

          ///////////////////////////////////////////
          ////////// Calender Screen ////////////////

          'schedule of works': 'schedule of works',
          'schedule': 'schedule',
          'no works for this day': 'no works for this day',
          'from': 'from',
          'to': 'to',

          ///////////////////////////////////////////
          ////////// Contracts Screen ////////////////

          'agreement number': 'Agreement number',
          'agreement date': 'Agreement date',
          'agreement amount': 'Agreement amount',
          'agreement type': 'Agreement type',
          'case contract': 'Case contract',
          'consultation contract': 'Consultation contract',
          'filters': 'Filters',
          'cases contracts': 'Cases contracts',
          'consultation contracts': 'Consultation contracts',
          'consultation & cases contracts': 'Consultation & cases contracts',
          'unattached contracts': 'Unattached contracts',

          ///////////////////////////////////////////
          ////////// Agencies Screen ////////////////

          'barcode': 'Barcode',
          'certification number': 'Certification number',
          'department': 'Department',
          'place': 'Place',
          'clients position': 'Clients position',
          'print date': 'Print date',
          'ends in a month': 'Ends in a month',
          'ended in closed files': 'Ended in closed files',
          'ended in open files': 'Ended in open files',
          'unattached': 'Unattached',

          ///////////////////////////////////////////
          ////////// Appointments Screen ////////////

          'appointments': 'Appoinments',
          'add new appointment': 'Add new appointment',
          'are you sure you want to delete this appointment':
              'Are you sure you want to delete this appointment',
          'appointment cause': 'Appointment cause',

          ///////////////////////////////////////////
          //////////   Add Appointment  ////////////

          'time': 'Time',
          'select client name': 'Select client name',
          'select appointment cause': 'Select appointment cause',
          'select the assigned': 'Select the assigned',
          'save new appointment': 'Save new appointment',
          'edit appointment': 'Edit appointment',
          'save changes': 'Save changes',

          ///////////////////////////////////////////
          ////////// administrative works////////////

          'do you want to delete this work': 'Do you want to delete this work',
          'work date': 'Work date : ',

          //////////////////////////////////////////////////
          ////////// administrative works details////////////

          'administrative work': 'Administrative work',
          'work relate': 'Work relate',
          'assigned name': 'Assigned name',
          'create date': 'Create date',

          //////////////////////////////////////////////////
          /////////////////  Files Screen /////////////////

          'sort files by': 'Sort files by',
          'files managment': 'Files managment',
          'sorry, no exact matches found': 'Sorry, no exact matches found',

          //////////////////////////////////////////////////
          /////////////////  Files Categories /////////////////
          'file information': 'File information',
          'cases': 'Cases',

          //////////////////////////////////////////////////
          //////////  Admin Files Information ///////////////

          'file classification': 'File classification',
          'open date': 'Open date',
          'close date': 'Close date',
          'close cause': 'Close cause',
          'second party': 'Second party',
          'commercial broker': 'Commercial broker',
          'assigned office': 'Assigned office',
          'case source': 'Case source',
          'claim amount': 'Claim amount',
          'name': 'Name',
          'adjective': 'adjective',
          'followers': 'Followers',

          //////////////////////////////////////////////////
          /////////////Admin Sessions screen ///////////////

          'add new session': 'Add new session',
          'no sessions added': 'No sessions added',
          'do you want to delete this session':
              'Do you want to delete this session ?',
          'type': 'Type',

          //////////////////////////////////////////////////
          ///////////// Admin Sessions Information //////////

          'file number sessions': 'File number sessions',
          'session time': 'Session time',
          'required to attend': 'Required to attend',
          'court role': 'Court role',
          'attend session': 'Attend session',
          'decision details': 'Decision details',
          'judgment': 'Judgment',
          'parties': 'Parties',
          'judgment amount': 'Judgment amount',
          'auto reminder for respond': 'Auto reminder for respond',
          'attachment reminder': 'Attachment reminder',
          'last session': 'Last session',

          //////////////////////////////////////////////////
          ///////////// Admin Sessions Information //////////

          'edit session': 'Edit session',
          'choose session': 'Please choose the name of the case',
          'choose session type': 'Please select a session type',
          'select case name': 'Select case name',
          'select session type': 'Select session type',
          'choose a session decision': 'Select a session decision',
          'select the seesion attend': 'Select the seesion attend',
          'select session place': 'Select session place',
          'select court role': 'Select court role',
          'response date': 'Response date',

          //////////////////////////////////////////////////
          ///////////// Work admin general /////////////////

          'add new administrative work': 'Add new administrative work',
          'no administrative works added': 'No administrative works added',
          'no works for this day': 'No works for this day',

          //////////////////////////////////////////////////
          //////////////////// Add Work ////////////////////

          'select work type': 'Select work type',
          'select work relate': 'Select work relate',
          'report': 'Report',
          'select the report': 'Select the report',
          'no added reports': 'No added reports',
          'select the excute': 'Select the excute',
          'no excutes added': 'No excutes added',
          'warning': 'Warning',
          'select warning': 'Select warning',
          'no warnings added': 'No warnings added',
          'select case': 'Select case',
          'no cases added': 'No cases added',
          'select session': 'Select session',
          'session requirments': 'Session requirments',
          'select session requirments': 'Select session requirments',

          //////////////////////////////////////////////////
          //////////////////// Add Work ////////////////////

          'edit administrative work': 'Edit administrative work',
          'select work cause': 'Select work cause',
          'select report': 'Select report',
          'cause': 'Cause',

          ///////////////////////////////////////////////////////
          //////////////////// Qaddaya Screen ////////////////////

          'case status': 'Case status',
          'more': 'More',

          ///////////////////////////////////////////////////////
          //////////////// Qaddaya File Number //////////////////

          'case evaluators': 'Case evaluators',
          'main case': 'Main case',
          'cases of relation': 'Cases of relation',
          'year': 'Year',
          'report number': 'Report number',
          'case type': 'Case type',
          'the judge': 'The judge',
          'case follower': 'Case follower',
          'case result': 'Case result',

          ///////////////////////////////////////////////////////
          //////////////// Add Contact /////////////////////////

          'add new contact': 'Add new contact',
          'select contact type': 'Select contact type',
          'choose a classification type': 'Choose a classification type',
          'select nationality': 'Select nationality',
          'phone number': 'Phone number',
          'mobile number': 'Mobile number',
          'fax number': 'Fax number',
          'email': 'Email',
          'address': 'Address',
          'id expiry date': 'Id expiry date',
          'unified number': 'Unified number',
          'passport number': 'Passport number',
          'passport release date': 'Passport release date',
          'passport expiry date': 'Passport expiry date',
          'select company': 'Select company',
          'tax number': 'Tax number',
          'id release date': 'Id release date',

          'edit contact': 'Edit contact',
          'license expiry date': 'License expiry date',

          'client type': 'Client type',
          'classification': 'Classification'
        },

        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///-----------------------   SPACER   -------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///
        ///------------------------------------------------------------///

        'ar': {
          'no attachments': 'لا يوجد مرفقات',
          'open file': 'فتح الملف',
          'launchTitle': "عروض",
          'launch': "LOGO",
          'languageEn': 'اللغة الإنجليزية',
          'languageAr': 'الغة العربية',
          'language': 'اللغة',
          'Deactivate': 'إلغاء التفعيل',
          'Logout': 'تسجيل الخروج',
          'NoData': 'لا يوجد بيانات',
          'save': ' حفظ ',
          'Nationality': 'الجنسية',
          'nameAr': 'الإسم',
          'nameEn': 'الإسم بالإنجليزية',
          'success': 'تم الإضافة بنجاح',
          'sc': 'نجاح',
          'failed': 'فشل',
          'DeleteFailed': 'فشلت عملية الحذف',
          'company': 'الشركة',
          'sessionType': 'نوع الجلسة',
          'sessionDesc': 'قرار الجلسة',
          'sessionPlace': 'مكان الجلسة',
          'roll': 'رول الجلسة',
          'kindwork': 'إرتباط العمل',
          'Typework': 'نوع العمل',
          'contacts': 'جهات الإتصال',
          'resalt no data': 'عذرا لا يوجد بيانات مطابقة',
          'Addcontacts': 'إضافة جهة اتصال جديدة',
          'coforimDelete': 'هل متاكد من الحذف ؟',
          'conforim': 'تأكيد',
          'cancel': 'الغاء',
          'update': 'تعديل',
          'delete': 'حذف',
          'Contacts': 'جهات الإتصال',
          'Files management': 'إدارة الملفات',
          'dashboard': 'لوحة التحكم',
          'administrativeWorks': 'أعمال إدارية',
          'Appointments': 'المواعيد',
          'classification': 'التصنيف',
          'agencies': 'الوكالات',
          'contracts': 'العقود',
          'scheduleOfWork': 'جدول الأعمال',
          'reports': 'التقارير',
          'DailyUpdates': 'تحديثات اليومية',
          'Reminders': 'التذكيرات',
          'statistics': 'الإحصائيات',
          'vision': 'فيجن لإدارة مكاتب المحاماة',
          'appname': 'فيجن',

          'main': 'الرئيسية',
          'search': 'بحث',
          'profile': 'بروفايل',
          'loading': 'جاري التحميل ...',

          /// statistics screen///
          'files': 'ملفات',
          'stages': 'قضايا',
          'sessions': 'جلسات',
          'accounts': 'حسابات',
          'work': 'اعمال',

          'file status': 'حالة الملف',
          'file source': 'مصدر الملف',
          'file subject': 'عنوان الملف',
          'close type': 'نوع الغلق',
          'file meditor': 'وسيط الملف',
          'file type': 'نوع الملف',

          'stage status': 'حالة القضية',
          'stage employee': 'موظف القضية',
          'stage office': 'مكتب القضية',
          'stage level': 'مرحلة القضية',
          'stage type': 'نوع القضية',
          'stage court': 'محكمة القضية',
          'stage result': 'نتيجة القضية',

          'all': 'الكل',
          'monthly': 'شهري',
          'yearly': 'سنوي',

          'session type': 'نوع الجلسة',
          'session employee': 'موظف الجلسة',
          'session role': 'دور الجلسة',
          'session decision': 'قرار الجلسة',
          'session adjective': 'صفة الجلسة',

          'account PV': 'الحساب PV',
          'account RV': 'الحساب RV',
          'account contract': 'عقد الحساب',

          'work status': 'حالة العمل',
          'work employee': 'موظف العمل',
          'work type': 'نوع العمل',

          'total': 'الاجمالي',
          'choose date': 'اختر التاريخ',
          'date from': 'التاريخ من',
          'date to': 'التاريخ الى',

          ////////////////////////
          /// Remembers Screen ///
          'reminders': 'تذكيرات',
          'clients': 'الموكلين',
          'employees': 'الموظفين',
          'excutes': 'اجراءات',
          'warnings': 'تحذيرات',
          'works': 'اعمال',

          'end': 'منتهية',
          'unstart': 'لم تبدا',
          'attachments': 'مرفقات',

          'used': 'مستخدم',
          'without agency': 'بدون وكالة',
          'without contract': 'بدون عقد',
          'new file': 'ملف جديد',

          'passport': 'جواز السفر',
          'id': 'الهوية',
          'driving license': 'رخصة القيادة',

          'contract end': 'عقد منتهي',
          'new contract': 'عقد جديد',
          'contract attachments': 'مرفقات العقد',
          'contract payment': 'دفعات العقد',
          'contract stage': 'قضية العقد',

          'documents': 'الوثائق',

          'duration': 'المدة',

          'session reminder': 'تذكير الجلسة',
          'session unrefresh': 'جلسات غير محدثة',
          'session replay': 'جلسات معادة',
          'session attachments': 'مرفقات الجلسة',

          'duration end': 'المدة المنتهية',

          'work unrefresh': 'اعمال غير محدثة',
          'work reminder': 'تذكير الاعمال',

          /////////////////////////////////////
          ////// Detail Remember Screen ///////

          'agency number': 'رقم الوكالة',
          'agency place': 'مكان الوكالة',
          'department name': 'اسم القسم',
          'agency type': 'نوع الوكالة',
          'branch name': 'اسم الفرع',
          'start date': 'تاريخ البدء',
          'end date': 'تاريخ الانتهاء',

          'empty': 'فارغ',

          'stage number': 'رقم القضية',
          'client name': 'اسم العميل',
          'opponents': 'الخصوم',
          'subjects': 'المواضيع',
          'stage subject': 'موضوع القضية',
          'last date': 'اخر تاريخ',

          'nationality': 'الجنسية',
          'id date': 'تاريخ الهوية',
          'id expiry': 'انتهاء الهوية',
          'residency number': 'رقم الاقامة',
          'sponsor name': 'اسم الكفيل',
          'passport date': 'تاريخ جواز السفر',
          'passport expiry': 'انتهاء جواز السفر',
          'license number': 'رقم الرخصة',
          'license expiry': 'انتهاء الرخصة',

          'contract number': 'رقم العقد',
          'contract date': 'تاريخ العقد',
          'contract amount': 'قيمة العقد',
          'contract start': 'بداية العقد',
          'contract ends': 'انتهاء العقد',

          'employee name': 'اسم الموظف',
          'id number': 'رقم الهوية',
          'residency expiry': 'انتهاء الاقامة',

          'full name': 'الاسم الكامل',
          'excute date': 'تاريخ الاجراء',
          'excute expiry': 'انتهاء الاجراء',
          'excute name': 'اسم الاجراء',
          'excute type': 'نوع الاجراء',
          'status': 'الحالة',
          'notes': 'ملاحظات',
          'linke': 'الرابط',
          'excute duration': 'مدة الاجراء',

          'office name': 'اسم المكتب',
          'court name': 'اسم المحكمة',
          'session place': 'مكان الجلسة',
          'session subject': 'موضوع الجلسة',
          'session date': 'تاريخ الجلسة',

          'warning number': 'رقم الانذار',
          'warning date': 'تاريخ الانذار',
          'warning duration': 'مدة الانذار',
          'warning expiry': 'انتهاء الانذار',
          'warning name': 'اسم الانذار',
          'subject': 'الموضوع',

          'description': 'الوصف',
          'status date': 'تاريخ الحالة',
          'case number': 'رقم المرحلة', //review later
          'work kind': 'تصنيف العمل',

          //////////////////////////////////
          ///////  Daily update screen ////

          'daily updates': 'تحديثات يومية',
          'view updates': 'اظهار التحديثات',

          ///////////////////////////////////////////
          ///////  view sessions & works screen ////

          'administrative works': 'اعمال ادارية',
          'no sessions for this day': 'لا يوجد جلسات لهذا اليوم',
          'no administrative works for this day': 'لا يوجد اعمال ادارية لهذا اليوم',
          'no works for this day': 'لا يوجد أعمال لهذا اليوم',
          'file number': 'رقم الملف',
          'lawsuit number': 'رقم الدعوة',
          'lawsuit type': 'نوع الدعوة',
          'case': 'القضية',
          'court': 'المحكمة',
          'client name and nickname': 'اسم الموكل وصفته',
          'opponent name and nickname': 'اسم الخصم وصفته',
          'previous session': 'الجلسة السابقة',

          'work cause': 'سبب العمل',
          'creator': 'المنشأ',
          'assigned': 'المكلف',
          'last date to excute': 'اخر موعد للتنفيذ',
          'requirment': 'المطلوب',
          'new': 'جديد',
          'print': 'طباعة',

          ///////////////////////////////////////////
          /////// Main Reports Screen ////////////////

          'files reports': 'تقارير الملفات',
          'cases reports': 'تقارير القضايا',
          'sessions reports': 'تقارير الجلسات',
          'warnings reports': 'تقارير الانذارات',
          'excutes reports': 'تقارير الاجراءات',
          'announcement reports': 'تقارير البلاغات',

          ///////////////////////////////////////////
          /////// File Reports Screen ////////////////

          'file followers': 'متابعين الملف',
          'subject details': 'تفاصيل الموضوع',
          'file open date': 'تاريخ فتح الملف',
          'file close date': 'تاريخ اغلاق الملف',

          ///////////////////////////////////////////
          /////// Stage Reports Screen ////////////////

          'last session date and decision': 'تاريخ وقرار اخر جلسة',
          'next session date': 'تاريخ الجلسة القادمة',
          'file details': 'تفاصيل الملف',

          ///////////////////////////////////////////
          /////// jalsat Reports Screen ////////////////

          'stage': 'المرحلة',
          'current session decision': 'قرار الجلسة الحالية',
          'next session': 'الجلسة القادمة',
          'link': 'الرابط',

          ///////////////////////////////////////////
          /////// Warning Reports Screen ////////////////

          'number': 'الرقم',
          'register date': 'تاريخ التسجيل',
          'announcment date': 'تاريخ الاعلان',

          ///////////////////////////////////////////
          /////// Excutes Reports Screen ////////////////

          'search result': 'نتائج البحث',
          'client': 'العميل',
          'date': 'التاريخ',
          'excute status': 'حالة الاجراء',
          'excute': 'الاجراء',

          ///////////////////////////////////////////
          /////// Informing Reports Screen ////////////////

          'no added announcments': 'لا يوجد بلاغات مضافة',
          'announcment number': 'رقم البلاغ',
          'announcment classification': 'تصنيف البلاغ',
          'announcment type': 'نوع البلاغ',
          'announcment status': 'حالة البلاغ',
          'announcment follower': 'متابع البلاغ',

          ///////////////////////////////////////////
          ////////// Calender Screen ////////////////

          'schedule of works': 'جدول الاعمال',
          'schedule': 'الجدول',
          'no works for this day': 'لا يوجد اعمال لهذا اليوم',
          'from': 'من',
          'to': 'الى',

          ///////////////////////////////////////////
          ////////// Contracts Screen ////////////////

          'agreement number': 'رقم الاتفاقية',
          'agreement date': 'تاريخ الاتفاقية',
          'agreement amount': 'مبلغ الاتفاقية',
          'agreement type': 'نوع الاتفاقية',
          'case contract': 'عقد قضية',
          'consultation contract': 'عقد استشارة',
          'filters': 'الفلترة',
          'cases contracts': 'عقود قضايا',
          'consultation contracts': 'عقود استشارة',
          'consultation & cases contracts': 'عقود قضايا واستشارات',
          'unattached contracts': 'عقود غير مرفقة',

          ///////////////////////////////////////////
          ////////// Agencies Screen ////////////////

          'barcode': 'الباركود',
          'certification number': 'رقم التصديق',
          'department': 'الفرع',
          'place': 'المكان',
          'clients position': 'صفة الموكلين',
          'print date': 'تاريخ الطباعة',
          'ends in a month': 'تنتهي في شهر',
          'ended in closed files': 'منتهية في ملفات مغلقة',
          'ended in open files': 'منتهية في ملفات مفتوحة',
          'unattached': 'غير مرفقة',

          ///////////////////////////////////////////
          ////////// Appointments Screen ////////////

          'appointments': 'المواعيد',
          'add new appointment': 'اضافة موعد جديد',
          'are you sure you want to delete this appointment':
              'هل تريد حذف هذا الموعد',
          'appointment cause': 'سبب الموعد',

          ///////////////////////////////////////////
          //////////   Add Appointment  ////////////

          'time': 'الوقت',
          'select client name': 'اختر اسم العميل',
          'select appointment cause': 'اختر سبب الموعد',
          'select the assigned': 'اختر المكلف',
          'save new appointment': 'حفظ موعد جديد',
          'edit appointment': 'تعديل الموعد',
          'save changes': 'حفظ التعديلات',

          ///////////////////////////////////////////
          ////////// administrative works////////////

          'do you want to delete this work': 'هل تريد حذف هذا العمل ؟',
          'work date': 'تاريخ العمل : ',
          'delete done': 'تم الحذف بنجاح',

          //////////////////////////////////////////////////
          ////////// administrative works details////////////

          'administrative work': 'عمل اداري',
          'work relate': 'ارتباط العمل',
          'assigned name': 'اسم المكلف',
          'create date': 'تاريخ الانشاء',

          //////////////////////////////////////////////////
          /////////////////  Files Screen /////////////////

          'sort files by': 'تصنيف الملفات حسب',
          'files managment': 'ادارة الملفات',
          'sorry, no exact matches found': 'عذرا, لا يوجد نتائج بحث مطابقة',

          //////////////////////////////////////////////////
          /////////////////  Files Categories /////////////////
          'file information': 'معلومات الملف',
          'cases': 'قضايا',

          //////////////////////////////////////////////////
          //////////  Admin Files Information ///////////////

          'file classification': 'تصنيف الملف',
          'open date': 'تاريخ الفتح',
          'close date': 'تاريخ الاغلاق',
          'close cause': 'سبب الاغلاق',
          'second party': 'الطرف الثاني',
          'commercial broker': 'الوسيط التجاري',
          'assigned office': 'المكتب المكلف',
          'case source': 'مصدر القضية',
          'claim amount': 'قيمة المطالبة',
          'name': 'الاسم',
          'adjective': 'الصفة',
          'followers': 'المتابعين',

          //////////////////////////////////////////////////
          /////////////Admin Sessions screen ///////////////
          'add new session': 'اضافة جلسة جديدة',
          'choose session': 'الرجاء قم باختيار اسم القضية',
          'no sessions added': 'لا يوجد جلسات مضافة',
          'do you want to delete this session': 'هل تريد حذف هذه الجلسة ؟',
          'type': 'النوع',

          //////////////////////////////////////////////////
          ///////////// Admin Sessions Information //////////

          'file number sessions': 'جلسات الملف رقم',
          'session time': 'وقت القضية',
          'required to attend': 'المكلف بالحضور',
          'court role': 'رول المحكمة',
          'attend session': 'حضر الجلسة',
          'decision details': 'تفاصيل القرار',
          'judgment': 'الحكم',
          'parties': 'الاطراف',
          'judgment amount': 'مبلغ الحكم',
          'auto reminder for respond': 'تذكير تلقائي بالرد',
          'attachment reminder': 'تذكير بالمرفقات',
          'last session': 'الجلسة الاخيرة',

          //////////////////////////////////////////////////
          ///////////// Admin Sessions Information //////////

          'edit session': 'تعديل الجلسة',
          'select case name': 'اختر اسم القضية',
          'select session type': 'اختر نوع الجلسة',
          'required to attend': 'اختر حاضر الجلسة',
          'select session place': 'اختر مكان الجلسة',
          'select court role': 'اختر رول المحكمة',
          'choose a session decision': 'اختر قرار الجلسة',
          'response date': 'تاريخ الرد',
          /////////////////////////////////////////////
          /////////////////add session///////////////


          //////////////////////////////////////////////////
          ///////////// Work admin general /////////////////

          'add new administrative work': 'اضافة عمل اداري جديد',
          'no administrative works added': 'لا يوجداعمال ادارية مضافة',

          //////////////////////////////////////////////////
          //////////////////// Add Work ////////////////////

          'select work type': 'اختر نوع العل',
          'select work relate': 'اختر ارتباط العمل',
          'report': 'البلاغ',
          'select the report': 'اختر البلاغ',
          'no added reports': 'لا يوجد بلاغات مضافة',
          'select the excute': 'اختر الاجراء',
          'no excutes added': 'لا يوجد اجراءات مضافة',
          'warning': 'انذار',
          'select warning': 'اختر الانذار',
          'no warnings added': 'لا يوجد انذارات مضافة',
          'select case': 'اختر القضية',
          'no cases added': 'لا يوجد قضايا مضافة',
          'select session': 'اختر الجلسة',
          'session requirments': 'متطلبات الجلسة',
          'select session requirments': 'اختر متطلبات الجلسة',

          //////////////////////////////////////////////////
          //////////////////// Add Work ////////////////////

          'edit administrative work': 'تعديل العمل الاداري',
          'select work cause': 'اختر سبب العمل',
          'select report': 'اختر البلاغ',
          'cause': 'السبب',

          ///////////////////////////////////////////////////////
          //////////////////// Qaddaya Screen ////////////////////
          'case status': 'حالة القضية',
          'more': 'المزيد',
          ///////////////////////////////////////////////////////
          //////////////// Qaddaya File Number //////////////////

          'case evaluators': 'مقيمون القضية',
          'main case': 'القضية الاساسية',
          'cases of relation': 'قضايا الارتباط',
          'year': 'السنة',
          'report number': 'رقم البلاغ',
          'case type': 'نوع القضية',
          'the judge': 'القاضي',
          'case follower': 'متابع القضية',
          'case result': 'نتيجة القضية',

          ///////////////////////////////////////////////////////
          //////////////// Add Contact /////////////////////////

          'add new contact': 'اضافة جهة اتصال',
          'select contact type': 'اختر نوع جهة الاتصال',
          'choose a classification type': 'اختر نوع التصنيف',
          'select nationality': 'اختر الجنسية',
          'phone number': 'رقم الهاتف',
          'mobile number': 'رقم الجوال',
          'fax number': 'رقم الفاكس',
          'email': 'البريد الالكتروني',
          'address': 'العنوان',
          'id expiry date': 'تاريخ انتهاء الهوية',
          'unified number': 'الرقم الموحد',
          'passport number': 'رقم جواز السفر',
          'passport release date': 'اصدار جواز السفر',
          'passport expiry date': 'انتهاء جواز السفر',
          'select company': 'اختر الشركة',
          'tax number': 'الرقم الضريبي',
          'id release date': 'تاريخ اصدار الهوية',

          'edit contact': 'تعديل جهة الاتصال',
          'license expiry date': 'تاريخ انتهاء الرخصة',

          'client type': 'نوع العميل',
          'classification': 'التصنيف'
        },
      };
}
