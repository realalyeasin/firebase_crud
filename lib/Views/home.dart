import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import 'recieve.dart';
import 'send.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              
              Tab(
                
                icon: Text("Envoi"),
              ),
              Tab(icon: Text("Retrait")),
            ],
          ),
          title: const Text('Madame Wonder Transfert'),
        ),
        body:  const TabBarView(
          children:  [
            Send(),
            Recieve(),
          ],
        ),
      ),
    );
  }
}