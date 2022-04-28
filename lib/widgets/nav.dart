import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';

class Nav extends StatelessWidget {
  final EdgeInsets? padding;
  final double? gap;
  final int selectedIndex;
  final void Function(int)? onTabChange;
  const Nav(
      {Key? key,
      required this.selectedIndex,
      this.gap,
      this.onTabChange,
      this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
    color: Colors.white.withOpacity(.5),
    child: GNav(tabs: [
        GButton(
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp)
          ),
          gap: gap,
          iconActiveColor: Colors.white,
          iconColor: Colors.black,
          textColor: Colors.white,
          backgroundColor: Colors.grey[900]!,
          iconSize: 20.sp,
          padding: padding ?? EdgeInsets.all(15.sp),
          textStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            color:Colors.white
          ),
          icon: LineIcons.home,
          leading: Image.asset("assets/images/home.png",
          fit: BoxFit.contain).withSize(
            width: 20.sp,
            height: 20.sp
          ),
          text: ' Home',
        ),
        GButton(
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp)
          ),
          gap: gap,
          iconActiveColor: Colors.white,
          iconColor: Colors.black,
          textColor: Colors.white,
          backgroundColor: Colors.grey[900]!,
          iconSize: 20.sp,
          padding: padding ?? EdgeInsets.all(15.sp),
          textStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            color:Colors.white
          ),
          icon: LineIcons.home,
          leading: Image.asset("assets/images/settings.png",
          fit: BoxFit.contain).withSize(
            width: 20.sp,
            height: 20.sp
          ),
          text: ' Settings',
        ),
        GButton(
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp)
          ),
          gap: gap,
          iconActiveColor: Colors.white,
          iconColor: Colors.black,
          textColor: Colors.white,
          backgroundColor: Colors.grey[900]!,
          iconSize: 20.sp,
          padding: padding ?? EdgeInsets.all(15.sp),
          textStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            color:Colors.white
          ),
          icon: LineIcons.home,
          leading: Image.asset("assets/images/tag.png",
          fit: BoxFit.contain).withSize(
            width: 20.sp,
            height: 20.sp
          ),
          text: ' Tags',
        ), GButton(
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp)
          ),
          gap: gap,
          iconActiveColor: Colors.white,
          iconColor: Colors.black,
          textColor: Colors.white,
          backgroundColor: Colors.grey[900]!,
          iconSize: 20.sp,
          padding: padding ?? EdgeInsets.all(15.sp),
          textStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            color:Colors.white
          ),
          icon: LineIcons.home,
          leading: Image.asset("assets/images/users.png",
          fit: BoxFit.contain).withSize(
            width: 20.sp,
            height: 20.sp
          ),
          text: ' Users',
        ),
      ], selectedIndex: selectedIndex, onTabChange: onTabChange).paddingAll(8)).cornerRadiusWithClipRRect(20.sp).asGlass();
}
