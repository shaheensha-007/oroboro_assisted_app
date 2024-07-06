import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../apparbar/myappbar.dart';

class Cash_flow extends StatefulWidget {
  const Cash_flow({super.key});

  @override
  State<Cash_flow> createState() => _Cash_flowState();
}

class _Cash_flowState extends State<Cash_flow> {
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
                child: Text("Cash Flow",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
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
                                      Text("Ref NO :",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      SizedBox(
                                        width: mwidth*0.01,
                                      ),
                                      Text(" #ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      Spacer(),
                                      Text("Date :",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      SizedBox(
                                        width: mwidth*0.01,
                                      ),
                                      Padding(
                                        padding:EdgeInsets.only(right: mwidth*0.05),
                                        child: Text("23-09-20000 ",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
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
                                  Row(
                                    children: [
                                      Text("Ac.no :",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      SizedBox(
                                        width: mwidth*0.01,
                                      ),
                                      Text(" #ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      Spacer(),
                                      Text("Credit ",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,color: Colors.green)),
                                      SizedBox(
                                        width: mwidth*0.01,
                                      ),
                                      Padding(
                                        padding:EdgeInsets.only(right: mwidth*0.05),
                                        child: Text(": #ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: mheight*0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Balance :",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      SizedBox(
                                        width: mwidth*0.01,
                                      ),
                                      Padding(
                                        padding:EdgeInsets.only(right: mwidth*0.05),
                                        child: Text(" #ORBOR001",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Color(0xffC9D2EA),
                                    endIndent: mwidth*0.05,
                                  ),
                                  Row(
                                    children: [
                                      Text("Narration :",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      SizedBox(
                                        width: mwidth*0.01,
                                      ),
                                      Padding(
                                        padding:EdgeInsets.only(right: mwidth*0.05,top: mheight*0.02),
                                        child: Text("Lorem Ipsum is   dummy text of the printing and\n typesetting industry.",style:TextStyle(fontSize: 10,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                      ),
                                    ],
                                  )
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
