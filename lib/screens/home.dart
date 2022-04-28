import 'package:flutter/material.dart';
import 'package:handson/widgets/nav.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/home_controller.dart';
import '../widgets/glass_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var noSimbolInUSFormat =
      new NumberFormat.currency(locale: "en_US", decimalDigits: 0, symbol: "");
  String format(num v) {
    return noSimbolInUSFormat.format(v).replaceAll(",", " ");
  }

  final PageController pageController = PageController();
  final List pageItem = [
    {
      "image": "assets/images/star.png",
      "title": "Entertainment Budget Is Running Out",
      "body": "You can increase your budget"
    },
    {
      "image": "assets/images/star.png",
      "title": "Entertainment Budget Is Running Out",
      "body": "You can increase your budget"
    },
    {
      "image": "assets/images/star.png",
      "title": "Entertainment Budget Is Running Out",
      "body": "You can increase your budget"
    }
  ];

  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() {
    Future.delayed(Duration(seconds: 5), () {
      Provider.of<HomeController>(context, listen: false).shuffle();
    });
  }

  @override
  Widget build(BuildContext context) => Consumer<HomeController>(
        builder: (context, controller, widget) => Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    // color: Colors.transparent,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                      Colors.grey[300]!,
                      Colors.grey[200]!,
                    ],
                        stops: [
                      0,
                      1
                    ])),
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Align(
                            alignment: Alignment.center,
                            child: Lottie.asset(
                                    "assets/images/wave_anim.dart.json")
                                .withSize(width: 70.w, height: 50.h))),
                    SafeArea(
                        child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GlassBoxItem(
                                title: 'Monthly Budget',
                                amount:
                                    '+ € ${format(controller.savings.monthlyBudget.round())}',
                              ).expand(),
                              SizedBox(width: 2.w),
                              GlassBoxItem(
                                title: 'Your Savings',
                                amount:
                                    '€ ${format(controller.savings.savings.round())}',
                              ).expand()
                            ]),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Balance',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey[800])),
                                RichText(
                                  text: TextSpan(
                                    text: '€ ',
                                    style: TextStyle(
                                        fontFamily: 'DMSans',
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              "${format(controller.savings.totalBalance.round())}",
                                          style: TextStyle(
                                              fontSize: 29.sp,
                                              fontWeight: FontWeight.bold)),
                                      //TextSpan(text: ' world!'),
                                    ],
                                  ),
                                )
                              ],
                            ).expand(),
                            ElevatedButton(
                              onPressed: () => null,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.w))),
                                primary: Colors.grey[900],
                                minimumSize: Size(20.w, 12.h),
                                // maximumSize: Size(.w, 5.h)
                              ),
                              child: Icon(Icons.arrow_forward_outlined,
                                  color: Colors.white),
                            )
                          ],
                        ).paddingOnly(top: 4.h, left: 1.h, right: 1.h),
                        Container().expand(),
                        Container(
                            alignment: Alignment.centerRight,
                            child: GlassBoxItem(
                                    title: "Today",
                                    amount: " + € ${format(controller.savings.today)}")
                                .paddingSymmetric(
                              vertical: 2.h,
                            )),
                        // Container().expand(),
                        GlassBox(
                            child: Stack(children: [
                          PageView.builder(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              controller: pageController,
                              itemCount: pageItem.length,
                              itemBuilder: (context, index) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(pageItem[index]['image'])
                                          .withSize(width: 40.sp, height: 40.sp)
                                          .paddingOnly(left: 3.w, top: 2.h),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(pageItem[index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold))
                                              .paddingBottom(1.h),
                                          Text(
                                            pageItem[index]['body'],
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.grey[800]),
                                          )
                                        ],
                                      ).paddingAll(5.sp).flexible()
                                    ],
                                  )),
                          Positioned.fill(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SmoothPageIndicator(
                                    controller: pageController,
                                    count: pageItem.length,
                                    axisDirection: Axis.vertical,
                                    effect: ExpandingDotsEffect(
                                        dotHeight: 1.w,
                                        activeDotColor: Colors.grey[900]!,
                                        dotWidth: 1.h),
                                  )))
                        ])).paddingBottom(2.h).expand(flex: 2),
                        Nav(selectedIndex: 0)
                      ],
                    )).paddingOnly(left: 5.w, right: 5.w, top: 2.h),
                  ],
                ).paddingBottom(MediaQuery.of(context).padding.bottom))),
      );
}
