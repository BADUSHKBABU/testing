
import 'package:flutter/cupertino.dart';


import 'iitransaction.dart';

class iTrnController extends ValueNotifier<iiTransaction> {

  iTrnController(super.value);
  iiTransaction get trn=>super.value;
  set trn(iiTransaction passedvalue)
  {
    if (passedvalue != value)
    {
      super.value = passedvalue;
    }
  }
}