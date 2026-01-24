import 'package:flutter/material.dart';
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/widget/appbar.dart';
import 'package:teadiary/widget/drawer_dropdown.dart';
import 'package:teadiary/widget/grid_view.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int teaCount = 0;
  num totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: Text(
          "Tea Diary",
          style: TextStyle(color: CustomColors.whiteColor),
        ),
        centerTitle: false,
        showLeading: true,
      ),

      drawer: AppDrawer(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  height: 200,
                  decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$teaCount", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 8),
                      Text("Tea/Coffee in January", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  height: 200,
                  decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("₹$totalAmount", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 8),
                      Text("Amount in January", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: DashboardGridView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primaryColor,
        child: Icon(Icons.share, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
