import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/notification.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';

import '../homepage/Mainhome_page.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 20.rh(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Mainhome()), (route) => false);
                }, icon:const Icon(Icons.arrow_back_ios_new)),
          const Spacer(),
          Padding(
            padding:EdgeInsets.only(right:10.rw(context)),
            child: IconButton(onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Notification1()), (route) => false);
            }, icon:const Icon(Icons.notifications)),
          ),
        ],
      ),
    );
  }
}
