import 'package:flutter/material.dart';

import 'chooose_emi tenure.dart';

class Product_value extends StatefulWidget {
  const Product_value({super.key});

  @override
  State<Product_value> createState() => _Product_valueState();
}
String? valueproduct;
class _Product_valueState extends State<Product_value> {
  List<String> listQuestion = ["Standard Protection", "Screen Damage Protection", "Extended Warranty", "iPhone Protection"];
  List <String>listofproduct=['smartphone','car','bike'];
  late List<bool> selectedList;
  @override
  void initState() {
    super.initState();
    selectedList = List<bool>.filled(listQuestion.length, false);
  }
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:EdgeInsets.only(left:mwidth*0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mheight*0.2,
                  ),
                  const Text("Product Details",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.05,
                  ),
                  Container(
                    height: mheight*0.06,
                    width: mwidth*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey,spreadRadius: 1),
                        ],
                        color: Colors.white
                    ),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.03),
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        value:valueproduct,
                        onChanged: (value){
                          setState(() {
                            valueproduct=value;
                          });
                        },
                        items:listofproduct.map((PRODUCTVALUE){
    return DropdownMenuItem(
    value: PRODUCTVALUE,
    child: Text(PRODUCTVALUE,style:const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    fontFamily: "regulartext",
    ),),
    );
    }).toList(),
    decoration: const InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust content padding as needed
    border: InputBorder.none, // Remove the border
    hintText: "Product Value",
    hintStyle: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    fontFamily: "regulartext",
    ),
    errorStyle: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    fontFamily: "regulartext",
    ),
    ),
                        ) ,
                      )
                    ),

                  SizedBox(
                    height: mheight*0.03,
                  ),
                  Container(
                    height: mheight*0.06,
                    width: mwidth*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey,spreadRadius: 1),
                        ],
                        color: Colors.white
                    ),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.03),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Brand Name",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.03,
                  ),
                  Container(
                    height: mheight*0.06,
                    width: mwidth*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey,spreadRadius: 1),
                        ],
                        color: Colors.white
                    ),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.03),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Model",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.03,
                  ),
                  Container(
                    height: mheight*0.06,
                    width: mwidth*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey,spreadRadius: 1),
                        ],
                        color: Colors.white
                    ),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.03),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Product Value",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.03,
                  ),
                  const Text("insurance Type",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,fontFamily: "boldtext"),),
                 SizedBox(
                   height: mheight*0.02,
                 ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listQuestion.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(side: BorderSide(color: Colors.grey)),
                            value: selectedList[index],
                            onChanged: (bool? value) {
                              setState(() {
                                selectedList[index] = value ?? false;
                              });
                            },
                          ),
                          Text(
                            listQuestion[index],
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, fontFamily: "boldtext", color: Colors.black),
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(
                    height: mheight*0.03,
                  ),
                  Padding(
                    padding:EdgeInsets.only(right: mwidth*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xff284389)
                        ),  onPressed: (){
                          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>), (route) => false);
                        },
                            child:const Text("Previous",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                        ElevatedButton(style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xff284389)
                        ),  onPressed: (){
                         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Choose_your_emi_tenure()), (route) => false);
                        },
                            child:const Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                      ],
                    ),
                  ),
                SizedBox(
                  height: mheight*0.1,
                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
