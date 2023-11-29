import 'package:flutter/material.dart';

import 'constants.dart';

Widget defaultButton(context,{required String text,required,required VoidCallback onPressed })=>
Container(
  width: MediaQuery.of(context).size.width * 0.6,
  height: 50,
  decoration: BoxDecoration(
    // border: Border.all(width: 1, color: Colors.black),
      borderRadius: BorderRadius.circular(15),
      color: defaultColor),
  child: MaterialButton(
    onPressed: onPressed,
    child:  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
            text,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  ),
);