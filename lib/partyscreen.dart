

import 'package:billbook/pluttogrid.dart';
import 'package:billbook/screen/home.dart';
import 'package:billbook/service/validatefields.dart';

import 'package:billbook/widget/IIDropdown.dart';
import 'package:billbook/widget/IITextEditingcontroller.dart';
import 'package:billbook/widget/IImultiCheckboxBillBook.dart';
import 'package:billbook/widget/TextFieldWidgetWithHead.dart';
import 'package:billbook/widget/billbooktabwidget.dart';
import 'package:billbook/widget/iiokmessage.dart';
import 'package:billbook/widget/numerictextField.dart';
import 'package:billbook/widget/textFormFieldWidget.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../iitransaction.dart';
import '../valuelistenablw.dart';

class Partyscreen extends StatefulWidget
{
  final ScrollController scrollController;
  bool isParty;
  Partyscreen({required this.scrollController,required this.isParty});
  @override
  State<Partyscreen> createState() => _PartyscreenState();
}

class _PartyscreenState extends State<Partyscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController workmobilecontroller = TextEditingController();
  TextEditingController whatsappnumber = TextEditingController();
  TextEditingController gstcontroller = TextEditingController();
  TextEditingController pancontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  TextEditingController billingaddresscontroller = TextEditingController();
  TextEditingController shippingaddresscontroller = TextEditingController();
  TextEditingController billinglocation = TextEditingController();
  TextEditingController shippinglocation = TextEditingController();
  TextEditingController billingpin = TextEditingController();
  TextEditingController shippingpin = TextEditingController();
  TextEditingController billingstatecontroller = TextEditingController();
  TextEditingController shippingstatecontroller = TextEditingController();
  TextEditingController accountnamecontroller = TextEditingController();
  TextEditingController accountnumbercontroller = TextEditingController();
  TextEditingController banknamecontroller = TextEditingController();
  TextEditingController branchnamecontroller = TextEditingController();

  TextEditingController ifsccontroller = TextEditingController();

  TextEditingController creditNoOfdays = TextEditingController();

  TextEditingController routecontroller = TextEditingController();

  TextEditingController creditNo = TextEditingController();

  TextEditingController partynamecontroller=TextEditingController();

  TextEditingController partytypecontroller=TextEditingController();

  iTrnController valuecontrollerFortextbox = iTrnController(iiTransaction());

  iTrnController multicheckboxcontroller = iTrnController(iiTransaction());
  final _formkey=GlobalKey<FormState>();


  @override
  void initState() {
    Map icheckboxlabel={"Customer":1,"manufacturer":2,"Supplier":4,"Transporter":8};
    List checkboxlabel=["customer","manufaturer","supplier","transporter"];
    for (int i = 0; i < 4; i++) {
      multicheckboxcontroller.value.setDataB("list", i, "title", false);
      multicheckboxcontroller.value.setData("list", i, "title", checkboxlabel[i]);
    }




    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ValidateFields _validateFields=ValidateFields();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("PARTY"),
                Container(child: Row(children: [IconButton(
                    onPressed: () {
                     setState(() {
                     bool validd=  _formkey.currentState!.validate();
                     print(validd);

                       ///validation and sending data
                       // validatingFields(emailcontroller.text,
                       //   namecontroller.text,
                       //   designationcontroller.text,
                       //   workmobilecontroller.text,
                       //   whatsappnumber.text,
                       //   gstcontroller.text,
                       //   pancontroller.text,
                       //   statecontroller.text,
                       //   typecontroller.text,
                       //   billingaddresscontroller.text,
                       //   shippingaddresscontroller.text,
                       //   billinglocation.text,
                       //   shippinglocation.text,
                       //   billingpin.text,
                       //   shippingpin.text,
                       //   billingstatecontroller.text,
                       //   shippingstatecontroller.text,
                       //   accountnamecontroller.text,
                       //   accountnumbercontroller.text,
                       //   banknamecontroller.text,
                       //   branchnamecontroller.text,
                       //   ifsccontroller.text,
                       //   creditNoOfdays.text,
                       //   routecontroller.text,
                       //   creditNo.text,
                       //   partynamecontroller.text,
                       //   partytypecontroller.text,
                       // );

                     });
                    }, icon: Icon(Icons.save)),


                  IconButton(
                      onPressed: () {
                        setState(() {

                          print(widget.isParty);
                          widget.isParty=!widget.isParty;
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){return Homepage();}));
                        });
                      }, icon: Icon(Icons.close))],),)
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
             Billbooltab(scrollController: widget.scrollController,),
              Expanded(child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(key: _formkey,
                  child: ListView(

                    controller: widget.scrollController,
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            Column(
                              children: [
                                Text("Party name"),
                                TextFieldWidget(validatefunction: _validateFields.validateTextFields,
                                  texteditingcontroller: partynamecontroller, txtHead: "name",width: MediaQuery.of(context).size.width*.2,),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Leagal name"),
                                TextFieldWidget(validatefunction: _validateFields.validateTextFields,
                                    texteditingcontroller: partytypecontroller, txtHead: "Type",width: MediaQuery.of(context).size.width*.2),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(width:20,height:50,child: Row(
                        children: [
                          Text("Type"),
                          Flexible(child: IIMultiCheck(controller: multicheckboxcontroller, width: 180, height: 50, direction: Axis.horizontal)),
                        ],
                      )),



                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          width: MediaQuery.of(context).size.width,
                          height:
                          800,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [




                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text("Contact Details",
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidgetWithHead(

                                        texteditingcontroller: TextEditingController(),
                                        txtHead: 'Contact Person',
                                        hintText: "Contact person Name"),
                                    SizedBox(height: 20),
                                    TextFieldWidget(
                                      validatefunction: _validateFields.validateTextFields,
                                        txtHead: "Designation",
                                        texteditingcontroller: designationcontroller),
                                    SizedBox(height: 20),
                                    TextFieldWidget(
                                      validatefunction: _validateFields.validatemail,
                                        txtHead: "Email",
                                        texteditingcontroller: emailcontroller),
                                    SizedBox(height: 20),
                                    Numerictextfield(
                                      validatefunction: _validateFields.validatephone,
                                        numericcontroller: workmobilecontroller,
                                        hinttext: "office Number"
                                    ),
                                    SizedBox(height: 20,),
                                    Iidropdownharcoded(labelstringList: ["a","b"], textEditingController: routecontroller,hinttext: "route",)

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      ///registration
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          width: MediaQuery.of(context).size.width,
                          height:
                          MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text("Registration Details",
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Iidropdownharcoded(
                                      dropdownheading: "Registration Type",
                                      labelstringList: ["registered", "unregistered"],
                                      textEditingController: typecontroller,
                                      hinttext: "register type",
                                    ),
                                    TextWidgetWithHead(
                                      validatefunction: _validateFields.validateGst,
                                        texteditingcontroller: gstcontroller,
                                        txtHead: 'GST',
                                        hintText: "GST Number"),
                                    SizedBox(height: 20),
                                    TextFieldWidget(
                                      validatefunction: _validateFields.validatePancard,
                                        txtHead: "PAN",
                                        texteditingcontroller: pancontroller),
                                    SizedBox(height: 20),
                                    Iidropdownharcoded(
                                        dropdownheading: "State",
                                        labelstringList: ["Kerala", "Tamil Nadu"],
                                        textEditingController: statecontroller),
                                    SizedBox(height: 30,),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Credit",style: TextStyle(fontWeight: FontWeight.bold),),
                                          Row(
                                            children: [
                                              Numerictextfield(validatefunction: _validateFields.validateTextFields,
                                                numericcontroller: creditNo, hinttext: " credit limit ",width: MediaQuery.of(context).size.width*.2,),
                                              SizedBox(width: 30,),
                                              Numerictextfield(validatefunction: _validateFields.validateTextFields,
                                                numericcontroller: creditNo, hinttext: " number of credit ",width: MediaQuery.of(context).size.width*.2,),
                                              SizedBox(width: 30,),
                                              Numerictextfield(numericcontroller: creditNoOfdays, hinttext: "credit days",width: MediaQuery.of(context).size.width*.2,),

                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),



                      ///address
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          width: MediaQuery.of(context).size.width,
                          height:
                          MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text("Address",
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 200,
                                          child: Row(
                                            children: [
                                              IITextEditingController(
                                                validatefunction: _validateFields.validateTextFields,
                                                textlabel: "billing address",
                                                HintText: "billing address",
                                                widthOfTextField: MediaQuery.of(context).size.width*.5,
                                                textEditingController: billingaddresscontroller,
                                                controller: valuecontrollerFortextbox,
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Column(
                                                children: [
                                                  TextFieldWidget(

                                                    texteditingcontroller: billinglocation,
                                                    txtHead: "billing location",
                                                    width: MediaQuery.of(context).size.width*.2,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Numerictextfield(
                                                    numericcontroller: billingpin,
                                                    hinttext: "billing pin",
                                                    width: MediaQuery.of(context).size.width*.2,
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Expanded(
                                                    child: Iidropdownharcoded(
                                                      WidthOfDropdown: MediaQuery.of(context).size.width*.2,
                                                      labelstringList: ["kerala", "tn"],
                                                      textEditingController:
                                                      billingstatecontroller,
                                                      hinttext: "biling state",
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 200,
                                          child: Row(
                                            children: [
                                              IITextEditingController(
                                                validatefunction: _validateFields.validateTextFields,
                                                textlabel: "shipping address",
                                                widthOfTextField: MediaQuery.of(context).size.width*.5,
                                                textEditingController: shippingaddresscontroller,
                                                controller: valuecontrollerFortextbox,
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Column(
                                                children: [
                                                  TextFieldWidget(
                                                    texteditingcontroller: billinglocation,
                                                    txtHead: "shipping location",
                                                    width: MediaQuery.of(context).size.width*.2,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Numerictextfield(
                                                    numericcontroller: shippingpin,
                                                    hinttext: "shipping pin",
                                                    width: MediaQuery.of(context).size.width*.2,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Iidropdownharcoded(
                                                    WidthOfDropdown: MediaQuery.of(context).size.width*.2,
                                                    labelstringList: ["kerala", "tn"],
                                                    textEditingController:
                                                    shippingstatecontroller,
                                                    hinttext: "shipping state",
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),




                      ///bank details
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(border: Border.all()),
                              width: MediaQuery.of(context).size.width,
                              height:
                              MediaQuery.of(context).size.height, // Use height of screen
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text("Bank Details",
                                            style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextWidgetWithHead(
                                            validatefunction: _validateFields.validateTextFields,
                                              texteditingcontroller:accountnamecontroller,
                                              txtHead: 'Account name',
                                              hintText: "A/C name"),
                                          SizedBox(height: 20),
                                          Numerictextfield(numericcontroller: accountnumbercontroller,hinttext: "A/C number",),
                                          SizedBox(height: 20),
                                          TextFieldWidget(
                                            validatefunction: _validateFields.validateTextFields,
                                              txtHead: "Bank name",
                                              texteditingcontroller: banknamecontroller),
                                          SizedBox(height: 20),
                                          TextFieldWidget(
                                              texteditingcontroller: branchnamecontroller,
                                              txtHead: "Branch name"),
                                          SizedBox(height: 20,),
                                          TextFieldWidget(
                                            validatefunction: (ifsc)=>ifsc!.isEmpty?"please enter ifsc":null,
                                              texteditingcontroller: branchnamecontroller,
                                              txtHead: "IFSC"),
                                        ],
                                      ),
                                    ),
                                  ]))),
                      SizedBox(height: 30,),




                      ///opening
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(border: Border.all()),
                              width: MediaQuery.of(context).size.width,
                              height:
                              MediaQuery.of(context).size.height, // Use height of screen
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("opening",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: PlutoGridtable(),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ],
    );


  }
  // Future validatingFields ( String emailcontroller,
  //     String namecontroller,
  //     String designationcontroller,
  //     String workmobilecontroller,
  //     String whatsappnumber,
  //     String gstcontroller,
  //     String pancontroller,
  //     String statecontroller,
  //     String typecontroller,
  //     String billingaddresscontroller,
  //     String shippingaddresscontroller,
  //     String billinglocation,
  //     String shippinglocation,
  //     String billingpin,
  //     String shippingpin,
  //     String billingstatecontroller,
  //     String shippingstatecontroller,
  //     String accountnamecontroller,
  //     String accountnumbercontroller,
  //     String banknamecontroller,
  //     String branchnamecontroller,
  //     String ifsccontroller,
  //     String creditNoOfdays,
  //     String routecontroller,
  //     String creditNo,
  //     String partynamecontroller,
  //     String partytypecontroller,
  //     )async
  // {
  //   if(emailcontroller.isEmpty || namecontroller.isEmpty ||
  //       designationcontroller.isEmpty || workmobilecontroller.isEmpty ||
  //       whatsappnumber.isEmpty || gstcontroller.isEmpty ||
  //       pancontroller.isEmpty ||
  //       statecontroller.isEmpty ||
  //       typecontroller.isEmpty ||
  //       billingaddresscontroller.isEmpty ||
  //       shippingaddresscontroller.isEmpty ||
  //       billinglocation.isEmpty ||
  //       shippinglocation.isEmpty ||
  //       billingpin.isEmpty ||
  //       shippingpin.isEmpty ||
  //       billingstatecontroller.isEmpty ||
  //       shippingstatecontroller.isEmpty ||
  //       accountnamecontroller.isEmpty ||
  //       accountnumbercontroller.isEmpty ||
  //       banknamecontroller.isEmpty ||
  //       branchnamecontroller.isEmpty ||
  //       ifsccontroller.isEmpty ||
  //       creditNoOfdays.isEmpty ||
  //       routecontroller.isEmpty ||
  //       creditNo.isEmpty ||
  //       partynamecontroller.isEmpty ||
  //       partytypecontroller.isEmpty
  //   )
  //     {
  //       await showDialog(context: context, builder: (context){return IIOkMessage(label: "empty field found");});
  //
  //     }
  // }
}
