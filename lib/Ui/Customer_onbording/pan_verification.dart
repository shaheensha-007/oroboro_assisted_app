import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Upadateaddress_bloc/upadateaddress_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/Mobileotp.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/panverificationModel/PanverificationModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Emailupdate_bloc/emailupadate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Panverification_blocs/Cilbilscore_Bloc/cibilscore_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Panverification_blocs/Statecode_bloc/statecode_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Panverification_blocs/panverification_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import '../../modeles/customeronboradingModel/EmailupadteModel/EmailupdateModel.dart';
import '../../modeles/customeronboradingModel/UpadateaddressModel/UpadateaddaressModel.dart';
import '../../modeles/customeronboradingModel/panverificationModel/CIBILscoreModel/CibilscoreModel.dart';
import '../../modeles/customeronboradingModel/panverificationModel/StatecodeModel/StatecodeModel.dart';
import 'addhaar number.dart';

class Panverfication extends StatefulWidget {
  const Panverfication({super.key});

  @override
  State<Panverfication> createState() => _PanverficationState();
}

PanverificationModel? verificationpan;
EmailupdateModel? isEmailupadate;
StatecodeModel? statecodeModel;
CibilscoreModel? iscibilscoreModel;
UpadateaddressModel? isaddressupadate;
CustomeronbordingstatusModel? ispancustomerstatuts;
UpadatenextprocessModel? ispanupadatenextprocess;
Customeronbording2Model? ispancustomeronbordingvalue;


///modless

TextEditingController pannumber = TextEditingController();
TextEditingController dateInput = TextEditingController();
TextEditingController Address1contoller = TextEditingController();
TextEditingController Address2contoller = TextEditingController();
TextEditingController Address3controller = TextEditingController();
TextEditingController citycontroller = TextEditingController();
TextEditingController statecontroller = TextEditingController(); //
TextEditingController districtcontroller = TextEditingController();
TextEditingController villagepincode = TextEditingController();
TextEditingController verificationemail = TextEditingController();
bool CibiDetalischeck = false;

String? selectedtype;
String? Pageorder2;
String? pagename2;

class _PanverficationState extends State<Panverfication> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test", password: tokenpassword, ctx: context));
    context.read<StatecodeBloc>().add(Fetchstatecode(ctx: context));
    // print("arun sir ");
    // TODO: implement initState
    super.initState();
    pannumber = TextEditingController();
    dateInput = TextEditingController();
    ;
    Address1contoller = TextEditingController();
    Address2contoller = TextEditingController();
    ;
    Address3controller = TextEditingController();
    citycontroller = TextEditingController();
    statecontroller = TextEditingController();
    districtcontroller = TextEditingController();
    villagepincode = TextEditingController();
    verificationemail = TextEditingController();
  }

  final GlobalKey<FormState> panverifcationkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35.rw(context)),
              child: Form(
                key: panverifcationkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.rh(context),
                    ),
                    Text(
                      "PAN Verification",
                      style: TextStyle(
                          fontSize: 28.rf(context),
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
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
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.rw(context)),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 14.rf(context), fontFamily: "boldtext"),
                          controller: pannumber,
                          onChanged: (text) {
                            String validText = text
                                .toUpperCase()
                                .replaceAll(RegExp(r'[^A-Z0-9]'), '');
                            pannumber.value = TextEditingValue(
                              text: validText,
                              selection: TextSelection.fromPosition(
                                TextPosition(offset: validText.length),
                              ),
                            );
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "PAN",
                            hintStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter PAN number';
                            }
                            // Add more validation rules if needed
                            return null;
                          },
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
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.rw(context)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: dateInput,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                style: TextStyle(
                                    fontSize: 14.rf(context),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "Date",
                                  hintStyle: TextStyle(
                                      fontSize: 10.rf(context),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                  errorStyle: TextStyle(
                                      fontSize: 10.rf(context),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your DOB';
                                  }
                                  // Add more validation rules if needed
                                  return null;
                                },
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      dateInput.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                                icon: const Icon(Icons.calendar_month))
                          ],
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
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.rw(context)),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: Address1contoller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Addaress1",
                            hintStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Address1';
                            }
                            // Add more validation rules if needed
                            return null;
                          },
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
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.rw(context)),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: Address2contoller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Addaress2",
                            hintStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Address2 ';
                            }
                            // Add more validation rules if needed
                            return null;
                          },
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
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.rw(context)),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: Address3controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Addaress3",
                            hintStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Address3 ';
                            }
                            // Add more validation rules if needed
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context),
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
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.rw(context)),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 14.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: citycontroller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "City",
                                hintStyle: TextStyle(
                                    fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(
                                    fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your city';
                                }
                                // Add more validation rules if needed
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.rw(context),
                        ),
                        Container(
                          height: 50.rh(context),
                          width: 130.rw(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                            color: Colors.white,
                          ),
                          child:Padding(
                            padding: EdgeInsets.only(right: 15.rw(context)),
                            child: BlocBuilder<StatecodeBloc, StatecodeState>(
                              builder: (context, state) {
                                if (state is StatecodeblocLoaded) {
                                  // Parse the result and extract StateCode values
                                  statecodeModel = state.statecodeModelstatus;

                                  // Assuming `Result` contains the list of states
                                  final stateCodeList = statecodeModel?.result
                                      ?.map<String>((item) =>item.stateCode.toString())
                                      .toList() ??
                                      [];

                                  return DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (value) {
                                      // Update the text controller or perform an action on selection
                                      statecontroller.text = value!;
                                    },
                                    items: stateCodeList.map((selectedState) {
                                      return DropdownMenuItem(
                                        value: selectedState,
                                        child: Text(
                                          selectedState,
                                          style: TextStyle(
                                            fontSize: 12.rf(context),
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "regulartext",
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                      border: InputBorder.none,
                                      hintText: "Select State",
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
                                  );
                                }

                                if (state is StatecodeblocError) {
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    _showErrorSnackBar(
                                      statecodeModel?.responseMessage ?? "An error occurred",
                                    );
                                  });
                                }

                                return SizedBox();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.rh(context),
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
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.rw(context)),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 14.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: districtcontroller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "District",
                                hintStyle: TextStyle(
                                    fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(
                                    fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your District';
                                }
                                // Add more validation rules if needed
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.rw(context),
                        ),
                        Container(
                          height: 50.rh(context),
                          width: 130.rw(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.rw(context)),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 14.rf(context),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: villagepincode,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Pincode",
                                hintStyle: TextStyle(
                                    fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(
                                    fontSize: 10.rf(context),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Pincode';
                                }
                                // Add more validation rules if needed
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
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
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.rw(context)),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: verificationemail,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Email Id';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            // Add more validation rules if needed
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height:30.rh(context)
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          value: CibiDetalischeck,
                          onChanged: (bool? value) {
                        
                            setState(() {
                              CibiDetalischeck = value ?? false;
                            });
                          }),
                        Text(
                          "I  agree to  fetch my Cibil  Detalis",
                          style: TextStyle(
                              fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext",
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.rh(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 40.rw(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: const Color(0xff284389)),
                              onPressed: () {
                                NavigationService.push(Mobileotp());
                              },
                              child: Text(
                                "Previous",
                                style: TextStyle(
                                    fontSize: 20.rf(context),
                                    color: Colors.white,
                                    fontFamily: "boldtext"),
                              )),

                          ///Funcationn

                          BlocListener<PanverificationBloc,
                              PanverificationState>(
                            listener: (context, state) async {
                              final preferences =
                                  await SharedPreferences.getInstance();
                              if (state is PanverificationblocLoading) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                );
                              }
                              if (state is PanverificationblocLoaded) {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                verificationpan =state.panverificationModel;
                                if (verificationpan?.status.toString() == "Success") {
                                  final panusername=verificationpan?.result?.pANDetails?.name.toString();
                                  preferences.setString("panusername", panusername??"");
                                  ///EmailApi Call
                                  BlocProvider.of<EmailupadateBloc>(context)
                                      .add(
                                    FetchEmailupadate(
                                      userid:
                                          preferences.getString("Userid") ?? "",
                                      Customercode: preferences
                                              .getString("CustomerCode") ??
                                          "",
                                      Emailid: verificationemail.text,
                                      ctx: context,
                                    ),
                                  );
                                }
                              }
                              if (state is PanverificationblocError) {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                _showErrorSnackBar(state.Errormessage);
                              }
                            },
                            child: BlocListener<EmailupadateBloc,
                                EmailupadateState>(
                              listener: (context, state) async {
                                final preferences =
                                    await SharedPreferences.getInstance();
                                if (state is EmailupadateblocLoading) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                  );
                                }
                                if (state is EmailupadateblocLoaded) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  isEmailupadate =state.emailupdateModel;
                                  if (isEmailupadate?.status.toString() ==
                                      "Success") {
                                    /// UpdateaddressApi call
                                    BlocProvider.of<UpadateaddressBloc>(context)
                                        .add(
                                      FetchUpadteaddress(
                                        userid:
                                            preferences.getString("Userid") ??
                                                "",
                                        Customercode: preferences
                                                .getString("CustomerCode") ??
                                            "",
                                        applicationId: preferences
                                                .getString("applicationid") ??
                                            "",
                                        Address1: Address1contoller.text,
                                        Address2: Address2contoller.text,
                                        Address3: Address3controller.text,
                                        City: citycontroller.text,
                                        State: statecontroller.text,
                                        Pincode: villagepincode.text,
                                        District: districtcontroller.text,
                                        ctx: context,
                                      ),
                                    );
                                  }
                                }
                                if (state is EmailupadateblocError) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  _showErrorSnackBar(state.errormessage);
                                }
                              },
                              child: BlocListener<UpadateaddressBloc,
                                  UpadateaddressState>(
                                listener: (context, state) async {
                                  log("updateAddress verification $state");
                                  final preferences =
                                      await SharedPreferences.getInstance();
                                  if (state is UpadateaddressblocLoading) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                    );
                                  }
                                  if (state is UpadateaddressblocLoaded) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    isaddressupadate =state.upadateaddressModel;
                                    if (isaddressupadate?.status.toString() ==
                                        "Success") {
                                      ///CustomeronbordingApi call
                                      context.read<CibilscoreBloc>().add(FetchCilbilscore(
                                          userid:preferences.getString("Userid")??"" ,
                                          Customercode: preferences.getString("CustomerCode")??"",
                                          ApplicationId: preferences.getString("applicationid")??"",
                                          PAN: pannumber.text,
                                          Name: preferences.getString("panusername")??"",
                                          Address: Address1contoller.text,
                                          City: citycontroller.text,
                                          State:statecontroller.text ,
                                          Pincode: villagepincode.text,
                                          Dob: dateInput.text,
                                          ctx: context));
                                    }
                                  }
                                  if (state is UpadateaddressblocError) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    _showErrorSnackBar(state.Errormessage);
                                  }
                                },
                                child: BlocListener<CibilscoreBloc, CibilscoreState>(
                                listener: (context, state)async {
                                  final preferences = await SharedPreferences.getInstance();
                                    log("cilbilscore=$state");
                                    if(state is CibilscoreblocLoaded){
                                      iscibilscoreModel=state.cibilscoreModel;
                                      if(iscibilscoreModel?.status=="Success"){
                                        BlocProvider.of<CustomeronbordingBloc>(
                                            context)
                                            .add(
                                          FetchCustomeronbording(
                                            userid:
                                            preferences.getString("Userid") ??
                                                "",
                                            Customercode: preferences
                                                .getString("CustomerCode") ??
                                                "",
                                            partnercode: preferences
                                                .getString("partnercode") ??
                                                "",
                                            agentcode: preferences
                                                .getString("agentcode") ??
                                                "",
                                            ctx: context,
                                          ),
                                        );
                                      }
                                    }
                                    if(state is CibilscoreblocError){
                                      _showErrorSnackBar(state.Errormessage);
                                    }
                                },
                                 child: BlocListener<CustomeronbordingBloc,
                                    CustomeronbordingState>(
                                  listener: (context, state) async {
                                    log("customeronbording pan verification $state");
                                    final preferences = await SharedPreferences.getInstance();
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
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      ispancustomerstatuts = state.customeronbordingstatusModel;
                                      if (ispancustomerstatuts?.status.toString() ==
                                          "Success") {
                                        Pageorder2 = ispancustomerstatuts?.result?.pageOrder.toString();

                                        ///Customerupdatenextprocess
                                        BlocProvider.of<CustomerupdatenextBloc>(context).add(
                                          FetchCustomerupdate(
                                            userid: preferences.getString("Userid") ??
                                                "",
                                            Customercode: preferences.getString(
                                                    "CustomerCode") ??
                                                "",
                                            PartnerCode: preferences
                                                    .getString("partnercode") ??
                                                "",
                                            FlowId: preferences
                                                .getString("Flowid")
                                                .toString(),
                                            PageOrder: Pageorder2.toString(),
                                            ApplicationId:
                                                preferences.getString(
                                                        "applicationid") ??
                                                    "",
                                            PageType: preferences
                                                .getString("pagetype")
                                                .toString(),
                                            ctx: context,
                                          ),
                                        );
                                      }
                                    }
                                    if (state is CustomeronbordingblocError) {
                                          Navigator.of(context,rootNavigator: true).pop();
                                      _showErrorSnackBar(state.Errormessage);
                                    }
                                  },
                                  child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                                  listener: (context, state) async{
                                    final preferences = await SharedPreferences.getInstance();
                                    if(state is CustomerupdatenextblocLoading){
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
                                    if(state is CustomerupdatenextblocLoaded){
                                      Navigator.of(context,rootNavigator: true).pop();
                                      ispanupadatenextprocess=state.upadatenextprocessModel;
                                      if(ispanupadatenextprocess?.status=="Success"){
                                        /// Customeronbording2 Api call 
                                        BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                                            userid: preferences.getString("Userid")??"",
                                            Customercode: preferences.getString("CustomerCode")??"",
                                            partnercode: preferences.getString("partnercode")??"",
                                            agentcode: preferences.getString("agentcode")??"",
                                            ctx: context));
                                      }
                                      
                                    }
                                    if(state is CustomerupdatenextblocError){
                                      Navigator.of(context,rootNavigator: true).pop();
                                      _showErrorSnackBar(state.Errormessage);
                                    }
                                    },
                                     child: BlocListener<Customeronbording2Bloc, Customeronbording2State>(
                                       listener: (context, state) async{
                                         final preferences = await SharedPreferences.getInstance();
                                         if(state is Customeronbording2blocLoading){
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
                                         if(state is Customeronbording2blocLoaded){
                                           Navigator.of(context,rootNavigator: true).pop();
                                           ispancustomeronbordingvalue=state.customeronbording2model;
                                           if(ispancustomeronbordingvalue?.status=="Success"){
                                             pagename2=ispancustomeronbordingvalue?.result?.pageName??"";
                                             if(pagename2=="AadhaarVerification"){
                                               NavigationService.pushAndRemoveUntil(Aadhaarnumber(), (Route<dynamic>route) => false);
                                             }else{
                                               _showErrorSnackBar("not value pass the way");
                                             }
                                           }
                                         }
                                         if(state is Customeronbording2blocError){
                                           Navigator.of(context,rootNavigator: true).pop();
                                           _showErrorSnackBar(state.Errormessage);
                                         }
                                       },
                                     child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        backgroundColor:
                                            const Color(0xff284389)),
                                    onPressed: () async {
                                      final preferences =
                                          await SharedPreferences
                                              .getInstance();
                                      if (panverifcationkey.currentState!.validate()) {
                                        if (CibiDetalischeck) {
                                          BlocProvider.of<
                                              PanverificationBloc>(
                                              context)
                                              .add(
                                            FetchPanverification(
                                              userid: preferences
                                                  .getString("Userid") ??
                                                  "",
                                              Customercode:
                                              preferences.getString(
                                                  "CustomerCode") ??
                                                  "",
                                              PAN: pannumber.text,
                                              ApplicationId:
                                              preferences.getString(
                                                  "applicationid") ??
                                                  "",
                                              ctx: context,
                                            ),
                                          );
                                        }else{
                                          _showErrorSnackBar("Enable  to check box");
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontSize: 20.rf(context),
                                        color: Colors.white,
                                        fontFamily: "boldtext",
                                      ),
                                    ),
                                  ),
),
),
                                ),
),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height:50.rh(context)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
// void Panverifactionstart() async {
//   final preferences = await SharedPreferences.getInstance();
//
//   setState(() {
//     isLoading = true; // Show loading indicator
//   });
//
//   try {
//     // PAN Verification
//  //   await Future.delayed(Duration(seconds: 3));
//      BlocProvider.of<PanverificationBloc>(context).add(
//       FetchPanverification(
//         userid: preferences.getString("Userid") ?? "",
//         Customercode: preferences.getString("CustomerCode") ?? "",
//         PAN: pannumber.text,
//         ApplicationId: preferences.getString("applicationid") ?? "",
//         ctx: context,
//       ),
//     );
//   } catch (error) {
//     _showErrorSnackBar(verificationpan.responseMessage.toString());
//     // debugPrint("PAN Verification failed: $error");
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(content: Text("PAN Verification failed. Continuing with the next step.")),
//     // );
//   }
//
//   try {
//     // Email Update
//    // await Future.delayed(Duration(seconds: 3));
//      BlocProvider.of<EmailupadateBloc>(context).add(
//       FetchEmailupadate(
//         userid: preferences.getString("Userid") ?? "",
//         Customercode: preferences.getString("CustomerCode") ?? "",
//         Emailid: verificationemail.text,
//         ctx: context,
//       ),
//     );
//   } catch (error) {
//     _showErrorSnackBar(isEmailupadate.responseMessage.toString());
//
//   }
//
//   try {
//     // Address Update
//   //  await Future.delayed(Duration(seconds: 3));
//     BlocProvider.of<UpadateaddressBloc>(context).add(
//       FetchUpadteaddress(
//         userid: preferences.getString("Userid") ?? "",
//         Customercode: preferences.getString("CustomerCode") ?? "",
//         applicationId: preferences.getString("applicationid") ?? "",
//         Address1: Address1contoller.text,
//         Address2: Address2contoller.text,
//         Address3: Address3controller.text,
//         City: citycontroller.text,
//         State: statecontroller.text,
//         Pincode: villagepincode.text,
//         District: districtcontroller.text,
//         ctx: context,
//       ),
//     );
//   } catch (error) {
//     _showErrorSnackBar(isaddressupadate.responseMessage.toString());
//   }
//
//   try {
//     // Customer Onboarding
//   //  await Future.delayed(Duration(seconds: 3));
//     BlocProvider.of<CustomeronbordingBloc>(context).add(
//       FetchCustomeronbording(
//         userid: preferences.getString("Userid") ?? "",
//         Customercode: preferences.getString("CustomerCode") ?? "",
//         partnercode: preferences.getString("partnercode") ?? "",
//         agentcode: preferences.getString("agentcode") ?? "",
//         ctx: context,
//       ),
//     );
//   } catch (error) {
//     _showErrorSnackBar(iscustomerstatuts.responseMessage.toString());
//   }
//
//   try {
//     // Customer Update
//    // await Future.delayed(Duration(seconds: 3));
//   BlocProvider.of<CustomerupdateBloc>(context).add(
//       FetchCustomerupdate(
//         userid: preferences.getString("Userid") ?? "",
//         Customercode: preferences.getString("CustomerCode") ?? "",
//         PartnerCode: preferences.getString("partnercode") ?? "",
//         FlowId: Flowid2.toString(),
//         PageOrder: Pageorder2.toString(),
//         ApplicationId: preferences.getString("applicationid") ?? "",
//         PageType: pagetype2.toString(),
//         ctx: context,
//       ),
//     );
//   } catch (error) {
//     _showErrorSnackBar(isupadatenextprocess.responseMessage.toString());
//   }
//
//   try {
//     // Final Customer Onboarding Step
//    // Future.delayed(Duration(seconds: 3));
//      BlocProvider.of<Customeronbording2Bloc>(context).add(
//       FetchCustomeronbording2(
//         userid: preferences.getString("Userid") ?? "",
//         Customercode: preferences.getString("CustomerCode") ?? "",
//         partnercode: preferences.getString("partnercode") ?? "",
//         agentcode: preferences.getString("agentcode") ?? "",
//         ctx: context,
//       ),
//     );
//   } catch (error) {
//     _showErrorSnackBar(Customeronbording2value.responseMessage.toString());
//   }
//
//   setState(() {
//     isLoading = false; // Hide loading indicator
//   });
// }
}
