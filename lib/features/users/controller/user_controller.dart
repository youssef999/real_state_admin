
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/const/constant.dart';

class UserController extends GetxController{


 List userList=[];
 
 
get2()async{
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
  };
  try{
    var request = http.Request('POST',
        Uri.parse(baseUrl.toString()+'/brokers/user/all_users.php'));
    request.body = json.encode({
      "roleId": "1"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      userList=jsonDecode(await response.stream.bytesToString());
      print("USER======"+userList.toString());
    }
    else {
      print(response.reasonPhrase);
    }
  }catch(e){
    print("EEE=="+e.toString());
  }
}

getAllUsers () async{
  print("GET ALL BUILDINGS....");
  userList=[];
   try{

 print(baseUrl.toString()+'/brokers/user/all_users.php');

     var request = await
     http.post(Uri.parse
       (baseUrl+'/brokers/user/all_users.php'),
       //localhost/brokers/buildings/get_buildings.php
       headers: {
      //  'Content-Type': 'application/json',
         'Authorization': basicUrl,
       },
       body: {
         "roleId":"1"
       }
     );
     var responseBody =jsonDecode(request.body);
     print("STATUS USERS CODE=========="+request.statusCode.toString());
     print("ORDERdata=========="+request.body.toString());
     if(request.statusCode==201 || request.statusCode==200){
       print("DONE USERS DATA..........");
       print(request.body.toString());
       userList=responseBody['Data'];
     }
     print("userbooking====="+userList.toString());
   }catch(e){
     print("ERROR====="+e.toString());
   }
  update();

}
 }