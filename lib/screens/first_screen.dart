import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:first_project/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
//initializing Dio liabrary
  Dio dio = Dio();

  int id = 1;
  List studentsInfo = [];
  List products = [];
  Future<void> getAPIcall() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    var data = await json.decode(response.body);
    setState(() {
      products = data["products"];
    });
  }

  //SAME GET API CALL USING DIO LIABRARY
  Future<void> getAPIcallDio() async {
    var url = ('https://dummyjson.com/products');
    try {
      var response = await dio.get(url);
      //var data = await json.decode(response.data);
      setState(() {
        products = response.data['products'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    //readjsonfile();
    //getAPIcall();
    getAPIcallDio();
  }

//move to json file
  // {
  // 'id': 1,
  //'name': 'Maryam',
  //'fatherName': 'Shakeel',
  // 'dept': 'computer science',
  // 'description': 'an apple a day keeps the doctor away'
  // },
  // {
  // 'id': 2,
  //'name': 'Naila',
  //'fatherName': 'Shakeel',
  //'dept': 'cs',
  //'description': 'an apple a day keeps the doctor away'
  //},
  //{
  //'id': 3,
  //'name': 'Raza',
  //'fatherName': 'Shakeel',
  //'dept': 'army',
  //'description': 'an apple a day keeps the doctor away'
  //},
  //{
  //'id': 4,
  //'name': 'Manahil',
  //'fatherName': 'Naeem',
  //'dept': 'art',
  //'description': 'an apple a day keeps the doctor away'
  //},
  //{
  //'id': 5,
  //'name': 'Iqra',
  //'fatherName': 'Zaib',
  //'dept': ' science',
  //'description': 'an apple a day keeps the doctor away'
  //},
  //{
  //'id': 6,
  //'name': 'Faiza',
  //'fatherName': 'Kanwal',
  //'dept': 'computer ',
  //'description': 'an apple a day keeps the doctor away'
  //},
  //];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Test',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: products.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecandScreen(
                              products[index]['id'],
                              products[index]['title'],
                              products[index]['description'],
                              products[index]['price'],
                              products[index]['brand'],
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 100,
                              child: CachedNetworkImage(
                                imageUrl: '${products[index]['thumbnail']}',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                              )),
                          title: Text(
                            '${products[index]['title']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${products[index]['brand']}',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          )),
                    ),

                    // child: ListTile(
                    //   leading: Text('${studentinfo[index]['id']}'),
                    //   title: Text('${studentinfo[index]['name']}'),
                    //   subtitle: Text('${studentinfo[index]['dept']}'),
                    //   trailing: const Icon(Icons.chevron_right),
                    // )),

                    // Container(
                    //   height:30 ,
                    //   color: Colors.red,
                    //   width: MediaQuery.of(context).size.width,
                    // mediaquery use for reponancesof width

                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              }),
    );
  }
}
