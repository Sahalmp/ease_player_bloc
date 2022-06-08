
import 'package:flutter/material.dart';

nextPage({required page, required context}) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (ctx) =>  page()));
}

