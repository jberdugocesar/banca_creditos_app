import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InteractiveDataTable extends StatefulWidget {
  const InteractiveDataTable(
      {super.key, required this.columnsText, required this.dataRows});
  final List<String> columnsText;
  final List<DataRow> dataRows;

  @override
  State<InteractiveDataTable> createState() => _InteractiveDataTableState();
}

class _InteractiveDataTableState extends State<InteractiveDataTable> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: <DataColumn>[
              ...widget.columnsText.map((columnText) =>
                  DataColumn(label: SizedBox(child: Text(columnText)))),
            ],
            rows: widget.dataRows,
          ),
        ),
      ),
    );
  }
}
