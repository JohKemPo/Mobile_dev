import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "ATM Consultorio",
      debugShowCheckedModeBanner: false,
      home: Home()
    )
  );
}