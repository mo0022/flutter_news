import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({
  required this.title
  });


  final String title ;  

  
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        title ,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
