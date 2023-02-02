import 'package:flutter/material.dart';

import '../../util/database_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: _databaseHelper.getUser(),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              return Text('Seja bem vindo(a) ' + snapshot.data![0]['userName']);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
