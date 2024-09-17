
import 'package:flutter/Material.dart';
import 'package:flutter/Cupertino.dart';



import 'iilabel.dart';

class IIOkMessage extends StatelessWidget {
  String label;

  Color ?textcolor;
  Color ?bgcolor;
  IIOkMessage({super.key, this.label="ok",this.bgcolor=Colors.blue,this.textcolor=Colors.black});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(shadowColor: Colors.black,
      backgroundColor: bgcolor,
      title:IILabel(label: label,color: textcolor,),
      actions:
      [
        TextButton(onPressed: (){Navigator.pop(context);}, child: IILabel(label: "OK",color: Colors.black,)),
      ],
    );
  }
}
