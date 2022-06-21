import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Patient{
  String? name;
  String? surname;
  DateTime? birthDate;
  int? age;
  DateTime? appointmentDate;
  String? image;
  String? subtitle;

  Patient(
      this.name,
      this.age,
      this.surname,
      this.appointmentDate,
      this.birthDate,
      this.image,
      this.subtitle);

}