// ignore_for_file: override_on_non_overriding_member, avoid_print

import 'package:flutter/material.dart';

class SecandScreen extends StatefulWidget {
  const SecandScreen(
      this.id, this.name, this.fathername, this.dept, this.description,
      {super.key});
  final int id;
  final String name;

  final String fathername;
  final String dept;
  final String description;

  @override
  State<SecandScreen> createState() => _SecandScreenState(
        id,
        name,
        fathername,
        dept,
        description,
      );
}

class _SecandScreenState extends State<SecandScreen> {
  _SecandScreenState(
    this.id,
    this.name,
    this.fathername,
    this.dept,
    this.description,
  );
  final int id;
  final String name;

  final String fathername;
  final String dept;
  final String description;
  @override
  void initstate() {
    super.initState();
    print('id=$id');
    print('name=$name');
    print('fathername=$fathername');
    print('dept=$dept');
    print('description=$description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$id'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                fathername,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            dept,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
