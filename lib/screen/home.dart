import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../partyscreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool ispartyscreen=false;
  final _formkry=GlobalKey<FormState>();
  TextEditingController textconroller=TextEditingController();
  ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 300),
            InkWell(
              child: Container(
                width: 50,
                height: 50,
                child: Text("party"),
              ),
              onTap: () {
                setState(() {
                  ispartyscreen = !ispartyscreen;

                });
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Form(key:_formkry,
                child: TextFormField(

                  controller: textconroller,
                ),
              ),


              if (ispartyscreen)
                Positioned(
                  right: 50,
                  left: 50,
                  top: 50,
                  bottom: 50,
                  child: Container(
                    width: 500,
                    height: 500,
                    color: Colors.white,
                    child:Partyscreen(scrollController: _scrollController,isParty: ispartyscreen,)
                  ),
                )
            ]),
          )

        ],
      ),
    );
  }

  void scrollToContainer(int index)
  {
    _scrollController.animateTo
      (
      index * 750,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }


}
