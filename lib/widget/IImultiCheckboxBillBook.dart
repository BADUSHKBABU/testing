import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../iitransaction.dart';


class IIMultiCheck extends StatefulWidget {
  final ValueNotifier<iiTransaction> controller;
  double height;
  double width;
  Axis direction;
  IIMultiCheck(
      {super.key,
        required this.controller,
        required this.width,
        required this.height,
        required this.direction });
  @override
  State<IIMultiCheck> createState() => _IIMultiCheckState();
}

class _IIMultiCheckState extends State<IIMultiCheck> {
  var isCustomer=1;
  var isTransporter=2;
  var isManufaturer=4;
  var isSupplier=8;
  String thevalue="";var s=0;


  @override
  Widget build(BuildContext context) {
    Widget child;
    child = ListView.builder(

        scrollDirection: widget.direction,
        itemCount: widget.controller.value.recordCount("list"),
        itemBuilder: (context, index) {
          bool v = widget.controller.value.getDataB("list", index, "value");
          String title =widget.controller.value.getData("list", index, "title");
          return
            Container(width: widget.width,
            height: widget.height,
            child:
            CheckboxListTile(
                  title: Text(title),
                  value: v,
                  onChanged: (bool? a) {
                    setState(() {
                      widget.controller.value.setDataB("list", index, "value", a!);
                    });
                  }),
            );

        });
    return ValueListenableBuilder<iiTransaction>(
      valueListenable: widget.controller,
      builder: (context, value, _) {
        return Container(
          child: child,
        );
      },
    );
  }
}
