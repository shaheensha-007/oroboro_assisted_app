
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:oroboro_assisted_app/Ui/LOAN/Loan_detalis/pendding.dart';


import '../../apparbar/myappbar.dart';
import 'Rejected.dart';
import 'in-process.dart';

class Loan_detalis extends StatefulWidget {
  const Loan_detalis({super.key});

  @override
  State<Loan_detalis> createState() => _Loan_detalisState();
}


class _Loan_detalisState extends State<Loan_detalis> {
  int _selectedIndex = 0;

  int position = 0;

 List<Widget>screen=[Pendding(),Inprocess(),Rejected()];

  void onpresedbutton(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title:MyAppbar() ,
      ) ,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mheight*0.1,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: Text("Loan Details",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.05,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: _selectedIndex==0?Color(0xff284389): Color(0xffD9D9D9),
                    ),onPressed: (){
                      setState(() {
                        position=0;
                        onpresedbutton(0);
                      });
                    }, child:Text("Pending",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color:_selectedIndex == 0 ? Colors.white : Colors.black,fontFamily: "regulartext"),)),
                    Spacer(),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: _selectedIndex==1?Color(0xff284389): Color(0xffD9D9D9),
                    ),onPressed: (){
                      position=1;
                      onpresedbutton(1);
                    }, child:Text("In- Process",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color: _selectedIndex == 1 ? Colors.white : Colors.black,fontFamily: "regulartext"),)),
                    Spacer(),
                    Padding(
                      padding:EdgeInsets.only(right: mwidth*0.05),
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          backgroundColor: _selectedIndex==2?Color(0xff284389): Color(0xffD9D9D9),
                      ),onPressed: (){
                          position=2;
                        onpresedbutton(2);
                      }, child:Text("Rejected",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color:_selectedIndex == 2 ? Colors.white : Colors.black,fontFamily: "regulartext"),)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mheight*0.03,
              ),
              Expanded(child: screen.isNotEmpty ? screen[position] : Container(
                color: Colors.green,
              )),/// cards sets Upcoming,completed,Faild
      ]
    )
            ],
          )
    );

  }
}
