class ValidateFields
{

//validate  phone
  String? validatephone(String? mobile)
  {
    if(mobile!.length<10 )
    {
      return "enter valid mobile number";
    }
    return null;
  }

  //validate  email
String? validatemail(String? email)
{
  bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email!);
  if(emailValid==false)
    {
      return "enter valid email";
    }
  return null;
}


//vaidate namefiels
String? validateTextFields(String? name)
{
  if(name!.isEmpty)
    {
      return "this field can't be empty";
    }
  return null;
}

//validate gst
String? validateGst(String ? gst)
{
  if(gst!.length!=15)
    {
      return"please enter a valid GST number";
    }
  return null;
}

//validate pan
  String? validatePancard(String? value) {
    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please Enter Pancard Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Pancard Number';
    }
    return null;
  }

//validate account number
  String ?validateAccountNumber(String? value) {
    String pattern = '[0-9]{9,18}';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please Enter Account Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Account Number';
    }
    return null;
  }


  //validate ifsc
  String? validateIFSC(String? value) {
    String pattern = '^[A-Z]{4}0[A-Z0-9]{6}\$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please Enter IFSC';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter valid IFSC';
    }
    return null;

  }

}