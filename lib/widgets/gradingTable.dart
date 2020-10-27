import 'package:flutter/material.dart';
import 'package:mora_gpa/classes/Grade.dart';
import 'package:mora_gpa/classes/ScreenSize.dart';
import 'package:mora_gpa/classes/gradingCriteria.dart';

class GradingTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenSize.getMinimumSize(context) * .023),
      child: DataTable(
        columns: [
          DataColumn(
              label: Text(
            'Grade',
            style: TextStyle(
              fontSize: ScreenSize.getMinimumSize(context) * .046,
              letterSpacing: 2,
            ),
          )),
          DataColumn(
            label: Text(
              'Grade Point',
              style: TextStyle(
                fontSize: ScreenSize.getMinimumSize(context) * .046,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
        rows: GradingCriteria.getGradingCriteria().map<DataRow>((Grade grade) {
          return DataRow(
            cells: [
              DataCell(
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenSize.getMinimumSize(context) * .0462),
                    child: Text(
                      grade.grade,
                      style: TextStyle(
                        fontSize: ScreenSize.getMinimumSize(context) * .046,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  onTap: null),
              DataCell(
                  Center(
                    child: Text(
                      grade.weight.toString(),
                      style: TextStyle(
                        fontSize: ScreenSize.getMinimumSize(context) * .050,
                        letterSpacing: 2,
                      ),
                    ),
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
