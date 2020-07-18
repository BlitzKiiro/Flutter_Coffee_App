import 'package:flutter/material.dart';

InputDecoration formInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.all(15),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2),
    borderRadius: BorderRadius.circular(4),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo[400], width: 2),
    borderRadius: BorderRadius.circular(4),
  ),
);

InputDecoration settingsInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.all(15),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown[200], width: 2),
    borderRadius: BorderRadius.circular(4),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown[400], width: 2),
    borderRadius: BorderRadius.circular(4),
  ),
);
