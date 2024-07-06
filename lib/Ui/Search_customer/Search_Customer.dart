import 'package:flutter/material.dart';

import '../apparbar/myappbar.dart';

class Search_Customers extends StatefulWidget {
  const Search_Customers({super.key});

  @override
  State<Search_Customers> createState() => _Search_CustomersState();
}
TextEditingController serachCustomerController=TextEditingController();
class _Search_CustomersState extends State<Search_Customers> {
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
                child: Text("Find Your Customer",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.03,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: Container(
                  height: mheight*0.06,
                  width: mwidth*0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey,spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding:EdgeInsets.only(left: mwidth*0.03),
                    child: TextFormField(
                      controller: serachCustomerController,
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "__Chooose__",
                        hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight*0.03,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: Container(
                  height: mheight*0.06,
                  width: mwidth*0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey,spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding:EdgeInsets.only(left: mwidth*0.03),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "PAN",
                        hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight*0.03,
              ),
              Center(
                child:  ElevatedButton(style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color(0xff284389)
                ),  onPressed: (){
                  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>()), (route) => false);
                },
                    child:Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
              ),
              SizedBox(
                height: mheight*0.06,
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
                              width: mwidth * 0.85,
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
                                        Text("Narration :",style:TextStyle(fontSize: 10,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
                                        SizedBox(
                                          width: mwidth*0.01,
                                        ),
                                        Padding(
                                          padding:EdgeInsets.only(right: mwidth*0.05,top: mheight*0.02),
                                          child: Text("Lorem Ipsum is dummy text of the printing.",style:TextStyle(fontSize: 10,fontFamily:"shorts",fontWeight: FontWeight.bold,)),
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
          ),
        ],
      ),
    );
  }
}
