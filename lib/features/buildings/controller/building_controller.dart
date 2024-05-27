
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:realstateAdmin/core/const/constant.dart';


class BuildingController extends GetxController{

 List  buildingList=[];

 getAllBuildings () async{
  print("GET ALL BUILDINGS....");
  buildingList=[];
 
   try{

  print(baseUrl.toString()+'/brokers/buildings/get_buildings.php');

     var request = await
     http.get(Uri.parse
       (baseUrl+'/brokers/buildings/get_buildings.php'),

       //localhost/brokers/buildings/get_buildings.php
       headers: {
         'Content-Type': 'application/json',
         'Authorization': basicUrl,
       },
     );
     var responseBody =jsonDecode(request.body);
     print("STATUS CODE=========="+request.statusCode.toString());
     print("ORDERdata=========="+request.body.toString());

     if(request.statusCode==201 || request.statusCode==200){
       print("DONE BOOKINGS DATA..........");
       buildingList=responseBody['data'];
     }
     print("userbooking====="+buildingList.toString());
   }catch(e){
     print("ERROR====="+e.toString());
   }
  update();

}


}