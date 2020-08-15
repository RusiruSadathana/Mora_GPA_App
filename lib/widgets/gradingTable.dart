import 'package:flutter/material.dart';
import 'package:mora_gpa/classes/Grade.dart';
import 'package:mora_gpa/classes/gradingCriteria.dart';
import 'package:mora_gpa/constants/styles.dart';

class GradingTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DataTable(
        columns: [
          DataColumn(label: Text('Grade', style: ktableHeaderStyle)),
          DataColumn(label: Text('Grade Point', style: ktableHeaderStyle)),
        ],
        rows: GradingCriteria.getGradingCriteria().map<DataRow>((Grade grade) {
          return DataRow(
            cells: [
              DataCell(
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(grade.grade, style: ktableDataStyle),
                  ),
                  onTap: null),
              DataCell(
                  Center(
                    child:
                        Text(grade.weight.toString(), style: ktableDataStyle),
                  ),
                  onTap: null),
            ],
            onSelectChanged: null,
          );
        }).toList(),
      ),
    );
  }
}
