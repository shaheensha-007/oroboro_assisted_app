import 'package:flutter/material.dart';

import '../Loan_detalis/loan_detalis.dart';

class Loan_appbar extends StatelessWidget {
  const Loan_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Loan_detalis()), (route) => false);
        },
            icon: const Icon(Icons.arrow_back_ios_new))
      ],
    );
  }
}
