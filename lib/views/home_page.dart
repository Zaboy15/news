import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/controllers/home_controller.dart';
import 'package:news/views/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          height: 50.h,
          child: Image.asset(
            "assets/images/logo_celeb.png",
          ),
        ),
      ),
      body: GetBuilder<HomeController>(
          builder: (controller) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 350.h,
                      child: controller.home.isNotEmpty
                          ? PageView.builder(
                              controller: controller.pageViewController,
                              onPageChanged: (int index) {
                                controller.activePage = index;
                                controller.update();
                              },
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 3) return null;
                                return controller
                                    .createHeadline(controller.home[index]);
                              })
                          : Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                controller.pageViewController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                                print(controller.activePage);
                                controller.update();
                              },
                              child: Container(
                                width: controller.activePage == index ? 80 : 50,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.activePage == index
                                      ? Colors.pink.shade100
                                      : Colors.grey.shade300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Divider(
                            height: 10,
                            color: Colors.pink,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text(
                            "LATEST NEWS",
                            style: TextStyle(fontSize: 30.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Divider(
                            height: 10,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.5,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: controller.home.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, i) => GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: 164.w,
                                  height: 400.h,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Image.asset(
                                          "assets/images/sample_headline.jpeg",
                                        ),
                                      ),
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Container(
                                                  width: 42.w,
                                                  height: 18.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                    Radius.circular(4.r),
                                                  )),
                                                  child: Text(
                                                    controller.home[i][
                                                            'contributorName'] ??
                                                        "",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    controller.home[i]
                                                            ['title'] ??
                                                        "",
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Container(
                                                  width: 170.w,
                                                  height: 30.h,
                                                  child: Text(
                                                    DateTime.now()
                                                            .difference(DateTime
                                                                    .parse(controller
                                                                            .home[i]
                                                                        [
                                                                        'createdAt']) ??
                                                                DateTime.now())
                                                            .inMinutes
                                                            .toString() +
                                                        " Menit lalu",
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Divider(
                                                  height: 20,
                                                  color: Colors.pink,
                                                ),
                                              ])),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                    ),
                  ],
                ),
              )),
    );
  }
}
