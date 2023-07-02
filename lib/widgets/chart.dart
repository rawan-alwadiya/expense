import 'package:expense/models/constants.dart';
import 'package:expense/widgets/vertical_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key,required this.expenses}) : super(key: key);
  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive=0;

    expenses.forEach((double price){
      if(price > mostExpensive){
        mostExpensive=price;
      }
    });
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: Column(
        children: [
          Text('Weekly Spending',style: GoogleFonts.abel(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
            letterSpacing: 1.0,
          ),
          ),
          SizedBox(height: 1.0.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.arrow_back_ios),
              ),
              Text(
                'Jan 1, 2023 - Jan 8, 2023',
                style: GoogleFonts.atma(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          SizedBox(height: 1.0.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VerticalBar(
                day: 'Sunday',
                spentAmount: expenses[0],
                expensive: mostExpensive,
              ),
              VerticalBar(
                day: 'Monday',
                spentAmount: expenses[1],
                expensive: mostExpensive,
              ),
              VerticalBar(
                day: 'Tuesday',
                spentAmount: expenses[2],
                expensive: mostExpensive,
              ),
              VerticalBar(
                day: 'Wednesday',
                spentAmount: expenses[3],
                expensive: mostExpensive,
              ),
              VerticalBar(
                day: 'Thursday',
                spentAmount: expenses[4],
                expensive: mostExpensive,
              ),
              VerticalBar(
                day: 'Friday',
                spentAmount: expenses[5],
                expensive: mostExpensive,
              ),
              VerticalBar(
                day: 'Saturday',
                spentAmount: expenses[6],
                expensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
