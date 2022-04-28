import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';

class GlassBoxItem extends StatelessWidget {
  final String title;
  final String amount;
  const GlassBoxItem({Key? key, required this.title, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white.withOpacity(.4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[800]),
          ).paddingOnly(left: 2.w, right: 1.w, top: 1.h, bottom: 0),
          Text(amount,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
              .paddingOnly(left: 2.w, right: 1.w, top: 1.h, bottom: 2.h)
        ]).paddingAll(15),
      ).asGlass(clipBorderRadius: BorderRadius.all(Radius.circular((2.5).h)));
}

class GlassBox extends StatelessWidget {
  final Widget child;
  const GlassBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white.withOpacity(.4),
        child: child.paddingAll(15),
      ).asGlass(clipBorderRadius: BorderRadius.all(Radius.circular((2.5).h)));
}
