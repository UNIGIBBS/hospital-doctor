
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/patient.dart';


class Appointments extends StatelessWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ProfileList(),
    );
  }
}

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  List<Patient> items9_10 = [
    Patient("Wyatt", 22, "Hackett", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_4.jpg', 'Fever'),
    Patient("Lea", 22, "Mcdowell", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_3.jpg', 'Diarrhea'),
    Patient("Arian", 22, "Hunter", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_2.jpg', 'Fatigue and Muscle aches'),
  ];

  List<Patient> items10_11 = [
    Patient("Beau", 22, "Randall", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_1.png', 'Coughing'),
    Patient("Avi", 22, "Kelley", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_5.jpg', 'Vomiting'),
    Patient("Darla", 22, "Ross", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_6.jpg', 'Chills'),
    Patient("Logan", 22, "Haworth", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_7.jpg', 'Headache'),
    Patient("Gurpreet", 22, "Burgess", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_9.jpg', 'Stomachache'),
    Patient("Sierra", 22, "Roche", DateTime.utc(2022, 19, 6),
        DateTime.utc(2000, 26, 1), 'assets/images/profile_8.jpg', 'Nausea'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 70,
          title: Text(
            DateFormat('yyyy-mm-dd \n KK:mm:ss').format(DateTime.now()),
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage:
                AssetImage('assets/images/doctor_profile2.jpg'),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("09:00 - 10:00"),
              ),
              Container(
                height: items9_10.length * height * 0.12,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items9_10.length,
                  itemBuilder: (context, index) {
                    final item = items9_10[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        trailing: Text("10/10/2000 \n 9:10", textAlign: TextAlign.center,),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(item.image!),
                        ),
                        title: Text(
                          '${item.name!} ${item.surname!}',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text('${item.subtitle!}'),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("10:00 - 11:00",),
              ),
              Container(
                height: items10_11.length * height * 0.12,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items10_11.length,
                  itemBuilder: (context, index) {
                    final item = items10_11[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        trailing: Text("10/10/2000 \n 10:10", textAlign: TextAlign.center,),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(item.image!),
                        ),
                        title: Text(
                          '${item.name!} ${item.surname!}',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text('${item.subtitle!}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

