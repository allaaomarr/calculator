import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Color? color;
  final buttontapped;
  Button({required this.text,this.color = CupertinoColors.white, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return

     ClipRect(

        child: Container(

          height: 72,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: CupertinoColors.black,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.green

              )
            ]
          ),
          child: Center(child: TextButton(onPressed: buttontapped,
          child: Text(text,style: TextStyle(color: color,fontSize: 25),))),
        ),
      );

  }
}
