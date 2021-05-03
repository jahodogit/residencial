import 'package:flutter/material.dart';

var kInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(10.0),
    labelText: 'Search',
    hintText: 'Search',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ));

var kInputDecorationLogin = InputDecoration(
    contentPadding: EdgeInsets.all(10.0),
    labelText: 'Email',
    hintText: 'residencial@fsd.com',
    prefixIcon: Icon(Icons.person_outline_rounded),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ));

var kInputDecorationPass = InputDecoration(
    contentPadding: EdgeInsets.all(10.0),
    labelText: 'Password',
    hintText: 'residencial',
    prefixIcon: Icon(Icons.person_outline_rounded),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ));
