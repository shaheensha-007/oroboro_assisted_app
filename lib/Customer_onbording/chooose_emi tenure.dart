import 'package:flutter/material.dart';

import 'bank_detalis.dart';

class Choose_your_emi_tenure extends StatefulWidget {
  const Choose_your_emi_tenure({super.key});

  @override
  State<Choose_your_emi_tenure> createState() => _Choose_your_emi_tenureState();
}
String?emiTenure;
class _Choose_your_emi_tenureState extends State<Choose_your_emi_tenure> {
  List<String>chooseemitenure=['product value','EMi value','Total value'];
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding:EdgeInsets.only(left:mwidth*0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight*0.2,
                ),
                Text("Choose your EMI Tenure",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                SizedBox(
                  height: mheight*0.05,
                ),
                Container(
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
                    child:DropdownButtonFormField<String>(
                      icon: Icon(Icons.arrow_drop_down),
                      value: emiTenure,
                      onChanged: (value){
                        setState(() {
                          emiTenure=value;
                        });
                      },
                      items: chooseemitenure.map((tenure) {
                        return DropdownMenuItem(
                        value: tenure,
                        child: Text(tenure, style: TextStyle(
                                fontSize: 12,
                              fontWeight: FontWeight.w800,
                             fontFamily: "regulartext",
                                ),),
                                 );
                                 }).toList(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        // Adjust content padding as needed
                        border: InputBorder.none,
                        // Remove the border
                        hintText: "__chooose__",
                        hintStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                      ),
                    )
                  ),
                Spacer(),
                Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff284389)
                  ),  onPressed: (){
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Bank_details()), (route) => false);
                  },
                      child:Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
                SizedBox(
                  height: mheight*0.05,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
