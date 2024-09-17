
import 'dart:convert';


import 'package:flutter/Material.dart';


class  iiTransaction  {
  //varibales
  Map<String, Map<int,Map<String,String>> >data={};
  String _name = '';

  void setName(String name) {
    _name = name;
  }
  void setP(String field , String fieldValue)  //Map<String, Map<int,Map<String,String>> >data
  {
    String tbl="parameter";
    int index=0;
    setData(tbl, index, field, fieldValue);
  }
  void setData( String tbl,  int index, String field , String fieldValue)  //Map<String, Map<int,Map<String,String>> >data
  {
    //table not present
    if(data.containsKey(tbl)==false)
    {
      Map<String, String> fields={};
      fields[field]=fieldValue;
      Map<int,Map<String,String>> records={};
      records[index]=fields;
      data[tbl]=records;
      return;
    }
    //record not  present
    if(data[tbl]!.containsKey(index)==false)
    {
      Map<String, String> fields={};
      fields[field]=fieldValue;
      Map<int,Map<String,String>> records={};
      records[index]=fields;
      data[tbl]![index]=fields;
      return;
    }
    //field not present
    if(data[tbl]![index]!.containsKey(field)==false){
      data[tbl]![index]![field]=fieldValue;
      return;
    }
    //field present , remove and add
    data[tbl]![index]!.remove(field);
    data[tbl]![index]![field]=fieldValue;
  }

  void setDataB( String tbl,  int index, String field , bool fieldValue){
    if(fieldValue)
      setData(tbl, index, field, "1");
    else
      setData(tbl, index, field, "0");
  }
  void setDataNumeric( String tbl,  int index, String field , double fiedValue){
    if(fiedValue>=0)
      setData(tbl, index, field, fiedValue.toString());
    else
      setData(tbl, index, field, "not valid");
    //IIErrorMessage();
  }

  void setDataSelection( String tbl,  int index, String field,String selectedvalue )
  {
    setData(tbl, index, field, "a");
  }
  int getDataI(String tablename,int index,String field)
  {
    String v=getData(tablename, index, field);
    int vi=0;
    try
    {
      vi=int.parse(v);
    }
    catch(e){}
    return vi;
  }

  bool getDataB(String tablename,int index,String field){
    String v=getData(tablename, index, field);

    int vi=0;
    try
    {
      vi=int.parse(v);
    }
    catch(e){
    }
    if(vi==0)
      return false;
    else
      return true;
  }


  String getData(String tablename,int index,String field)
  {
    if(data.containsKey(tablename)==false)
    {
      return "" ;
    }
    if(data[tablename]!.containsKey(index)==false)
    {
      return "";
    }
    if(data[tablename]![index]!.containsKey(field)==false)
    {
      return "";
    }
    return data[tablename]![index]![field].toString();
    // return data[tablename]![index]![field].
  }
  void removeTable(String tbl)
  {
    if(data.containsKey(tbl)==true)
    {
      data.remove(tbl);
    }
  }
  void clear() {
    data.clear();
  }
  int? tableCount() {
    return data.length;
  }
  int? recordCount(String tbl) {
    return data[tbl]?.length;
  }
  Map<String, dynamic> convertToJsonEncodable(Map<String, Map<int, Map<String, String>>> map)
  {
    Map<String, dynamic> result = {};
    map.forEach((outerKey, innerMap1) {
      result[outerKey] = {};
      innerMap1.forEach((middleKey, innerMap2) {
        result[outerKey][middleKey.toString()] = innerMap2; // Convert middleKey to String for JSON compatibility
      });
    });
    Map<String, dynamic> result2 = {};
    result2['name'] = _name;
    result2['tables']=result;
    return result2;
  }


  String toJSON() {

    Map<String, dynamic> jsonEncodableMap = convertToJsonEncodable(data);

    // Convert the JSON encodable map to a JSON string
    String jsonString = jsonEncode(jsonEncodableMap);

    return jsonString;
    /*
    List ret = [];
    Map<String, dynamic> tbls = new Map();
    Map<String, dynamic> mp = new Map();

    mp['name'] = _name;

    _iiTable.forEach((key, value) {
      tbls[key] = value.toJson();
    });
    mp['tables'] = tbls;
    ret.add(mp);
    return jsonEncode(ret);

     */
  }


  void fromJson(String jsonString)
  {
    Map<String, dynamic> parsedMap = jsonDecode(jsonString);
    data = {};
    _name=parsedMap["name"];
    Map<String, dynamic> parsedMap2=parsedMap['tables'];
    parsedMap2.forEach((key, value) {
      if (value is Map) {
        Map<int, Map<String, String>> innerMap = {};
        value.forEach((innerKey, innerValue) {
          if (innerValue is Map) {
            Map<String, String> innermostMap = {};
            innerValue.forEach((innermostKey, innermostValue) {
              innermostMap[innermostKey] = innermostValue.toString();
            });
            innerMap[int.parse(innerKey)] = innermostMap;
          }
        }
        );
        data[key] = innerMap;
      }
    });
  }

}



class iiDataSource  extends iiTransaction implements DataTableSource {
  DataRow? Function(int index) dataRow;

  void Function(String tbl,  int index, String field) DataChanged;
  VoidCallback? listener;
  iiDataSource({required this.dataRow,required this.DataChanged});
  @override
  void addListener(VoidCallback l) {
    // TODO: implement addListener
    listener=l;
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  DataRow? getRow(int index) {
    return dataRow(index);
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners{
    if(listener==null){
      return false;
    }
    return true;
  }
  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => true;
  @override
  void notifyListeners(){
    if(listener!=null)
    {
      listener!();
    }
  }
  @override
  void setData( String tbl,  int index, String field , String fieldValue){
    super.setData(tbl, index, field, fieldValue);
    DataChanged(tbl,index,field);
  }  //Map<String, Map<int,Map<String,String>> >data{

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
  @override
  // TODO: implement rowCount
  int get rowCount {
    return recordCount("list") ?? 0;
    // return 10;
  }
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}


