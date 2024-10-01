import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Upadateaddress_bloc/upadateaddress_bloc.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/panverificationModel/PanverificationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Emailupdate_bloc/emailupadate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Panverification_blocs/panverification_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingStatusModel.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import '../../modeles/customeronboradingModel/EmailupadteModel/EmailupdateModel.dart';
import '../../modeles/customeronboradingModel/UpadateaddressModel/UpadateaddaressModel.dart';
import 'Customer_onbording_mobile.dart';
import 'addhaar number.dart';

class Panverfication extends StatefulWidget {
  const Panverfication({super.key});

  @override
  State<Panverfication> createState() => _PanverficationState();
}

TextEditingController pannumber = TextEditingController();
TextEditingController dateInput = TextEditingController();
TextEditingController Address1contoller = TextEditingController();
TextEditingController Address2contoller = TextEditingController();
TextEditingController Address3controller = TextEditingController();
TextEditingController citycontroller = TextEditingController();
TextEditingController statecontroller = TextEditingController();//
TextEditingController districtcontroller = TextEditingController();
TextEditingController villagepincode = TextEditingController();
TextEditingController verificationemail = TextEditingController();
late PanverificationModel verificationpan;
late EmailupdateModel isEmailupadate;
late UpadateaddressModel isaddressupadate;
late CustomeronbordingstatusModel iscustomerstatuts;
late UpadatenextprocessModel isupadatenextprocess;
bool CibiDetalischeck = false;
String? selectedtype;
String? Flowid1;
String? Pageorder1;

class _PanverficationState extends State<Panverfication> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context)
        .add(FetchMerchartToken(userName: "Test", password: tokenpassword));
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    setState(() {
      pannumber.clear();
      dateInput.clear();
      Address1contoller.clear();
      Address2contoller.clear();
      Address3controller.clear();
      citycontroller.clear();
      statecontroller.clear();
      districtcontroller.clear();
      villagepincode.clear();
      verificationemail.clear();
    });

    // TODO: implement dispose
    super.dispose();
  }

  final GlobalKey<FormState> panverifcationkey = GlobalKey<FormState>();
  List<String> stateinindia = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: mwidth * 0.1),
              child: Form(
                key: panverifcationkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mheight * 0.15,
                    ),
                    const Text(
                      "PAN Verification",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: mheight * 0.05,
                    ),
                    Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: pannumber,
                          onChanged: (text) {
                            String validText = text.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
                            pannumber.value = TextEditingValue(
                              text: validText,
                              selection: TextSelection.fromPosition(
                                TextPosition(offset: validText.length),
                              ),
                            );
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "PAN",
                            hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10,
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
                      height: mheight * 0.03,
                    ),
                    Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.8,
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
                                controller: dateInput,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "Date",
                                  hintStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                  errorStyle: TextStyle(
                                      fontSize: 10,
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
                      height: mheight * 0.03,
                    ),
                    Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: Address1contoller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Addaress1",
                            hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10,
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
                      height: mheight * 0.03,
                    ),
                    Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: Address2contoller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Addaress2",
                            hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10,
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
                      height: mheight * 0.03,
                    ),
                    Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: Address3controller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Addaress3",
                            hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10,
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
                      height: mheight * 0.03,
                    ),
                    Row(
                      children: [
                        Container(
                          height: mheight * 0.06,
                          width: mwidth * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.03),
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: citycontroller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "City",
                                hintStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(
                                    fontSize: 10,
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
                          width: mwidth * 0.1,
                        ),
                        Container(
                          height: mheight * 0.06,
                          width: mwidth * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: mwidth * 0.03),
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down),
                              onChanged: (value) {
                                setState(() {
                                  statecontroller.text = value!;
                                });
                              },
                              items: stateinindia.map((selectedstate) {
                                return DropdownMenuItem(
                                  value: selectedstate,
                                  child: Text(
                                    selectedstate,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext",
                                    ),
                                  ),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                // Adjust content padding as needed
                                border: InputBorder.none,
                                // Remove the border
                                hintText: "Select State",
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
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mheight * 0.03,
                    ),
                    Row(
                      children: [
                        Container(
                          height: mheight * 0.06,
                          width: mwidth * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.03),
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: districtcontroller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "District",
                                hintStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(
                                    fontSize: 10,
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
                          width: mwidth * 0.1,
                        ),
                        Container(
                          height: mheight * 0.06,
                          width: mwidth * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.03),
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: villagepincode,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Pincode",
                                hintStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: TextStyle(
                                    fontSize: 10,
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
                      height: mheight * 0.03,
                    ),
                    Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: verificationemail,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10,
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
                      height: mheight * 0.03,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey)),
                            value: CibiDetalischeck,
                            onChanged: (bool? value) {
                              setState(() {
                                CibiDetalischeck = value ?? false;
                              });
                            }),
                        const Text(
                          "I  agree to  fetch my Cibil  Detalis",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              fontFamily: "boldtext",
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mheight * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: const Color(0xff284389)),
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Customer_onbording_mobile()),
                                    (route) => false);
                              },
                              child: const Text(
                                "Previous",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontFamily: "regulartext"),
                              )),
                          BlocListener<PanverificationBloc, PanverificationState>(
  listener: (context, state) async{
    final preferences = await SharedPreferences.getInstance();
    if (state is PanverificationblocLoading) {
      CircularProgressIndicator();
    }
    else if (mounted) {
      Navigator.of(context).pop();
    }
    if (state is PanverificationblocLoaded) {
      verificationpan = BlocProvider.of<PanverificationBloc>(context).iscustomerverification;
      if (verificationpan.status.toString() == "Success") {
      } else {
        _showErrorSnackBar(
            verificationpan.errorMessage.toString());
      }
    }
    // TODO: implement listener
  },
  child: BlocListener<EmailupadateBloc, EmailupadateState>(
  listener: (context, state) async{
    final preferences = await SharedPreferences.getInstance();
    if (state is EmailupadateblocLoading) {
      CircularProgressIndicator();
    }else if (mounted) {
      // Ensure context is valid before dismissing the dialog
      Navigator.of(context).pop();
    }
    if (state is EmailupadateblocLoaded) {
      isEmailupadate =
          BlocProvider.of<EmailupadateBloc>(context)
              .isemailupadate;
      if (isEmailupadate.status.toString() == "Success") {
      }else {
        _showErrorSnackBar(
            isEmailupadate.errorMessage.toString());
      }
    }
    // TODO: implement listener
  },
  child: BlocListener<UpadateaddressBloc, UpadateaddressState>(
  listener: (context, state) async{
    final preferences = await SharedPreferences.getInstance();
    if(state is UpadateaddressblocLoading){
      CircularProgressIndicator();
    }else if (mounted) {
      // Ensure context is valid before dismissing the dialog
      Navigator.of(context).pop();
    }
    if(state is UpadateaddressblocLoaded) {
      isaddressupadate = BlocProvider
          .of<UpadateaddressBloc>(context)
          .isupadateaddress;
      if (isaddressupadate.status.toString()== "Success") {
      } else {
        _showErrorSnackBar(
            isaddressupadate.errorMessage.toString());
      }
    }
    // TODO: implement listener
  },
  child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
  listener: (context, state) {
    if(state is CustomeronbordingblocLoading){
      CircularProgressIndicator();
    }
    if(state is CustomeronbordingblocLoaded){
      iscustomerstatuts=BlocProvider.of<CustomeronbordingBloc>(context).isCustomeronbording;
      if(iscustomerstatuts.status.toString()=="Success"){
        Pageorder1= iscustomerstatuts.result?.pageOrder.toString();
        Flowid1=iscustomerstatuts.result?.flowId.toString();
        
      }else {
        _showErrorSnackBar(
            iscustomerstatuts.errorMessage.toString());
      }
       
    }
    // TODO: implement listener
  },
  child: BlocListener<CustomerupdateBloc, CustomerupdateState>(
  listener: (context, state) {
    if(state is CustomerupdateblocLoading){
      CircularProgressIndicator();
    }
    if(state is CustomerupadateblocLoaded){
      isupadatenextprocess=BlocProvider.of<CustomerupdateBloc>(context).iscustomerupadate;
      if(isupadatenextprocess.result.toString()=="Success"){
      }
      else {
        _showErrorSnackBar(
        isupadatenextprocess.errorMessage.toString());
      }
    }
    // TODO: implement listener
  },
  child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(5)),
                                                            backgroundColor: const Color(0xff284389)),
                                                        onPressed: () async {
                                                          final preferences = await SharedPreferences.getInstance();
                                                          if (panverifcationkey.currentState!.validate()) {
                                                            try{
                                                              await Future.delayed(Duration(seconds: 1));
                                                              BlocProvider.of<PanverificationBloc>(context).add(FetchPanverification(
                                                                  userid:preferences.getString("Userid").toString(),
                                                                  Customercode: preferences.getString("CustomerCode").toString(),
                                                                  PAN:pannumber.text));
                                                            }catch(e){
                                                              _showErrorSnackBar(e.toString());
                                                              try{
                                                                await Future.delayed(Duration(seconds: 1));
                                                                BlocProvider.of<EmailupadateBloc>(context).add(FetchEmailupadate(
                                                                    userid: preferences.getString("Userid").toString(),
                                                                    Customercode: preferences.getString("CustomerCode").toString(),
                                                                    Emailid:verificationemail.text));
                                                              }catch(e){
                                                                _showErrorSnackBar(e.toString());
                                                              }
                                                            }
                                                            try{
                                                              await Future.delayed(Duration(seconds: 1));
                                                              BlocProvider.of<UpadateaddressBloc>(context).add(FetchUpadteaddress(
                                                                  userid:preferences.getString("Userid").toString() ,
                                                                  Customercode: preferences.getString("CustomerCode").toString(),
                                                                  Address1: Address1contoller.text,
                                                                  Address2: Address2contoller.text,
                                                                  Address3: Address3controller.text,
                                                                  City: citycontroller.text,
                                                                  State: statecontroller.text,
                                                                  Pincode: villagepincode.text,
                                                                  District: districtcontroller.text
                                                              ));
                                                            }catch(e){
                                                              _showErrorSnackBar(e.toString());
                                                            }
                                                            try{
                                                              await Future.delayed(Duration(seconds: 1));
                                                              BlocProvider.of<CustomeronbordingBloc>(context).add(
                                                                FetchCustomeronbording(
                                                                  userid: preferences.getString("Userid").toString(),
                                                                  Customercode: preferences.getString("CustomerCode").toString(),
                                                                ),
                                                              );
                                                            }catch(e){
                                                              _showErrorSnackBar(e.toString());
                                                            }
                                                            try{
                                                              await Future.delayed(Duration(seconds: 1));
                                                              BlocProvider.of<CustomerupdateBloc>(context).add(
                                                                FetchCustomerupdate(
                                                                  userid: preferences.getString("Userid").toString(),
                                                                  Customercode: preferences.getString("CustomerCode").toString(),
                                                                  PartnerCode:preferences.getString("partnercode").toString(),
                                                                  FlowId: Flowid1.toString(),
                                                                  PageOrder: Pageorder1.toString(),
                                                                ),
                                                              );
                                                            }catch(e){
                                                              _showErrorSnackBar(e.toString());
                                                            }
                                                            try{
                                                              await Future.delayed(Duration(seconds: 1));
                                                              BlocProvider.of<CustomeronbordingBloc>(context).add(
                                                                FetchCustomeronbording(
                                                                  userid: preferences.getString("Userid").toString(),
                                                                  Customercode: preferences.getString("CustomerCode").toString(),
                                                                ),
                                                              );
                                                            }
                                                            catch(e){
                                                              _showErrorSnackBar(e.toString());
                                                            }
                                                            if(mounted) {
                                                              Navigator.of(
                                                                  context).push(
                                                                  MaterialPageRoute(
                                                                      builder: (
                                                                          context) =>
                                                                          Aadhaarnumber()));
                                                            }
                                                          }else{
                                                            _showErrorSnackBar("no values this case");
                                                          }

                                                        },
                                                        child: const Text(
                                                          "Sumbit",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w800,
                                                              color: Colors.white,
                                                              fontFamily: "regulartext"),
                                                        ),
  ),
),
),
),
)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mheight * 0.05,
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 12, fontFamily: "font2"),
      ),
    ));
  }
}
