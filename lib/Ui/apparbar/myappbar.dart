import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/notification.dart';

import '../homepage/Mainhome_page.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Padding(
      padding:EdgeInsets.only(top: mheight*0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:EdgeInsets.all(5.0),
            child: IconButton(onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Mainhome()), (route) => false);
                  }, icon:Icon(Icons.arrow_back_ios_new)),
          ),
          Spacer(),
          Padding(
            padding:EdgeInsets.only(right:mwidth*0.03),
            child: IconButton(onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Notification1()), (route) => false);
            }, icon:Icon(Icons.notifications)),
          ),
          Padding(
            padding:EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor:Colors.green,
              radius:16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}