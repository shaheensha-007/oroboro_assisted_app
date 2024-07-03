import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/apparbar/myappbar.dart';

class Oustanding_payment extends StatefulWidget {
  const Oustanding_payment({super.key});

  @override
  State<Oustanding_payment> createState() => _Oustanding_paymentState();
}
bool totalcollection=false;
bool paycustom=false;
TextEditingController customAmountController=TextEditingController();
class _Oustanding_paymentState extends State<Oustanding_payment> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: MyAppbar(),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight*0.1,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.1),
                  child: Text("Outstanding Payments",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
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
                  height: mheight*0.05,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.1),
                  child: Container(
                    height: mheight*0.45,
                    width: mwidth*0.8,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                           children: [
                             Text("Outstanding EMI Amount",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext")),
                             Spacer(),
                             Padding(
                               padding:EdgeInsets.only(right: mwidth*0.05),
                               child: Text("₹6000",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext")),
                             )
                           ],
                         ),
                        SizedBox(
                          height: mheight*0.02,
                        ),
                        Row(
                          children: [
                            Text("Bounce  charge",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext",color: Color(0xff3E4C57))),
                            Spacer(),
                            Padding(
                              padding:EdgeInsets.only(right: mwidth*0.05),
                              child: Text("₹6000",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext",color: Color(0xff3E4C57))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mheight*0.02,
                        ),
                        Row(
                          children: [
                            Text("Other  charge",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext",color: Color(0xff3E4C57))),
                            Spacer(),
                            Padding(
                              padding:EdgeInsets.only(right: mwidth*0.05),
                              child: Text("₹6000",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext",color: Color(0xff3E4C57))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mheight*0.02,
                        ),
                        Row(
                          children: [
                            Text("Delay payment  ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext",color: Color(0xff3E4C57))),
                            Spacer(),
                            Padding(
                              padding:EdgeInsets.only(right: mwidth*0.05),
                              child: Text("₹6000",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext",color: Color(0xff3E4C57))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mheight*0.02,
                        ),
                        Row(
                          children: [
                            Text("Total Amount",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext")),
                            Spacer(),
                            Padding(
                              padding:EdgeInsets.only(right: mwidth*0.05),
                              child: Text("₹6000",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext")),
                            )
                          ],
                        ),
                      SizedBox(
                        height: mheight*0.05,
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Checkbox(
                           shape: CircleBorder(side: BorderSide(color: Colors.grey)),
                           value: totalcollection, onChanged:
                             (bool? value) {
                           setState(() {
                             totalcollection = value ?? false;
                           });
                         },
                         ),
                         Text("Pay Total Collections",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext"))
                       ],
                     ),
                        Padding(
                          padding:EdgeInsets.only(left: mwidth*0.15),
                          child: Row(
                            children: [
                              Checkbox(
                                shape: CircleBorder(side: BorderSide(color: Colors.grey)),
                                value: paycustom, onChanged:
                                  (bool? value) {
                                setState(() {
                                  paycustom = value ?? false;
                                });
                              },
                              ),
                              Text("Pay  Custom",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext"))
                            ],
                          ),
                        ),
                        if (paycustom)
                          Padding(
                            padding: EdgeInsets.only(top:mheight*0.03,left: mwidth*0.2),
                            child: Container(
                              height: mheight*0.06,
                              width: mwidth*0.3,
                              child: TextFormField(
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext"),
                                controller: customAmountController,
                                decoration: InputDecoration(
                                  hintText: "₹ 2000",
                                  errorStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext"),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                  ]
                    ),
                    ),
                  ),
                SizedBox(
                  height: mheight*0.02,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.1),
                  child: Container(
                    height: mheight*0.1,
                    width: mwidth*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                        BoxShadow(
                        color: Color(0xff2B45A3).withOpacity(0.5),
                    spreadRadius: -4,
                    blurRadius: 11,
                    offset: Offset(
                        0, 6), // changes position of shadow
                  ),
                  ]
                  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left: mwidth*0.05,top: mheight*0.02),
                          child: Text("Net Banking",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,fontFamily: "blodtext"),),
                        ),
                        SizedBox(
                          height: mheight*0.01,
                        ),
                        Padding(
                          padding:EdgeInsets.only(left: mwidth*0.05),
                          child: Container(
                            color: Color(0xffF1F1FE),
                            child: Text("Powered by Razorpay",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext"),),
                          ),
                        ),
                      ],
                    ),
                )
                ),
                SizedBox(
                  height: mheight*0.02,
                ),
                Padding(
                    padding:EdgeInsets.only(left: mwidth*0.1),
                    child: Container(
                      height: mheight*0.1,
                      width: mwidth*0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff2B45A3).withOpacity(0.5),
                              spreadRadius: -4,
                              blurRadius: 11,
                              offset: Offset(
                                  0, 6), // changes position of shadow
                            ),
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(left: mwidth*0.05,top: mheight*0.02),
                            child: Text("QR code / UPINet",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,fontFamily: "blodtext"),),
                          ),
                          SizedBox(
                            height: mheight*0.01,
                          ),
                          Padding(
                            padding:EdgeInsets.only(left: mwidth*0.05),
                            child: Container(
                              color: Color(0xffF1F1FE),
                              child: Text("Scan the QR and Payment ",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext"),),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
               SizedBox(width: double.infinity,
                   child: ElevatedButton(style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(),
                     backgroundColor: Color(0xff284389)
                   ),
                       onPressed: (){}, child: Text("Pay",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "blodtext",color: Colors.white),)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
