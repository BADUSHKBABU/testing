import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class PlutoGridtable extends StatefulWidget {
  PlutoGridtable({Key? key}) : super(key: key);


  @override
  State<PlutoGridtable> createState() => _PlutoGridtableState();
}

class _PlutoGridtableState extends State<PlutoGridtable> {

  bool isFilterPlutoGridColumn = true;
  bool isGstFieldHide = true;
  bool ispartyscreen = false;
  bool isContactdetails = true;
  bool isRegistration=true;
  bool ismore=true;
  TextEditingController texteditingcontroller = TextEditingController();
  TextEditingController numericcontroller = TextEditingController();



  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      enableFilterMenuItem: false,
      backgroundColor: Colors.yellow,
      enableRowDrag: true,
      title: 'sl no',
      field: 'sl no',
      type: PlutoColumnType.number(defaultValue: 0),
    ),
    PlutoColumn(
      title: 'Bill date',
      field: 'Bill date',
      type: PlutoColumnType.date(),
    ),
    PlutoColumn(
      title: 'Bill no',
      field: 'Bill no',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Credit days',
      field: 'Credit days',
      type: PlutoColumnType.date()
    ),
    PlutoColumn(
      frozen: PlutoColumnFrozen.none,
      title: 'Receivable amount',
      field: 'Receivable amount',
      type: PlutoColumnType.currency(format: "₹"),
    ),
    PlutoColumn(
      title: 'Payable amount',
      field: 'Payable amount',
      type: PlutoColumnType.currency(format: "₹"),
    ),

    // PlutoColumn(
    //   title: 'salary',
    //   field: 'salary',
    //   type: PlutoColumnType.currency(format: "₹"),
    //   footerRenderer: (rendererContext) {
    //     return PlutoAggregateColumnFooter(
    //       rendererContext: rendererContext,
    //       formatAsCurrency: true,
    //       type: PlutoAggregateColumnType.sum,
    //       format: '#,###',
    //       alignment: Alignment.center,
    //       titleSpanBuilder: (text) {
    //         return [
    //           const TextSpan(
    //             text: 'Sum',
    //             style: TextStyle(color: Colors.red),
    //           ),
    //           const TextSpan(text: ' :'),
    //           TextSpan(text: text),
    //         ];
    //       },
    //     );
    //   },
    // ),
  ];

  ///values in each row
  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'sl no': PlutoCell(value: ''),
        'Bill date': PlutoCell(
            value:""),
        'Bill no': PlutoCell(value: ""),
        'Credit days': PlutoCell(value: ''),
        'Receivable amount': PlutoCell(value: ''),
        'Payable amount': PlutoCell(value: ""),

      },
    ),
  //   PlutoRow(
  //     cells: {
  //       'id': PlutoCell(value: 'user2'),
  //       'name': PlutoCell(value: 'Jack'),
  //       'age': PlutoCell(value: 25),
  //       'role': PlutoCell(value: 'Designer'),
  //       'item': PlutoCell(value: 'b'),
  //       'qty': PlutoCell(value: 5),
  //       'amt': PlutoCell(value: 150),
  //       "total": PlutoCell(value: 'amt' + 'qty'),
  //       "gst": PlutoCell(value: ""),
  //       'joined': PlutoCell(value: '2021-02-01'),
  //       'working_time': PlutoCell(value: '10:00'),
  //       'salary': PlutoCell(value: 400),
  //       "days": PlutoCell(value: 6)
  //     },
  //   ),
  //   PlutoRow(
  //     cells: {
  //       'id': PlutoCell(value: 'user3'),
  //       'name': PlutoCell(value: 'Suzi'),
  //       'age': PlutoCell(value: 40),
  //       'role': PlutoCell(value: 'Owner'),
  //       'item': PlutoCell(value: 'c'),
  //       'qty': PlutoCell(value: 4),
  //       'amt': PlutoCell(value: 150),
  //       "total": PlutoCell(value: 'amt' + 'qty'),
  //       "gst": PlutoCell(value: ""),
  //       'joined': PlutoCell(value: '2021-03-01'),
  //       'working_time': PlutoCell(value: '11:00'),
  //       'salary': PlutoCell(value: 700),
  //       "days": PlutoCell(value: 6)
  //     },
  //   ),
  // ];

  /// columnGroups that can group columns can be omitted.
  // final List<PlutoColumnGroup> columnGroups = [
  //   PlutoColumnGroup(
  //     title: 'Sl no',
  //     fields: ['Sl no'],
  //     expandedColumn: true,
  //   ),
  //   PlutoColumnGroup(title: 'User information', fields: ['name', 'age']),
  //   PlutoColumnGroup(title: 'Status', children: [
  //     PlutoColumnGroup(title: 'sa', fields: ['role'], expandedColumn: true),
  //     PlutoColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
  //   ]),
  ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      addNewColumn();
                    });
                  },
                  tooltip: "add column",
                  icon: Icon(Icons.near_me)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      addNewRow();
                    });
                  },
                  tooltip: "Add row",
                  icon: Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      removeRow();
                    });
                  },
                  tooltip: "remove current row",
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isFilterPlutoGridColumn = !isFilterPlutoGridColumn;
                      stateManager.setShowColumnFilter(isFilterPlutoGridColumn);
                    });
                  },
                  tooltip: "filter cell",
                  icon: Icon(Icons.filter_alt_rounded)),
              IconButton(
                  tooltip: "export to pdf",
                  onPressed: () {
                    setState(() {
                      generateAndExportPDF();
                    });
                  },
                  icon: Icon(Icons.picture_as_pdf))
            ],
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
              padding: const EdgeInsets.all(0),
              child: PlutoGrid(
                columns: columns,
                rows: rows,
               // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  stateManager = event.stateManager;

                  stateManager.setShowColumnFilter(true);
                  ///hide column
                  // stateManager.hideColumn(
                  //     PlutoColumn(
                  //         title: 'gst',
                  //         field: 'gst',
                  //         type: PlutoColumnType.number()),
                  //     isGstFieldHide);

                  print("state $isFilterPlutoGridColumn");

                  //SELECT MULTIPLE ROWS BY PRESSING SHIFT+ARROW KEY
                  event.stateManager
                      .setSelectingMode(PlutoGridSelectingMode.row);
                  stateManager = event.stateManager;
                },
                // onChanged: (PlutoGridOnChangedEvent event) {
                //   //total amount
                //   totalAmount(event);
                //   // adding new row oin entter press ,if the row is last one
                //   if (stateManager.currentRowIdx ==
                //       stateManager.rows.length - 1) {
                //     addNewRow();
                //   }
                // },
                configuration: const PlutoGridConfiguration(
                  enableMoveHorizontalInEditing: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addNewRow() {
    final newRow = PlutoRow(
      cells: {
        'sl no': PlutoCell(value: ''),
        'Bill date': PlutoCell(value: ''),
        'Bill no': PlutoCell(value:"" ),
        'Credit days': PlutoCell(value: ''),
        'Receivable amount': PlutoCell(value: ''),
        'Payable amount': PlutoCell(value:"" ),
        // 'amt': PlutoCell(value:"" ),
        // 'total': PlutoCell(value:"" ), // Initially set to qty * amt
        // 'gst': PlutoCell(value:"" ),
        // 'joined': PlutoCell(value: ""),
        // 'working_time': PlutoCell(value: ''),
        // 'salary': PlutoCell(value: ""),
      },
    );
    // Insert the new row at the bottom
    stateManager
        .insertRows(stateManager.rows.length, [newRow]); // Inserts at the bottom
  }

  void removeRow() {
    stateManager.removeCurrentRow();
  }

  void addNewColumn() {
    final newColumn =
    PlutoColumn(title: "", field: "", type: PlutoColumnType.text());
    // Insert the new row at the bottom
    stateManager.insertColumns(
        stateManager.columns.length, [newColumn]); // Inserts at the bbottom
  }

  // void totalAmount(PlutoGridOnChangedEvent event) {
  //   // Check if the changed column is either 'qty' or 'amt'
  //   if (event.column.field == 'qty' || event.column.field == 'amt') {
  //     // Fetch the updated 'qty' and 'amt' values
  //     final qty = event.row.cells['qty']!.value as int;
  //     final amt = event.row.cells['amt']!.value as int;
  //
  //     // Calculate the total and gst
  //     final total = qty * amt;
  //     final gst = total / 12;
  //     // Update the 'total' and 'gst' values for the current row
  //     setState(() {
  //       event.row.cells['total']!.value = total; // Update total cell
  //       event.row.cells['gst']!.value = gst; // Update gst cell
  //     });
  //   }
  // }

  //export  to pdf
  Future<void> generateAndExportPDF() async {
    final pdf = pw.Document();

    // Add a page
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text("PlutoGrid Table Data",
                  style: pw.TextStyle(fontSize: 24)),
              pw.Table.fromTextArray(
                headers: columns.map((column) => column.title).toList(),
                data: rows.map((row) {
                  return row.cells.values
                      .map((cell) => cell.value.toString())
                      .toList();
                }).toList(),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }



}
