import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidgetWithHead extends StatelessWidget {
  TextWidgetWithHead({required this.texteditingcontroller,required this.txtHead,this.hintText="",this.validatefunction});
  TextEditingController texteditingcontroller = TextEditingController();
  String txtHead;
  String hintText;
  String? Function(String?)? validatefunction;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(txtHead,textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),SizedBox(height: 10,),
        Container(
          width: 500,
          height: 40,
          child: TextFormField(
            validator: validatefunction,
            controller: texteditingcontroller,
            decoration: InputDecoration(
              hintText: hintText,
              hoverColor: Colors.teal,
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff0E1D3E)))),
          ),
        ),
      ],
    );
  }
}
