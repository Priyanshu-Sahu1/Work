// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' API Call'),
      ),
      // print(users.length);
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          //print(itemCount);
          final user = users[index];
          final fn = user["First Name "];
          final ln = user["Last Name"];
          final mn = user["Month"];
          final sn = user["Sales "];
          final yr = user["Year"];
          final st = user["Sales Target"];
          print(users.length);
          // Text(ln);
          // print(mn);
          // print(sn);
          // print(yr);
          // print(st);
          return ListTile(
            title: Text("First Name :" +
                fn +
                " , Last Name :" +
                ln +
                ",  Month :" +
                mn +
                ",  Sales :" +
                "$sn" +
                ",  Sales Target :" +
                "$yr" +
                ",  Year : " +
                "$st"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    const url = 'http://127.0.0.1:7777/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["records"];
    });
  }
}
