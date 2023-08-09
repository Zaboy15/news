import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news/services/home_services.dart';

class HomeController extends GetxController {
  var home = [];
  final PageController pageViewController = PageController(initialPage: 0); //
  int activePage = 0;

  Widget createHeadline(var data) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/images/sample_headline.jpeg",
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 42.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                        Radius.circular(4.r),
                      )),
                      child: Text(
                        data['contributorName'] ?? "",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      width: 170.w,
                      height: 30.h,
                      child: Text(
                        data['title'] ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 30.sp),
                      ),
                    ),
                  ])),
        ],
      ),
    );
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    var response = await HomeServices().getHome();
    home = response['data'];
    print(home);

    update();
    super.onInit();
  }
}
