import 'package:flutter/material.dart';
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/widget/appbar.dart';

class BillGenerateScreen extends StatefulWidget {
  const BillGenerateScreen({super.key});

  @override
  State<BillGenerateScreen> createState() => _BillGenerateScreenState();
}

class _BillGenerateScreenState extends State<BillGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: Text(
          "Billing",
          style: TextStyle(color: CustomColors.whiteColor),
        ),
        centerTitle: false,
        showLeading: false,
      ),

      body: Scaffold(
        appBar: AppBar(
          title: Text('Invoice Details'),
          actions: [
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
            IconButton(icon: Icon(Icons.print), onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice #12345',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Invoice Date: jan 14, 2026'),
                  Text('Due Date: feb , 2025'),
                ],
              ),
              Divider(),

              // Sender and Receiver Details
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Your Company Name'),
                        Text('123 Business Rd'),
                        Text('City, State, Zip'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Bill To:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Client Name'),
                        Text('456 Client St'),
                        Text('Client City, State, Zip'),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),

              Text(
                'Items:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product A'),
                      Text('2 x \$50.00'),
                      Text('\$100.00'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service B'),
                      Text('1 x \$150.00'),
                      Text('\$150.00'),
                    ],
                  ),
                ),
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Subtotal:'), Text('\$250.00')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Tax (8%):'), Text('\$20.00')],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand Total:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '\$270.00',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Divider(),

              Text('Payment Terms: Net 15 days'),
              Text('Thank you for your business!'),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primaryColor,
        onPressed: () {},
        child: Icon(Icons.save, color: CustomColors.whiteColor),
      ),
    );
  }
}
