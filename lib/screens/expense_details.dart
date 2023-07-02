import 'package:expense/models/constants.dart';
import 'package:expense/models/cost.dart';
import 'package:expense/models/type.dart';
import 'package:expense/widgets/circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ExpenseDetails extends StatefulWidget {
  final ExpenseType? expenseType;
  const ExpenseDetails({Key? key, this.expenseType}) : super(key: key);

  @override
  State<ExpenseDetails> createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  @override
  Widget build(BuildContext context) {
    double amountSpent = 0;
    widget.expenseType!.expenses!.forEach((Cost expense) {
      amountSpent += expense.cost!;
    });
    final double amountLeft = widget.expenseType!.maxAmount! - amountSpent;
    final double percentage = amountLeft / widget.expenseType!.maxAmount!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,size: 24,color: secondaryColor,),
        ),
        title: Text(
          widget.expenseType!.name!,
          style: GoogleFonts.aBeeZee(
            fontSize: 12.sp,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.add_outlined,color: secondaryColor,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              padding: EdgeInsets.all(2.h),
              height: 35.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(2.h),
              ),
              child: CustomPaint(
                foregroundPainter: CirclePainter(
                  bgColor: Colors.grey.shade200,
                  lineColor: setColor(percentage),
                  percentage: percentage,
                  width: 5.w,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)} / \$${widget.expenseType!.maxAmount}',
                    style: GoogleFonts.aubrey(
                      fontWeight: FontWeight.w500,
                      color: secondaryColor,
                      fontSize: 21.sp,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenseList(),
          ],
        ),
      ),
    );
  }

  _buildExpenseList() {
    List<Widget> expenseList = [];
    widget.expenseType!.expenses!.forEach((Cost expense) {
      expenseList.add(
        Container(
          width: 100.w,
          height: 20.h,
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(2.h),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expense.name!,
                  style: GoogleFonts.atma(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1.0),
                ),
                Text(
                  '\$${expense.cost!.toStringAsFixed(2)}',
                  style: GoogleFonts.atma(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                      letterSpacing: 2.0),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: expenseList,
    );
  }
}
