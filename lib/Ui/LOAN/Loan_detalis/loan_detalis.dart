
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oroboro_assisted_app/Ui/LOAN/Loan_detalis/pendding.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../Blocs/Loan_View_Blocs/LoanView_blocs/loan_view_bloc.dart';
import '../../../widgets/NavigationServies.dart';
import '../../apparbar/myappbar.dart';
import 'Rejected.dart';
import 'in-process.dart';

class Loan_detalis extends StatefulWidget {
  const Loan_detalis({super.key});

  @override
  State<Loan_detalis> createState() => _Loan_detalisState();
}
TextEditingController fromdate1 = TextEditingController();
TextEditingController Todate1 = TextEditingController();

class _Loan_detalisState extends State<Loan_detalis> {
  int _selectedIndex = 0;

  int position = 0;

 List<Widget>screen=[
   Pending(),
   const Inprocess(),
   const Rejected()];

  void onpresedbutton(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime initialDate = DateTime.now().subtract(const Duration(days: 20));
    fromdate1.text = DateFormat('dd-MM-yyyy').format(initialDate);
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
        title:const MyAppbar() ,
      ) ,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.rh(context)
              ),
               Center(child: Text("Loan Details",style: TextStyle(fontSize:28.rf(context),fontFamily: "boldtext"),)),
              SizedBox(
                height: 30.rh(context),
              ),
              Padding(
                padding:EdgeInsets.only(left: 20.rw(context)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:100.rw(context) ,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          backgroundColor: _selectedIndex==0?const Color(0xff284389): const Color(0xffD9D9D9),
                      ),onPressed: (){
                        setState(() {
                          position=0;
                          onpresedbutton(0);
                        });
                      }, child:Text("Pending",style: TextStyle(fontSize: 14.rf(context),color:_selectedIndex == 0 ? Colors.white : Colors.black,fontFamily: "boldtext"),)),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 110.rw(context),
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          backgroundColor: _selectedIndex==1?const Color(0xff284389): const Color(0xffD9D9D9),
                      ),onPressed: (){
                        position=1;
                        onpresedbutton(1);
                      }, child:Text("In- Process",style: TextStyle(fontSize: 14.rf(context),color: _selectedIndex == 1 ? Colors.white : Colors.black,fontFamily: "boldtext"),)),
                    ),
                    const Spacer(),
                    Padding(
                      padding:EdgeInsets.only(right: mwidth*0.05),
                      child: SizedBox(
                        width: 100.rw(context),
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            backgroundColor: _selectedIndex==2?const Color(0xff284389): const Color(0xffD9D9D9),
                        ),onPressed: (){
                            position=2;
                          onpresedbutton(2);
                        }, child:Text("Rejected",style: TextStyle(fontSize: 14.rf(context),color:_selectedIndex == 2 ? Colors.white : Colors.black,fontFamily: "boldtext"),)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:20.rh(context)
              ),

              Padding(
                padding: EdgeInsets.only(left: 30.rw(context)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    "From",
    style: TextStyle(
    fontSize: 18,
    fontFamily: "boldtext",
    fontWeight: FontWeight.w800),
    ),
    SizedBox(
    width: mwidth * 0.02,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    height: 50,
    width: 150,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    boxShadow: const [
    BoxShadow(color: Colors.grey, spreadRadius: 1),
    ],
    color: Colors.white),
    child: Padding(
    padding: EdgeInsets.only(left: mwidth * 0.03),
    child: Row(
    children: [
    Expanded(
    child: TextFormField(
    keyboardType: TextInputType.datetime,
    style: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    fontFamily: "regulartext"),
    controller: fromdate1,
    decoration: const InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    hintText: "dd-MM-yyyy",
    hintStyle: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w200,
    fontFamily: "regulartext"),
    errorStyle: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w200,
    fontFamily: "regulartext"),
    ),
    ),
    ),
    IconButton(
    onPressed: () async {
    DateTime initialDate =
    DateTime.now().subtract(const Duration(days: 20));
    DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1950),
    lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
    String formattedDate =
    DateFormat('dd-MM-yyyy').format(pickedDate);
    setState(() {
      fromdate1.text = formattedDate;
    });
    }
    },
    icon: const Icon(Icons.calendar_month),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ],
    ),
                    SizedBox(
                      width: 20.rw(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "To",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "boldtext",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          width: mwidth * 0.02,
                        ),
                        Container(
                          height: 50.rh(context),
                          width: 150.rw(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.03),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    readOnly: true,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext",
                                    ),
                                    controller: Todate1,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      hintText: "dd-MM-yyyy",
                                      hintStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "regulartext",
                                      ),
                                      errorStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "regulartext",
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                       firstDate: DateTime(1950),
                                      lastDate: DateTime(2100),
                                    );

                                    if (pickedDate != null) {
                                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                      setState(() {
                                        Todate1.text = formattedDate;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.rh(context),
              ),
              Center(
                child: SizedBox(
                  width: 100.rw(context),
                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18)),
                     backgroundColor: const Color(0xff284389)),
                                      onPressed: () {
                                      },
                                      child:Text(
                   "Find",
                   style: TextStyle(
                       fontSize: 14.rf(context),
                       color: Colors.white,
                       fontFamily: "boldtext"),
                                      )),
                ),
              ),
              SizedBox(
                height: 20.rh(context)
              ),
              Expanded(child: screen.isNotEmpty ? screen[position] : Container(
                color: Colors.green,
              )),
              /// cards sets Upcoming,completed,Faild
      ]
    )
            ],
          )
    );

  }
  void _showErrorSnackBar(String message) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set the background color
          contentPadding: EdgeInsets.zero, // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Customize corner radius
          ),
          content: Container(
            constraints: BoxConstraints(
              maxWidth: 300, // Set the maximum width
              minHeight: 150, // Set the minimum height
            ),
            padding: const EdgeInsets.all(16), // Padding for content
            color: Colors.blueGrey[50], // Set the container's background color
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "font2",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff284389),
                    ),
                    onPressed: () {
                      NavigationService.pop(); // Close the dialog
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext",
                        color: Colors.white,
                      ),
                    ), // Button text
                  ),
                ), // Add spacing between text and button
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyDataTable extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    200,
        (index) => {
      "id": index + 1,
      "name": "Name $index",
      "loannumber":"ORO003A1334-16257",
      "loanAmout":21683,
      "Date":DateTime.now(),
      "Productvalue":21876544,
      "Status":"ENach Completed",
      "USERNAME":"S R ENTERPRISE",
      "MERCHANTNAME":"S R ENTERPRISE",
      "DELIVERYNAME":"shahrrr",

    },
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final item = _data[index];
    return DataRow(
      color: MaterialStateProperty.resolveWith((states) {
        return Colors.white; // Header row color
      }),
      cells: [
        DataCell(Text(item['id'].toString())),
        DataCell(Text(item['name'])),
        DataCell(Text(item['loannumber'].toString())),
        DataCell(Text(item['loanAmout'].toString())),
        DataCell(Text(item["Date"].toString())),
        DataCell(Text(item["Productvalue"].toString())),
        DataCell(Text(item['Status'].toString())),
        DataCell(Text(item['USERNAME'].toString())),
        DataCell(Text(item['MERCHANTNAME'].toString())),
        DataCell(ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.blue,
          ),
          onPressed: (){}, child: Text("Dowloand"),
        )),

      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
