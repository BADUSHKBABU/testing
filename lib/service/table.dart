import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class tablwwidget extends StatefulWidget {
  const tablwwidget({super.key});

  @override
  State<tablwwidget> createState() => _tablwwidgetState();
}
final List<PlutoColumn> columns = <PlutoColumn>[
  PlutoColumn(
    enableFilterMenuItem: false,
    backgroundColor: Colors.yellow,
    enableRowDrag: true,
    title: 'Id',
    field: 'id',
    type: PlutoColumnType.text(),
  ),
  PlutoColumn(
    title: 'Name',
    field: 'name',
    type: PlutoColumnType.text(),
  ),
  PlutoColumn(
    title: 'Age',
    field: 'age',
    type: PlutoColumnType.number(),
  ),
  PlutoColumn(
    title: 'Role',
    field: 'role',
    type: PlutoColumnType.select(<String>[
      FirebaseFirestore.instance.collection("table").id,
      'Designer',
      'Owner',
    ]),
  ),
  PlutoColumn(
    frozen: PlutoColumnFrozen.none,
    title: 'ITEM',
    field: 'item',
    type: PlutoColumnType.text(),
  ),
  PlutoColumn(
    title: 'qty',
    field: 'qty',
    type: PlutoColumnType.number(),
  ),
  PlutoColumn(
    title: 'amt',
    field: 'amt',
    type: PlutoColumnType.number(),
  ),
  PlutoColumn(
    readOnly: true,
    title: 'total',
    field: 'total',
    type: PlutoColumnType.number(),
  ),
  PlutoColumn(
    hide: true,
    title: 'gst',
    field: 'gst',
    type: PlutoColumnType.number(),
  ),
  PlutoColumn(
    title: 'Joined',
    field: 'joined',
    type: PlutoColumnType.date(),
  ),
  PlutoColumn(
    title: 'Working time',
    field: 'working_time',
    type: PlutoColumnType.time(),
  ),
  PlutoColumn(
    title: 'salary',
    field: 'salary',
    type: PlutoColumnType.currency(format: "₹"),
    footerRenderer: (rendererContext) {
      return PlutoAggregateColumnFooter(
        rendererContext: rendererContext,
        formatAsCurrency: true,
        type: PlutoAggregateColumnType.sum,
        format: '#,###',
        alignment: Alignment.center,
        titleSpanBuilder: (text) {
          return [
            const TextSpan(
              text: 'Sum',
              style: TextStyle(color: Colors.red),
            ),
            const TextSpan(text: ' :'),
            TextSpan(text: text),
          ];
        },
      );
    },
  ),
];

final List<PlutoRow> rows = [
  PlutoRow(
    cells: {
      'id': PlutoCell(value: 'user1'),
      'name': PlutoCell(
          value: FirebaseFirestore.instance.collection("table").doc("name")),
      'age': PlutoCell(value: 20),
      'role': PlutoCell(value: 'Programmer'),
      'item': PlutoCell(value: 'a'),
      'qty': PlutoCell(value: 5),
      'amt': PlutoCell(value: 200),
      "total": PlutoCell(value: 0),
      "gst": PlutoCell(value: ""),
      'joined': PlutoCell(value: '2021-01-01'),
      'working_time': PlutoCell(value: '09:00'),
      'salary': PlutoCell(value: 300),
      "days": PlutoCell(value: 6)
    },
  ),
  PlutoRow(
    cells: {
      'id': PlutoCell(value: 'user2'),
      'name': PlutoCell(value: 'Jack'),
      'age': PlutoCell(value: 25),
      'role': PlutoCell(value: 'Designer'),
      'item': PlutoCell(value: 'b'),
      'qty': PlutoCell(value: 5),
      'amt': PlutoCell(value: 150),
      "total": PlutoCell(value: 'amt' + 'qty'),
      "gst": PlutoCell(value: ""),
      'joined': PlutoCell(value: '2021-02-01'),
      'working_time': PlutoCell(value: '10:00'),
      'salary': PlutoCell(value: 400),
      "days": PlutoCell(value: 6)
    },
  ),
  PlutoRow(
    cells: {
      'id': PlutoCell(value: 'user3'),
      'name': PlutoCell(value: 'Suzi'),
      'age': PlutoCell(value: 40),
      'role': PlutoCell(value: 'Owner'),
      'item': PlutoCell(value: 'c'),
      'qty': PlutoCell(value: 4),
      'amt': PlutoCell(value: 150),
      "total": PlutoCell(value: 'amt' + 'qty'),
      "gst": PlutoCell(value: ""),
      'joined': PlutoCell(value: '2021-03-01'),
      'working_time': PlutoCell(value: '11:00'),
      'salary': PlutoCell(value: 700),
      "days": PlutoCell(value: 6)
    },
  ),
];

/// columnGroups that can group columns can be omitted.
final List<PlutoColumnGroup> columnGroups = [
  PlutoColumnGroup(
    title: 'Id',
    fields: ['id'],
    expandedColumn: true,
  ),
  PlutoColumnGroup(title: 'User information', fields: ['name', 'age']),
  PlutoColumnGroup(title: 'Status', children: [
    PlutoColumnGroup(title: 'sa', fields: ['role'], expandedColumn: true),
    PlutoColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
  ]),
];

/// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
/// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
late PlutoGridStateManager stateManager;
bool isGstFieldHide=false;


class _tablwwidgetState extends State<tablwwidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(0),
      child: PlutoGrid(
        columns: columns,
        rows: rows,
        columnGroups: columnGroups,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;

          stateManager.setShowColumnFilter(true);
          stateManager.hideColumn(
              PlutoColumn(
                  title: 'gst',
                  field: 'gst',
                  type: PlutoColumnType.number()),
              isGstFieldHide);

          //  print("state $isFilterPlutoGridColumn");

          //SELECT MULTIPLE ROWS BY PRESSING SHIFT+ARROW KEY
          event.stateManager
              .setSelectingMode(PlutoGridSelectingMode.row);
          stateManager = event.stateManager;
        },
        onChanged: (PlutoGridOnChangedEvent event) {
          //total amount
          totalAmount(event);
          // adding new row oin entter press ,if the row is last one
          if (stateManager.currentRowIdx ==
              stateManager.rows.length - 1) {
            addNewRow();
          }
        },
        configuration: const PlutoGridConfiguration(
          enableMoveHorizontalInEditing: true,
        ),
      ),
    );
  }


  void addNewRow() {
    final newRow = PlutoRow(
      cells: {
        'id': PlutoCell(value: ''),
        'name': PlutoCell(value: ''),
        'age': PlutoCell(value: 30),
        'role': PlutoCell(value: ''),
        'item': PlutoCell(value: ''),
        'qty': PlutoCell(value: 1),
        'amt': PlutoCell(value: 100),
        'total': PlutoCell(value: 100), // Initially set to qty * amt
        'gst': PlutoCell(value: 100 / 12),
        'joined': PlutoCell(value: '2022-01-01'),
        'working_time': PlutoCell(value: '09:00'),
        'salary': PlutoCell(value: 1000),
      },
    );
    // Insert the new row at the top
    stateManager
        .insertRows(stateManager.rows.length, [newRow]); // Inserts at the top
  }

  void removeRow() {
    stateManager.removeCurrentRow();
  }

  void addNewColumn() {
    final newColumn =
    PlutoColumn(title: "", field: "", type: PlutoColumnType.text());
    // Insert the new row at the top
    stateManager.insertColumns(
        stateManager.columns.length, [newColumn]); // Inserts at the top
  }

  void totalAmount(PlutoGridOnChangedEvent event) {
    // Check if the changed column is either 'qty' or 'amt'
    if (event.column.field == 'qty' || event.column.field == 'amt') {
      // Fetch the updated 'qty' and 'amt' values
      final qty = event.row.cells['qty']!.value as int;
      final amt = event.row.cells['amt']!.value as int;

      // Calculate the total and gst
      final total = qty * amt;
      final gst = total / 12;
      // Update the 'total' and 'gst' values for the current row
      setState(() {
        event.row.cells['total']!.value = total; // Update total cell
        event.row.cells['gst']!.value = gst; // Update gst cell
      });
    }
  }

}
