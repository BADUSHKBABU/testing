import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';

class Billbooltab extends StatefulWidget {
  ScrollController scrollController=ScrollController();
   Billbooltab({super.key,required this.scrollController});

  @override
  State<Billbooltab> createState() => _BillbooltabState();
}

class _BillbooltabState extends State<Billbooltab> {

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [

            InkWell(
                child: Container(decoration: BoxDecoration(color: Color(0xff0E1D3E),border: Border.all()),
                  child: Text("contact details",style: TextStyle(color: Colors.white),),
                ),
                onTap: () => scrollToContainer(0)
            ),
            SizedBox( width: 30,),
            InkWell(
              child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Container(
                  color: Color(0xff0E1D3E),
                  child: Text("Registration details",style: TextStyle(color: Colors.white)),
                ),
              ),
              onTap: () =>scrollToContainer(1),
            ),
            SizedBox( width: 30,),
            InkWell(
                child: Container(
                  child: Text("Address",style: TextStyle(color: Colors.white)),
                ),
                onTap: () =>scrollToContainer(2)
            ),
            SizedBox( width: 30,),
            InkWell(
                child: Container(
                  child: Text("bank details",style: TextStyle(color: Colors.white)),
                ),
                onTap: () =>scrollToContainer(3)
            ),
            SizedBox(width: 30,),
            InkWell(
                child: Container(
                  child: Text("Opening",style: TextStyle(color: Colors.white)),
                ),
                onTap: () =>scrollToContainer(4)
            )
          ],
        ),
      ),
    );
  }

  void scrollToContainer(int index)
  {
    widget.scrollController.animateTo
      (
      index * 750,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

}
