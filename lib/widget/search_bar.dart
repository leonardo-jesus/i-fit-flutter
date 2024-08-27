import 'package:flutter/material.dart';
Widget buildsearchbar(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
      color: Colors.green[50],
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Está procurando por algo?',
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search, color: Colors.green[600]),
      ),
    ),
  );
}// TODO Implement this library.