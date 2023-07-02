import 'package:expense/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class VerticalBar extends StatelessWidget {
   VerticalBar({
    Key? key,
    required this.day,
    required this.spentAmount,
    required this.expensive,
  }) : super(key: key);

  final String day;
  final double spentAmount;
  final double expensive;
  final _maxVerticalHeight=20.h;

  @override
  Widget build(BuildContext context) {
    final barHeight =spentAmount / expensive * _maxVerticalHeight;
    return Column(
      children: [
        Text('\$${spentAmount.toStringAsFixed(2)}',style: GoogleFonts.aubrey(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        ),
        SizedBox(height: 1.0.h,),
        Container(
          height: barHeight,
          width: 3.w,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(1.h),
          ),
        ),
        SizedBox(height: 1.0.h,),
        Text(day,style: GoogleFonts.abel(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        ),
      ],
    );
  }
}