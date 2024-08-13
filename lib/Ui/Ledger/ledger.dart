import 'package:flutter/material.dart';

import '../apparbar/myappbar.dart';

class Ledger extends StatefulWidget {
  const Ledger({super.key});

  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title:const MyAppbar(),
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
                child: const Text("Ledger",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
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
                        decoration: const InputDecoration(
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
                      child: IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
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
                  return
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: mheight*0.03,
                          ),
                          Padding(
                            padding:EdgeInsets.only(left: mwidth*0.03,right: mwidth*0.05),
                            child: Container(
                              height: mheight * 0.1,
                              width: mwidth * 0.8,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
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
                                        const Text("01-04-2000",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                        const Spacer(),
                                        const Text("₹1,000",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                        const Text("Cr",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,color: Colors.green)),
                                        const Spacer(),
                                        const Text("Balance",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,color: Colors.lightBlueAccent)),
                                        SizedBox(
                                          width: mwidth*0.02,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: mwidth*0.05),
                                          child: const Text("₹1,000",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                        ),
                                      ],
                                    ),
                                     SizedBox(
                                       height: mheight*0.02,
                                     ),
                                     Container(color: const Color(0xffF1F1FE),
                                         child: const Text("Narration : Loan ORO006-A21-001-1",style:TextStyle(fontSize: 12,fontFamily:"shorts",fontWeight: FontWeight.bold,)))
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
