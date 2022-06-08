import 'package:flutter/material.dart';

snackBarPop({required context,required text}){
   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                  content: Text(text)));
}