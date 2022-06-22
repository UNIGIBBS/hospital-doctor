import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppointmentRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd \n kk:mm').format(now);

    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade400,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          appointment_card(
            height: height,
            width: width,
            text1: "Reo Ross",
            formattedDate: formattedDate,
            text2: "Asked appointment for",
            text3: "12/10/2022",
            buttons: accept_reject_buttons(
              height: height,
              width: width,
            ),
            image: 'assets/images/profile_1.png',
          ),
          appointment_card(
            height: height,
            width: width,
            text1: "Charlie Grant",
            formattedDate: formattedDate,
            text2: "Commented under appointment",
            text3: "Hello what was i needed to do today?",
            buttons: Container(),
            image: 'assets/images/profile_5.jpg',
          ),
          appointment_card(
            height: height,
            width: width,
            text1: "Sera Burke",
            formattedDate: formattedDate,
            text2: "You have an appointment at 14:50 with Amara Cottrell",
            text3: "27/11/2022",
            buttons: Container(),
            image: 'assets/images/profile_3.jpg',
          ),
          appointment_card(
            height: height,
            width: width,
            text1: "Ashton Burke",
            formattedDate: formattedDate,
            text2: "Asked appointment for",
            text3: "27/11/2022",
            buttons: accept_reject_buttons(
              height: height,
              width: width,
            ),
            image: 'assets/images/profile_6.jpg',
          ),
          appointment_card(
            height: height,
            width: width,
            text1: "Taryn Lynn",
            formattedDate: formattedDate,
            text2: "Commented under appointment",
            text3: "Hello what was i needed to do today?",
            buttons: Container(),
            image: 'assets/images/profile_4.jpg',
          ),
          appointment_card(
            height: height,
            width: width,
            text1: "Emma Lynn",
            formattedDate: formattedDate,
            text2: "You have an appointment at 14:50 with Addison Haigh",
            text3: "Hello what was i needed to do today?",
            buttons: Container(),
            image: 'assets/images/profile_1.png',
          ),
        ],
      ),
    );
  }
}

class appointment_card extends StatelessWidget {
  appointment_card({
    Key? key,
    required this.height,
    required this.width,
    required this.formattedDate,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.buttons,
    required this.image,
  }) : super(key: key);

  final double height;
  final double width;
  final String formattedDate;
  final String text1;
  final String text2;
  final String text3;
  final Widget buttons;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.2,
      width: width,
      child: Stack(
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
              child: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          5, height * 0.02, 0, height * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text1,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.022),
                          ),
                          Spacer(),
                          Text(
                            text2,
                            maxLines: 2,
                          ),
                          Text(
                            text3,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Spacer(),
                  Expanded(
                    flex: 0,
                    child: Text(formattedDate, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ),
          buttons,
        ],
      ),
    );
  }
}

class accept_reject_buttons extends StatelessWidget {
  const accept_reject_buttons({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 10,
      child: Row(
        children: [
          SizedBox(
            height: height * 0.04,
            width: width * 0.25,
            child: button(
              text: Text(
                "Accept",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          SizedBox(
            height: height * 0.04,
            width: width * 0.25,
            child: button(
              text: Text(
                "Reject",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class button extends StatelessWidget {
  const button({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final Text text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: color))),
      ),
      child: text,
      onPressed: () {},
    );
  }
}
