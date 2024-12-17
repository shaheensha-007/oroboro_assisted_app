
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/LoanEligable_blocs/loan_eligable_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/Loan_rejected_approved.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/addhaar%20number.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/LoanEligableModel/LoanEligableModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/LoanEligableModel/MaxloanCapModel/MaxloancapModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Personal_informationmodel/Co-borrowerModel/Co_borrowerModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Personal_informationmodel/MonthIncomeModel/MonthincomeModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/LoanEligable_blocs/Maxloancap_bloc/maxloan_cap_bloc.dart';
import '../../Blocs/Customeronbording_blocs/personalinformation_blocs/Co_borrower_Bloc/co_borrower_bloc.dart';
import '../../Blocs/Customeronbording_blocs/personalinformation_blocs/Customerdocu_bloc/customerdocu_bloc.dart';
import '../../Blocs/Customeronbording_blocs/personalinformation_blocs/Monthincome_bloc/monthincome_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/Personal_informationmodel/Customerdocu_Model/Customerdocu_Model.dart';
import '../../modeles/customeronboradingModel/Personal_informationmodel/Customerdocu_Model/Customerdocu_Model.dart';
import 'loan_eligiblity_ Approved.dart';

class Personal_information extends StatefulWidget {
  const Personal_information({super.key});

  @override
  State<Personal_information> createState() => _Personal_informationState();
}
MonthincomeModel?isincomemonth;
CoBorrowerModel? coBorrowerModel;
CustomerdocuModel? customerdocuModel;
LoanEligableModel? loanEligableModel;
MaxloancapModel? maxloancapModel;
CustomeronbordingstatusModel? personlCustomeronbording;
UpadatenextprocessModel? personalCustomerupdatenextprocess;
Customeronbording2Model? personalCustomeronbording2;






TextEditingController montlyincome = TextEditingController();
TextEditingController montlycommited = TextEditingController();
TextEditingController Residencestatus = TextEditingController();
TextEditingController reference1name = TextEditingController();
TextEditingController reference1age = TextEditingController();
TextEditingController reference2name = TextEditingController();
TextEditingController reference2age = TextEditingController();
/// controllers


bool isLoading = false;
String? stringemploymentstatus;
String? residencestatus;
String? selectutitiyname;
String? fileName1;
String? base64filename1;
int? Pageorderinfo;
String? pagenameinfo;








class _Personal_informationState extends State<Personal_information> {
  final GlobalKey<FormState> personalinformationkey = GlobalKey<FormState>();
  List<String> status = ['Salaried', 'Unemployed'];
  List<String> statusresidence = [
    'Resident and Ordinarily Resident(ROR)',
    'Resident but Not Ordinarily Resident(RNOR)',
    'Non-Resident(NR)'
  ];
  List<String>utilitytype = [
    "ELECTRICITY_BILL",
    "GAS_BILL",
    "WATER_BILL",
    "RENTAL_DOCUMENT"
  ];

  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context)
        .add(FetchMerchartToken(
        userName: "Test", password: tokenpassword, ctx: context));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.rw(context)),
              child: Form(
                key: personalinformationkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:120.rh(context),
                    ),
                     Text(
                      "Personal information", style: TextStyle(
                        fontSize:28.rf(context),
                      fontFamily: "boldtext"),),
                    SizedBox(
                      height: 50.rh(context),
                    ),
                    Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.rw(context)),
                          child: DropdownButtonFormField<String>(
                            icon: const Icon(Icons.arrow_drop_down),
                            value: stringemploymentstatus,
                            onChanged: (value) {
                              setState(() {
                                stringemploymentstatus = value;
                              });
                            },
                            items: status.map((employeed) {
                              return DropdownMenuItem(
                                value: employeed,
                                child: Text(employeed, style:  TextStyle(
                                  fontSize: 12.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext",
                                ),),
                              );
                            }).toList(),
                            decoration:  InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              // Adjust content padding as needed
                              border: InputBorder.none,
                              // Remove the border
                              hintText: "Employment Status",
                              hintStyle: TextStyle(fontSize: 10.rf(context),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "regulartext"),
                              errorStyle: TextStyle(fontSize: 10.rf(context),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "regulartext"),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                    Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left:10.rw(context)),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6)
                          ],
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Monthly income';
                            }
                          },
                          style:TextStyle(fontSize: 14.rh(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: montlyincome,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Monthly income",
                            hintStyle: TextStyle(fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context)
                    ),
                    Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.rw(context)),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6)
                          ],
                          keyboardType: TextInputType.number,
                          style:  TextStyle(fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Monthly EMI Commitment';
                            }
                          },
                          controller: montlycommited,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Monthly EMI Commitment",
                            hintStyle: TextStyle(fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                    Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                            color: Colors.white
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 10.rw(context)),
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(Icons.arrow_drop_down),
                              value: residencestatus,
                              onChanged: (value) {
                                setState(() {
                                  residencestatus = value;
                                });
                              },
                              items: statusresidence.map((Residence) {
                                return DropdownMenuItem(
                                  value: Residence,
                                  child: Text(Residence, style:  TextStyle(
                                    fontSize: 12.rf(context),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext",
                                  ),),
                                );
                              }).toList(),
                              decoration:  InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                // Adjust content padding as needed
                                border: InputBorder.none,
                                // Remove the border
                                hintText: "Residence Status",
                                hintStyle: TextStyle(
                                  fontSize: 10.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext",
                                ),
                                errorStyle: TextStyle(
                                  fontSize: 10.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext",
                                ),
                              ),

                            )
                        )
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                    Text("Reference 1", style: TextStyle(fontSize: 22.rf(context),
                        fontFamily: "regulartext",),),
                    SizedBox(
                      height: 20.rh(context),
                    ),
                    Row(
                      children: [
                        Container(
                    height: 50.rh(context),
                      width: 130.rw(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.rw(context)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Reference 1 name';
                                }
                              },
                              style:  TextStyle(fontSize: 14.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: reference1name,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Name",
                                hintStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:30.rw(context),
                        ),
                        Container(
                       height: 50.rh(context),
                        width: 130.rw(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.rw(context)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Reference 1 Mobile';
                                }
                                if (value.length != 10) {
                                  return "Mobile number must be 10 digits";
                                }
                              },
                              style:  TextStyle(fontSize: 14.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: reference1age,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Mobile",
                                hintStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.rh(context),
                    ),
                     Text("Reference 2", style: TextStyle(fontSize: 22.rf(context),
                        fontFamily: "regulartext",
                        ),),
                    SizedBox(
                      height: 20.rh(context),
                    ),
                    Row(
                      children: [
                        Container(
                    height: 50.rh(context),
                    width: 130.rw(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.rw(context)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Reference 2 Name';
                                }
                              },
                              style:  TextStyle(fontSize: 14.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: reference2name,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Name",
                                hintStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.rw(context),
                        ),
                        Container(
                        height: 50.rh(context),
                        width: 130.rw(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.rw(context)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please Enter Reference Number';
                                }
                                if (value.length != 10) {
                                  return "Mobile number must be 10 digits";
                                }
                              },
                              style:  TextStyle(fontSize: 14.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: reference2age,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Mobile",
                                hintStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:20.rh(context),
                    ),
                     Text(
                      "Utility  document", style: TextStyle(fontSize: 22.rf(context),
                        fontFamily: "regulartext",
                     ),),
                    SizedBox(
                      height: 20.rh(context),
                    ),
                    Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.rw(context)),
                        child: DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select utility type';
                            }
                            return null;
                          },
                          style:  TextStyle(
                            fontSize: 14.rf(context),
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext",
                            color: Colors.black,
                          ),
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Select utility type",
                            hintStyle: TextStyle(
                              fontSize: 10.rf(context),
                              fontWeight: FontWeight.w200,
                              fontFamily: "regulartext",
                              color: Colors.black,
                            ),
                            errorStyle: TextStyle(
                              fontSize: 10.rf(context),
                              fontWeight: FontWeight.w200,
                              fontFamily: "regulartext",
                              color: Colors.black,
                            ),
                          ),
                          items: utilitytype.map<DropdownMenuItem<String>>((
                              utitiyname) {
                            return DropdownMenuItem<String>(
                              value: utitiyname,
                              child: Text(utitiyname,
                                style:  TextStyle(
                                  fontSize: 10.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext",
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectutitiyname = newValue;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                    Container(
                        height: 45.rh(context),
                        width: 300.rw(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey,),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50.rh(context),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: const Color(0xff284389),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                // Pick the file
                                FilePickerResult? result = await FilePicker
                                    .platform.pickFiles();

                                if (result != null) {
                                  PlatformFile file = result.files.first;

                                  // Check the file extension (pdf, jpg, png)
                                  List<String> allowedExtensions = [
                                    'pdf',
                                    'jpg',
                                    'png'
                                  ];
                                  String fileExtension = file.extension!
                                      .toLowerCase();

                                  if (!allowedExtensions.contains(
                                      fileExtension)) {
                                    // If the file type is not allowed
                                    _showErrorSnackBar(
                                        'Only PDF, JPG, PNG files are allowed');
                                    return; // Exit early if the file type is invalid
                                  }

                                  // Check the file size (limit: 2MB = 2 * 1024 * 1024 bytes)
                                  if (file.size > 2 * 1024 * 1024) {
                                    // If the file size exceeds 2MB
                                    _showErrorSnackBar(
                                        'File size must be less than 2MB');
                                    return; // Exit early if the file size is too large
                                  }

                                  // Proceed with reading the file if it's valid
                                  File filenameread = File(file.path!);
                                  List<int> filebytes = await filenameread
                                      .readAsBytes();
                                  base64filename1 = base64Encode(filebytes);
                                  print(base64filename1);
                                  setState(() {
                                    fileName1 = file.name;
                                  });
                                }
                              },
                              child: Text(
                                "Browser",
                                style: TextStyle(
                                  fontSize: 20.rf(context),
                                  color: Colors.white,
                                  fontFamily: "boldtext",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10.rh(context), left: 20.rw(context)),
                              child: Text(
                                fileName1.toString(), style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.rf(context),
                                  fontFamily: "regulartext",
                                  color: Colors.grey),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.rh(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.rw(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: const Color(0xff284389)
                          ), onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Aadhaarnumber()), (
                                route) => false);
                          },
                              child:  Text(
                                "Previous", style: TextStyle(fontSize: 20.rf(context),
                                  color: Colors.white,
                                  fontFamily: "boldtext"),)),


                          ///update Montlyincome
                          BlocListener<MonthincomeBloc, MonthincomeState>(
                            listener: (context, state) async {
                              final preferences = await SharedPreferences
                                  .getInstance();
                              if (state is MonthincomeblocLoading) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const Center(
                                        child:
                                        CircularProgressIndicator());
                                  },
                                );
                              }
                              if (state is MonthincomeblocLoaded) {
                                Navigator.of(context,rootNavigator: true).pop();
                                isincomemonth = state.monthincomeModel;
                                if (isincomemonth?.status.toString() == "Success") {
                                  BlocProvider.of<CoBorrowerBloc>(context).add(FetchCoBorrower(
                                      userId: preferences.getString("Userid").toString(),
                                      Customercode: preferences.getString("CustomerCode").toString(),
                                      ApplicationId: preferences.getString("applicationid").toString(),
                                      data: [
                                        {
                                          "Name": reference1name.text,
                                          "Mobile": reference1age.text,
                                        },
                                        {
                                          "Name": reference2name.text,
                                          "Mobile": reference2age.text,
                                        }
                                      ],
                                      ctx: context));
                                } 
                              }
                            if(state is MonthioncomeblocError){
                              Navigator.of(context,rootNavigator: true).pop();
                              _showErrorSnackBar(state.Errormessage);
                            }
                            },
                            ///Co-borrower
                            child: BlocListener<CoBorrowerBloc, CoBorrowerState>(
                              listener: (context, state) async {
                                final preferences = await SharedPreferences.getInstance();
                                if (state is CoBorrowerblocLoding) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return const Center(
                                          child:
                                          CircularProgressIndicator());
                                    },
                                  );
                                }
                                if (state is CoBorrowerblocLoaded) {
                                  Navigator.of(context,rootNavigator: true).pop();
                                  coBorrowerModel = state.coBorrowerModel;
                                  if (coBorrowerModel?.status.toString() == "Success") {
                                    BlocProvider.of<CustomerdocuBloc>(context).add(FetchCustomerdocu(
                                        userId: preferences.getString("Userid").toString(),
                                        IdentityType: "CUSTOMERCODE",
                                        Identity: preferences.getString("CustomerCode").toString(),
                                        applicationId: preferences.getString("applicationid").toString(),
                                        DocType: selectutitiyname.toString(),
                                        DocBase64: base64filename1.toString(),
                                        ctx: context));
                                  } 
                                }
                                if(state is CoBorrowerblocError){
                                  _showErrorSnackBar(state.Errormessage);
                                }
                              },
                              ///document uploaded
                              child: BlocListener<
                                  CustomerdocuBloc,
                                  CustomerdocuState>(
                                listener: (context, state) async {
                                  final preferences = await SharedPreferences
                                      .getInstance();
                                  if (state is CustomerdocublocLoding) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return const Center(
                                            child:
                                            CircularProgressIndicator());
                                      },
                                    );
                                  }
                                  if (state is CustomerdocublocLoaded) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    customerdocuModel = state.customerdocuModel;
                                    if (customerdocuModel?.status.toString() ==
                                        "Success") {
                                      BlocProvider.of<MaxloanCapBloc>(context)
                                          .add(FetchMaxloancap(
                                          userid: preferences.getString(
                                              "Userid") ?? "",
                                          Customercode: preferences.getString(
                                              "CustomerCode") ?? "",
                                          ctx: context));
                                    }
                                  }
                                  if (state is CustomerdocublocError) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    _showErrorSnackBar(state.Errormessage);
                                  }
                                },

                                ///MaxloanCap
                                child: BlocListener<MaxloanCapBloc, MaxloanCapState>(
                                 listener: (context, state)async {
                                     final preferences = await SharedPreferences.getInstance();
                                              if(state is MaxloanCapblocLoading){
                                                      showDialog(
                                                           context: context,
                                                           barrierDismissible: false,
                                                           builder: (BuildContext context) {
                                                                return const Center(
                                                                   child:
                                                                    CircularProgressIndicator());
                                                                },
                                                               );
                                                               }
                                                                 if(state is MaxloanCapblocLoaded){
                                                                    Navigator.of(context,rootNavigator: true).pop();
                                                                       maxloancapModel=state.ismaxloancapmodel;
                                                                           if(maxloancapModel?.status=="Success"){
                                                                             BlocProvider.of<LoanEligableBloc>(context).add(FetchLoanEligable(
                                                                               userid: preferences.getString("Userid")??"",
                                                                                Customercode: preferences.getString("CustomerCode")??"",
                                                                                 partnercode: preferences.getString("partnercode")??'',
                                                                                 agentcode: preferences.getString("agentcode")??"",
                                                                                  ctx: context));
                                                                                 }

                                                                                 }
                                                                if(state is MaxloanCapblocError){
                                                                  Navigator.of(context,rootNavigator: true).pop();
                                                                        _showErrorSnackBar(state.Errormessage);
                                                                                }
                                                                                 },
                                  ///LoanEligable Approved or rejected
                                child: BlocListener<
                                    LoanEligableBloc,
                                    LoanEligableState>(
                                  listener: (context, state) async {
                                    final preferences = await SharedPreferences.getInstance();
                                    if (state is LoanEligableblocLoading) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const Center(
                                              child:
                                              CircularProgressIndicator());
                                        },
                                      );
                                    }
                                    if (state is LoanEligableblocLoaded) {
                                      Navigator.of(context,rootNavigator: true).pop();
                                       loanEligableModel = state.loanEligableModel;
                                      if (loanEligableModel?.status == "Success") {
                                        final loanstatus = loanEligableModel?.result!.loanApplicationStatus??"";
                                        if (loanstatus == "APPROVED") {
                                          BlocProvider.of<CustomeronbordingBloc>(context).add(
                                              FetchCustomeronbording(
                                                  userid: preferences.getString("Userid").toString(),
                                                  Customercode: preferences.getString("CustomerCode")
                                                      .toString(),
                                                  partnercode: preferences.getString("partnercode")
                                                      .toString(),
                                                  agentcode: preferences.getString("agentcode").toString(),
                                                  ctx: context));
                                        } else {
                                          NavigationService
                                              .pushAndRemoveUntil(
                                              Loan_rejected_approved(), (
                                              Route<
                                                  dynamic>route) => false);
                                        }
                                      }

                                    }
                                    if(state is LoanEligableblocError){
                                      _showErrorSnackBar(state.Errormessasge);
                                    }
                                  },
                                child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                                  listener: (context, state) async {
                                    log("shaheen Customeronbording==$state");
                                    final preferences = await SharedPreferences
                                        .getInstance();
                                    if (state is CustomeronbordingblocLoading) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const Center(
                                              child:
                                              CircularProgressIndicator());
                                        },
                                      );
                                    }
                                    if (state is CustomeronbordingblocLoaded) {
                                      Navigator.of(context,rootNavigator: true).pop();
                                      personlCustomeronbording =state.customeronbordingstatusModel;
                                      if (personlCustomeronbording?.status
                                          .toString() == "Success") {
                                        Pageorderinfo =
                                            personlCustomeronbording?.result!.pageOrder?.toInt();

                                        BlocProvider.of<CustomerupdatenextBloc>(context).add(
                                            FetchCustomerupdate(
                                                userid: preferences.getString("Userid").toString(),
                                                Customercode: preferences.getString("CustomerCode")
                                                    .toString(),
                                                PartnerCode: preferences.getString("partnercode")
                                                    .toString(),
                                                FlowId:preferences.getString("Flowid")??"",
                                                PageOrder: Pageorderinfo.toString(),
                                                ApplicationId: preferences.getString("applicationid")
                                                    .toString(),
                                                PageType:preferences.getString("pagetype")??"" ,
                                                ctx: context));
                                      }
                                    }
                                    if(state is CustomeronbordingblocError){
                                      Navigator.of(context,rootNavigator: true).pop();
                                      _showErrorSnackBar(state.Errormessage);
                                    }
                                    // TODO: implement listener
                                  },
                                  child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                                    listener: (context, state) async {
                                      log("shaheer Customerupdate==$state");
                                      final preferences = await SharedPreferences
                                          .getInstance();
                                      if (state is CustomerupdatenextblocLoading) {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return const Center(
                                                child:
                                                CircularProgressIndicator());
                                          },
                                        );
                                      }
                                      if (state is CustomerupdatenextblocLoaded) {
                                        Navigator.of(context,rootNavigator: true).pop();
                                        personalCustomerupdatenextprocess = state.upadatenextprocessModel;
                                        if (personalCustomerupdatenextprocess?.status.toString() == "Success") {
                                          BlocProvider.of<Customeronbording2Bloc>(context).add(
                                              FetchCustomeronbording2(
                                                  userid: preferences.getString("Userid").toString(),
                                                  Customercode: preferences.getString("CustomerCode")
                                                      .toString(),
                                                  partnercode: preferences.getString("partnercode")
                                                      .toString(),
                                                  agentcode: preferences.getString("agentcode")
                                                      .toString(),
                                                  ctx: context));
                                        }
                                      }
                                      if(state is CustomerupdatenextblocError){
                                        _showErrorSnackBar(
                                         state.Errormessage);
                                      }
                                      // TODO: implement listener
                                    },
                                    child: BlocListener<Customeronbording2Bloc, Customeronbording2State>(
                                      listener: (context, state) async {
                                        log("shaheen Customeronbording33434344==$state");
                                        if (state is Customeronbording2blocLoading) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return const Center(
                                                  child:
                                                  CircularProgressIndicator());
                                            },
                                          );
                                        }
                                        if (state is Customeronbording2blocLoaded) {
                                          Navigator.of(context,rootNavigator: true).pop();
                                          final preferences = await SharedPreferences
                                              .getInstance();
                                          personalCustomeronbording2 =state.customeronbording2model;
                                          if (personalCustomeronbording2?.status.toString() == "Success") {
                                            pagenameinfo =
                                                personalCustomeronbording2?.result?.pageName??'';
                                            if (pagenameinfo == "EligibilityStatus") {
                                              NavigationService.pushAndRemoveUntil(Loan_eligibility_Approved(), (Route<dynamic>route) => false);
                                            } else {
                                              _showErrorSnackBar(
                                                  "page is enable same value is missing");
                                              NavigationService.pushAndRemoveUntil(Personal_information(), (Route<dynamic>route) => false);
                                            }
                                          }
                                        }
                                        if(state is Customeronbording2blocError){
                                          _showErrorSnackBar(state.Errormessage);
                                        }

                                      },
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(5)),
                                                backgroundColor: const Color(
                                                    0xff284389)
                                            ), onPressed: () async {
                                          final preferences = await SharedPreferences
                                              .getInstance();
                                          if (personalinformationkey.currentState!.validate()) {
                                            final preferences = await SharedPreferences.getInstance();
                                            BlocProvider.of<MonthincomeBloc>(context).add(
                                                FetchMonthincome(
                                                    userId: preferences.getString("Userid").toString(),
                                                    Customercode: preferences.getString("CustomerCode").toString(),
                                                    EmploymentStatus: stringemploymentstatus
                                                        .toString(),
                                                    Income: montlyincome.text,
                                                    MonthlyEMIAmount: montlyincome.text,
                                                    ctx: context
                                                ));
                                          } else {
                                            _showErrorSnackBar(
                                                "Something is Error");
                                          }
                                        },
                                            child: Text("Sumbit",
                                              style: TextStyle(fontSize: 20.rf(context),
                                                  color: Colors.white,
                                                  fontFamily: "boldtext"),)),
                                      ),
                                    ),
                                  ),
                                ),
),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),)
      ,
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
                      Navigator.of(context).pop(); // Close the dialog
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