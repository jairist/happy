import 'package:flutter/material.dart';

class Job {
  String jobTitle;
  String companyName;
  double salary;
  Icon icon;
  String location;
  String timeRequirement;

  Job(this.companyName, this.jobTitle, this.salary, this.location, this.timeRequirement, this.icon);
}
