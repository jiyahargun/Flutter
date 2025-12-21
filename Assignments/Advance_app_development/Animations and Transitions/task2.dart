import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Expandable(),
    debugShowCheckedModeBanner: false,
  ));
}

class Expandable extends StatefulWidget {
  const Expandable({super.key});

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expandable')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              child: Text(_expanded ? 'Collapse' : 'Expand'),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expanded ? 100 : 0,
              width: 200,
              color: Colors.purpleAccent,
              alignment: Alignment.center,
              child: Center(
                child: Visibility(
                  visible: _expanded,
                  child: Text(
                    'hello jiya',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
