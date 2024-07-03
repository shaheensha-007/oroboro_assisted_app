import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/LOAN/Loan_disbursal/disbursed.dart';

import '../../apparbar/myappbar.dart';
import 'Disbursal _pending.dart';

class Loan_disbursal extends StatefulWidget {
  const Loan_disbursal({super.key});

  @override
  State<Loan_disbursal> createState() => _Loan_disbursalState();
}

class _Loan_disbursalState extends State<Loan_disbursal> {
  int _selectedIndex = 0;

  int position = 0;

  List<Widget>screen=[Disbursal_pendding(),Disbursed()];

  void onpresssed(int index){
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
      appBar: AppBar(
        title: MyAppbar(),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mheight*0.1,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.05),
                child: Text("Loan Disbursal",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.05,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: _selectedIndex==0?Color(0xff284389): Color(0xffD9D9D9),
                    ),onPressed: (){
                      setState(() {
                        position=0;
                        onpresssed(0);
                      });
                      }, child:Text("Disbursal-pending",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color:_selectedIndex == 0 ? Colors.white : Colors.black,fontFamily: "regulartext"),)),
                SizedBox(
                  width: mwidth*0.03,
                ),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: _selectedIndex==1?Color(0xff284389): Color(0xffD9D9D9),
                    ),onPressed: (){
                      setState(() {
                        position=1;
                        onpresssed(1);
                      });
                    }, child:Text("Disbursed",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color:_selectedIndex == 1 ? Colors.white : Colors.black,fontFamily: "regulartext"),)),
                  ],

                )
              ),
              SizedBox(
                height: mheight*0.03,
              ),
              Expanded(child: screen.isNotEmpty ? screen[position] : Container(
                color: Colors.green,
              )),///
                  ]
          )
        ],
      ),
    );
  }
}
