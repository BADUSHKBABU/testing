import 'package:flutter/Material.dart';

class IILabel extends StatelessWidget {
  String label;
  Color ?color;
  int ?maxline;
  double ?fontsize;
  TextAlign ?textAlign;
  double Paddingleft;
  double Paddingright;
  double Paddingtop;
  double Paddingbottom;
  IILabel({super.key, this.label="",this.color=Colors.black12,this.fontsize=16,this.maxline=100,this.textAlign=TextAlign.left,this.Paddingbottom=0.0,this.Paddingleft=0.0,this.Paddingright=0,this.Paddingtop=0});
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding:  EdgeInsets.only(left: Paddingleft,right:Paddingright ,top:Paddingtop ,bottom:Paddingbottom ),
      child: Text(label,style: TextStyle(color: color,fontSize: fontsize,),maxLines: maxline,textAlign: textAlign),
    );
  }
}

