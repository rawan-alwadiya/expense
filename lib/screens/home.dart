import 'package:expense/data/data.dart';
import 'package:expense/models/constants.dart';
import 'package:expense/models/cost.dart';
import 'package:expense/models/type.dart';
import 'package:expense/screens/expense_details.dart';
import 'package:expense/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.expenses}) : super(key: key);
  final List<double>? expenses;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 10.h,
            leading: IconButton(
                onPressed: () {}, icon: Icon(Icons.settings_outlined,color: secondaryColor,)),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'My Budget',
                style: GoogleFonts.aBeeZee(
                  fontSize: 12.sp,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add_outlined,color: secondaryColor,)),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 2.h, left: 2.w, right: 2.w, bottom: 2.h),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3.h),
                    ),
                    child: Chart(expenses: weeklySpending),
                  );
                } else {
                  final ExpenseType type = typeNames[index - 1];
                  double amountSpent = 0;
                  type.expenses!.forEach((Cost expense) {
                    amountSpent += expense.cost!;
                  });
                  return _buildCategories(type, amountSpent);
                }
              },
              childCount: 1 + typeNames.length,
            ),
          ),
        ],
      ),
    );
  }

  _buildCategories(ExpenseType category, double amountSpent){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpenseDetails(expenseType: category,)));
      },
      child: Container(
        width: 100.w,
        height: 13.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name!,
                  style: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  '\$${(category.maxAmount! - amountSpent).toStringAsFixed(2)} / \$${category.maxAmount!.toStringAsFixed(2)}',
                  style: GoogleFonts.atma(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h,),
            LayoutBuilder(builder: (context, constraints){
              final double maxBarWidth = constraints.maxWidth;
              final double percentage = (category.maxAmount! - amountSpent) / category.maxAmount!;
              double width = percentage*maxBarWidth;
              if(width < 0){
                width =0;
              }
              return Stack(
                children: [
                  Container(
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.h),
                        bottomRight: Radius.circular(2.h),
                      ),
                    ),
                  ),
                  Container(
                    height: 3.h,
                    width: width,
                    decoration: BoxDecoration(
                      color: setColor(percentage),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.h),
                        bottomRight: Radius.circular(2.h),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
