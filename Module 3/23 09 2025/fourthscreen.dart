import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fourthscreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Container
        (

          padding: EdgeInsets.only(left: 600.00),
          child: Row
            (
              children:
              [
                Text("Powered By Flutter",style: TextStyle(fontSize: 20.00),),
              ]


          )),
    );
  }

}