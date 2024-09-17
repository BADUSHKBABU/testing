import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';

import '../../iitransaction.dart';




class IITextEditingController extends StatefulWidget {
  TextEditingController textEditingController;
   ValueNotifier<iiTransaction?>? controller;
  bool readonly;
  Color Iconcolor;
  String HintText;
  double sizedboxheight;
  double paddingtop;
  double paddingleft;
  double paddingright;
  double paddingbottom;
  bool istap;
  String textlabel="default label";
  void Function(String?) ?onchanged;
  IconButton ?suffixicon;
  bool obsecure;
  String ? Function(String?)? validatefunction ;
  double widthOfTextField;
  //Icon ?SuffixIcon;
  // String ?initialvalue;
  IITextEditingController(

      {super.key,
        this.widthOfTextField=200,
      required this.textEditingController,
      this.controller,
      this.readonly = false,
      this.Iconcolor = Colors.black,
      this.HintText = "type...",
      this.sizedboxheight = 0,
      this.paddingbottom=0,
      this.paddingright=0,
      this.paddingleft=0,
      this.paddingtop=0,
      this.onchanged,
        this.obsecure=false,
        this.suffixicon=null,
        this.validatefunction,
        this.textlabel="default label",
        this.istap=false
      });

  @override
  State<IITextEditingController> createState() => _IITextEditingControllerState();
}

class _IITextEditingControllerState extends State<IITextEditingController> {
  @override
  Widget build(BuildContext context) {
    print("textbox starting");
    return ValueListenableBuilder(
        valueListenable: widget.controller!,
        builder: (context, value, _){
          return Column(
            children: [
              SizedBox(
                height: widget.sizedboxheight,
              ),
              Padding(
                padding:  EdgeInsets.only(left: widget.paddingleft,right: widget.paddingright,bottom: widget.paddingbottom,top: widget.paddingtop),
                child: Container(width: widget.widthOfTextField,
                  child: TextFormField(keyboardType: TextInputType.number,
                    onTap: (){
                    setState(() {
                      widget.istap=true;
                    });
                    },
                    validator:widget.validatefunction ,
                    controller: widget.textEditingController,
                    readOnly: widget.readonly,
                    onChanged: widget.onchanged,
                    obscureText: widget.obsecure,
                    maxLines: widget.istap?5:1,
                    decoration: InputDecoration(suffix: IconButton(onPressed: (){widget.textEditingController.clear();
                      widget.istap=false;}, icon: Icon(Icons.delete)),
                        suffixIcon: widget.suffixicon,
                        iconColor: widget.Iconcolor,
                        hintText: widget.HintText,
                        label: Text(widget.textlabel),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
