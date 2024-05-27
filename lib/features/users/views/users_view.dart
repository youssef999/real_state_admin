
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstateAdmin/core/widgets/Custom_Text.dart';
import 'package:realstateAdmin/features/users/controller/user_controller.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {

UserController controller = Get.put(UserController());
  @override
  void initState() {
  // controller.getAllUsers();
   controller.get2();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UsersWidget()

      // Padding(
      //   padding:  const EdgeInsets.all(8.0),
      //   child: ListView(children:  [
      //
      //       const Custom_Text(text: 'المستخدمين',
      //       fontSize: 21,color: Colors.black,
      //       ),
      //       const SizedBox(height: 11,),
      //       UsersWidget()
      //
      //   ],),
      // ),
    );
  }

  Widget UsersWidget(){
    return ListView.builder(
      itemCount: controller.userList.length,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(children: [
              const SizedBox(height: 5,),

            SizedBox(
              height: 100,
              child: Image.asset('assets/images/user.png',)),

              Custom_Text(text: controller.userList[index]['name'],
              fontSize: 19,color:Colors.black,
              ),

              const SizedBox(height: 7,),

                Custom_Text(text:
                controller.userList[index]['email'],
              fontSize: 19,color:Colors.black,
              ),







              
            ],),
          ),
        ),
      );
    });
  }
}
