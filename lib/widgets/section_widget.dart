import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/doctor_profile_page.dart';

class SectionWidget extends StatefulWidget {
  const SectionWidget({Key? key}) : super(key: key);

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {

  var colorsCheck = false;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20,),
                    SizedBox(
                      width: width/10,
                        child: Icon(Icons.healing, color: colorsCheck == false ? Colors.grey[700] : Colors.green,)
                    ),
                    SizedBox(width: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: SizedBox(
                        width: width-width/5-74,
                        child: Text(
                          "Cardiology",
                          style: TextStyle(
                              fontSize: height*0.02,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10,),
                SizedBox(
                    width: width/10,
                    child: IconButton(
                      icon: Icon(
                          colorsCheck == false ? Icons.search : CupertinoIcons.multiply
                      ),
                      onPressed: (){
                        setState((){
                          colorsCheck = !colorsCheck;
                        });
                      },
                      color: colorsCheck == false ? Colors.grey[700] : Colors.green,
                    )
                ),
                SizedBox(width: 8,),
              ],
            )
          ),
        ),
        colorsCheck == true ? ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorProfilePage()));
                },
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8,),
                      SizedBox(
                        width: width/3-8,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: CircleAvatar(
                            radius: width*0.15-2,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                              radius: width*0.15-6,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: width*0.15-10,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width/3*2-24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              "Doctor Doctorova",
                              style: TextStyle(
                                  fontSize: height*0.025,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800]
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "I am a doctor on these stuff and I have 5 years of experience!",
                              style: TextStyle(
                                  fontSize: height*0.02,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[500]
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ) : Container()
      ],
    );
  }
}
