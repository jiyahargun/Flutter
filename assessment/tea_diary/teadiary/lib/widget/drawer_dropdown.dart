import 'package:flutter/material.dart';
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/screens/aboutus.dart';
import 'package:teadiary/screens/bill_histroty.dart';
import 'package:teadiary/screens/item_screen.dart';
import 'package:teadiary/screens/sellerscreen.dart';
import 'package:teadiary/screens/sellerwise_items.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.whiteColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: CustomColors.primaryColor),
            accountName: CircleAvatar(
              radius: 30,
              backgroundImage: const AssetImage("assets/splashscreen.png"),
            ),
            accountEmail: const Text(
              "Tea Diary",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _drawerItem(
                  context,
                  title: "Seller",
                  icon: Icons.people_alt_rounded,
                  screen: SellerScreen(),
                ),
                _drawerItem(
                  context,
                  title: "Item",
                  icon: Icons.coffee_rounded,
                  screen: ItemScreen(),
                ),
                _drawerItem(
                  context,
                  title: "Bill History",
                  icon: Icons.monetization_on_rounded,
                  screen: BillHistoryScreen(),
                ),
                _drawerItem(
                  context,
                  title: "Sellerwise Item List",
                  icon: Icons.person_pin,
                  screen: SellerwiseItemScreen(),
                ),
                _drawerItem(
                  context,
                  title: "About Us",
                  icon: Icons.info,
                  screen: AboutUsScreen(),
                ),
                const Divider(thickness: 0),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 12),
                  child: Text(
                    "Communicate",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                ListTile(
                  title: const Text("Share"),
                  leading: const Icon(Icons.share),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget screen,
  }) {
    return ListTile(
      title: Text(title, style: TextStyle(color: CustomColors.blackColor)),
      leading: Icon(icon, color: CustomColors.blackColor),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }
}

class AppDropdown<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool isExpanded;

  const AppDropdown({
    super.key,
    this.labelText,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: isExpanded,
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      dropdownColor: Colors.white,
      icon: const Icon(Icons.arrow_drop_down),
    );
  }
}
