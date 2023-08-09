import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'utils/template_binding.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: TemplateBinding(),
        home: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: false,
            splitScreenMode: false,
            builder: (context, _) {
              return HomePage();
            }),
      ),
    ),
  );
}
