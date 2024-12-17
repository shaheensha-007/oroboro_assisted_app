import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';

import 'loan_detalis.dart';

class Rejected extends StatefulWidget {
  const Rejected({super.key});

  @override
  State<Rejected> createState() => _RejectedState();
}
TextEditingController fromdate3=TextEditingController();
TextEditingController Todate3=TextEditingController();
class _RejectedState extends State<Rejected> {

  final DataTableSource _data = MyDataTable();
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.rh(context)
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color of the container
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2), // Shadow position
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: PaginatedDataTable(
                headingRowColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.blue[100]; // Header row background color
                }),
                arrowHeadColor: Colors.black,
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Loan Number')),
                  DataColumn(label: Text('Loan Amount')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Product Value')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Username')),
                  DataColumn(label: Text('Merchant Name')),
                  DataColumn(label: Text('Delivery Name')),
                ],
                source: _data,
                columnSpacing: 50,
                rowsPerPage: 7,
                showCheckboxColumn: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
