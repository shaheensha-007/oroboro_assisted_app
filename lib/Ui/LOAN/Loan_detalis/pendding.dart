import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  bool showButtons = false;

  // Sample Data for the DataTable rows
  final List<Map<String, String>> _tableData = [
    {
      'Fromdate': '01/01/2024',
      'Name': 'John Doe',
      'Loan Number': '123456',
      'Loan Amount': '50000',
      'Date': '05/01/2024',
      'Product Value': '70000',
      'Status': 'Pending',
      'Username': 'johndoe',
      'Merchant Name': 'ABC Store',
      'Delivery Name': 'DeliveryGuy1',
    },
    {
      'Fromdate': '02/01/2024',
      'Name': 'Jane Smith',
      'Loan Number': '789101',
      'Loan Amount': '75000',
      'Date': '06/01/2024',
      'Product Value': '90000',
      'Status': 'Approved',
      'Username': 'janesmith',
      'Merchant Name': 'XYZ Mart',
      'Delivery Name': 'DeliveryGuy2',
    },
    // Add more rows here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.rh(context)),
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
              scrollDirection: Axis.horizontal, // Allow horizontal scrolling
              child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blue[100]),
                columnSpacing: 50,
                columns: const [
                  DataColumn(label: Text('From Date')),
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
                rows: _tableData.map((row) {
                  return DataRow(cells: [
                    DataCell(Text(row['Fromdate']!)),
                    DataCell(Text(row['Name']!)),
                    DataCell(Text(row['Loan Number']!)),
                    DataCell(Text(row['Loan Amount']!)),
                    DataCell(Text(row['Date']!)),
                    DataCell(Text(row['Product Value']!)),
                    DataCell(Text(row['Status']!)),
                    DataCell(Text(row['Username']!)),
                    DataCell(Text(row['Merchant Name']!)),
                    DataCell(Text(row['Delivery Name']!)),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
