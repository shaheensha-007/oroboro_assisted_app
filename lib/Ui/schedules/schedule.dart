import 'package:flutter/material.dart';

import '../apparbar/myappbar.dart';
import 'oustanding_payment.dart';


class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: MyAppbar(),
      ),
      backgroundColor: Colors.white,
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
                child: Text("Schedules",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.03,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Loan no",
                            hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,fontFamily: "regulartext")
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(right: mwidth*0.15),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                    )
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: Divider(
                  color: Colors.black,
                  endIndent: mwidth*0.15,
                ),
              ),
              SizedBox(
                height: mheight*0.03,
              ),
              Expanded(
                child: ListView.builder(itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return  SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: mheight*0.03,
                          ),
                          Padding(
                            padding:EdgeInsets.only(left: mwidth*0.03,right: mwidth*0.05),
                            child: Container(
                              height: mheight * 0.2,
                              width: mwidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffC9D2EA), spreadRadius: 1),
                                  ],
                                  color: Colors.white),
                              child: Padding(
                                padding:EdgeInsets.only(left: mwidth*0.03,top: mheight*0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Ref NO :",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,)),
                                        SizedBox(
                                          width: mwidth*0.01,
                                        ),
                                        Text(" #ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,)),
                                        Spacer(),
                                        Text("Date :",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,)),
                                        SizedBox(
                                          width: mwidth*0.01,
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(right: mwidth*0.05),
                                          child: Text("23-09-20000 ",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,)),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Color(0xffC9D2EA),
                                      endIndent: mwidth*0.05,
                                    ),
                                    SizedBox(
                                      height: mheight*0.01,
                                    ),
                                    Text("Loan No :ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,) ,),
                                    SizedBox(
                                      height: mheight*0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Loan No :ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,color: Color(0xff3E4C57)) ,),
                                        Spacer(),
                                        Padding(
                                          padding:EdgeInsets.only(right: mwidth*0.05),
                                          child: ElevatedButton(style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                            backgroundColor: Colors.green,
                                          ),
                                              onPressed: (){
                                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Oustanding_payment()), (route) => false);
                                              },child: Text("Balance",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,color: Colors.white))),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: mheight*0.01,
                                    ),
                                    Text("Loan No :ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"regulartext",fontWeight: FontWeight.bold,color: Color(0xff3E4C57)) ,),
                                    SizedBox(
                                      height: mheight*0.01,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },),
              )
            ],
          )
        ],
      ),
    );
  }
}