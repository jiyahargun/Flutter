import 'package:flutter/material.dart';
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/screens/bill_genrate.dart';
import 'package:teadiary/screens/bill_histroty.dart';
import 'package:teadiary/screens/item_screen.dart';
import 'package:teadiary/screens/new_order.dart';
import 'package:teadiary/screens/sellerscreen.dart';
import 'package:teadiary/screens/sellerwise_items.dart';

class DashboardGridView extends StatefulWidget {
  const DashboardGridView({super.key});

  @override
  State<DashboardGridView> createState() => _DashboardGridViewState();
}

class _DashboardGridViewState extends State<DashboardGridView> {
  final List<IconData> _iconList = [
    Icons.people_alt_rounded,
    Icons.coffee_rounded,
    Icons.person_pin,
    Icons.assignment_rounded,
    Icons.history_outlined,
    Icons.calculate_rounded
  ];

  final List<String> _titleList = [
    "Seller",
    "Item",
    "Sellerwise Item",
    "New Order",
    "Bill History",
    "Bill genrate"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: GridView.builder(
        itemCount: _titleList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _onGridTap(index),
            child: Container(
              decoration: BoxDecoration(color: CustomColors.whiteColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _iconList[index],
                    size: 30,
                    color: CustomColors.primaryColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _titleList[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onGridTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SellerScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ItemScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SellerwiseItemScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NewOrderScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BillHistoryScreen()),
        );
        break;

        case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BillGenerateScreen()),
        );
        break;
    }
  }
}
