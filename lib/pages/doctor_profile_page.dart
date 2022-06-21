import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_doctor/pages/appointment_request.dart';
import 'package:hospital_doctor/pages/appointments.dart';
import 'package:provider/provider.dart';

import '../providers/user_info.dart';
import '../services/server_handler.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {

  var name;
  var surname;
  var password;
  var user_id;
  var email;
  var appelation;
  var department;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData()async{
    print("prov");
    print(Provider.of<UserInfo>(context, listen:  false).mail);

    Map<dynamic, dynamic>? resultMapRegisterUser =
    await ServerHandler().fetchOneDoctor(Provider.of<UserInfo>(context, listen:  false).mail);
    print("User was added");
    if (resultMapRegisterUser!['success'] == 1){
      print("USER REGISTERED");
      print(resultMapRegisterUser['message']);
      name = resultMapRegisterUser["doctor"]["user_name"];
      surname = resultMapRegisterUser["doctor"]["user_surname"];
      password = resultMapRegisterUser["doctor"]["password"];
      user_id = resultMapRegisterUser["doctor"]["user_id"];
      email = resultMapRegisterUser["doctor"]["user_email"];
      appelation = resultMapRegisterUser["doctor"]["appelation"];
      department = resultMapRegisterUser["doctor"]["department"];
      print(name);
      print(surname);
      print(password);
    }
    else {
      print("USER NOT REGISTERED");
      print(resultMapRegisterUser['message']);
    }
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [

                      Container(
                        height: 230,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 20 ,
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          child: IconButton(
                            icon: Icon(CupertinoIcons.bell_fill, color: Colors.black,),
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AppointmentRequest()),
                              );
                            },
                          ),
                        ),),
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              textStyle:
                              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          child: Text("Appointments", style: TextStyle(color: Colors.black)),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Appointments()),
                            );
                          },

                        ),
                      ),
                      Positioned(
                        left: 30,
                        bottom: -width*0.14+2,
                        child: CircleAvatar(
                          radius: width*0.14+2,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: width*0.14-2,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                              radius: width*0.14-6,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: width*0.14-10,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: width*0.14+2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Text(
                          "",
                          style: TextStyle(
                              fontSize: height*0.02,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]
                          ),
                        );
                      }else{
                        return Text(
                          "$name $surname",
                          style: TextStyle(
                              fontSize: height*0.02,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]
                          ),
                        );
                      }
                    }
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, width/5, 0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: TextStyle(
                          fontSize: height*0.017,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Education: ",
                          style: TextStyle(
                              fontSize: height*0.02,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]
                          ),
                        ),
                        TextSpan(
                          text: "Abdullah Gul University",
                          style: TextStyle(
                              fontSize: height*0.02,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800]
                          ),
                        ),
                      ]
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
                  child: Text(
                    "Contacts",
                    style: TextStyle(
                        fontSize: height*0.025,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Icon(Icons.mail, color: Colors.grey[800],),
                      ),
                      SizedBox(width: 16,),
                      SizedBox(
                        width: width-52,
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Mail: ",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800]
                                  ),
                                ),
                                TextSpan(
                                  text: "mailmail@gmail.com",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500]
                                  ),
                                ),
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Icon(Icons.phone, color: Colors.grey[800],),
                      ),
                      SizedBox(width: 16,),
                      SizedBox(
                        width: width-52,
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Phone number: ",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800]
                                  ),
                                ),
                                TextSpan(
                                  text: "0111 111 11 11",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500]
                                  ),
                                ),
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
