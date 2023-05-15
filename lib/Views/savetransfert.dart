import 'dart:math';

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../controller/send_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/info.dart';

class AddTransfert extends StatelessWidget {
  const AddTransfert({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionController ctrl = Get.find();
    var rng = Random();
    var code = rng.nextInt(900000) + 100000;

    String sname = ctrl.sname.text;
    String ssurname = ctrl.ssurname.text;
    String smidname = ctrl.smidname.text;
    String snum = ctrl.snum.text;
    String sadress = ctrl.sadress.text;
    String rname = ctrl.rname.text;
    String rsurname = ctrl.rsurname.text;
    String rmidname = ctrl.rmidname.text;

    String radress = ctrl.radress.text;
    var smontant = ctrl.smontant.text;
    var pmontant = ctrl.pmontant.text;
    String sdevise = ctrl.sdevise.text;
    String pdevise = ctrl.pdevise.text;
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference transactions = FirebaseFirestore.instance
        .collection('transactions')
        .doc(code.toString()) as CollectionReference<Object?>;

    Future<void> addTransfert() {
      // Call the user's CollectionReference to add a new user
      return transactions
          .add({
            'devise': pdevise,
            'dfrais': sdevise,
            'frais': pmontant,
            'montant': smontant,
            'radress': radress,
            'rlastname': rsurname,
            'rmidname': rmidname,
            'rname': rname,
            'sadress': sadress,
            'slastname': ssurname,
            'smidname': smidname,
            'sname': sname,
            'snum': snum,
          })
          .then((value) => print("Data recorded"))
          .catchError((error) => print("Failed to add recorded: $error"));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmation'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(mainAxisSize: MainAxisSize.max, children: [
                  const Text(
                      "Veuillez verifier les informations suivantes avant L'envoi"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Informations sur l'expéditeur",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Info(
                    title: 'Nom',
                    data: sname,
                  ),
                  Info(
                    title: 'Post-nom',
                    data: smidname,
                  ),
                  Info(
                    title: 'prénom',
                    data: ssurname,
                  ),
                  Info(
                    title: 'Mobile',
                    data: snum,
                  ),
                  Info(
                    title: 'Adresse',
                    data: sadress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Informations sur le récepteur",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Info(
                    title: 'Nom',
                    data: rname,
                  ),
                  Info(
                    title: 'Post-nom',
                    data: rmidname,
                  ),
                  Info(
                    title: 'prénom',
                    data: rsurname,
                  ),
                  Info(
                    title: 'Adresse',
                    data: radress,
                  ),
                ]),
                const Text(
                  "Informations sur le transfert",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Info(
                  title: 'Code',
                  data: code.toString(),
                ),
                Info(
                  title: 'Montant',
                  data: smontant + sdevise,
                ),
                Info(
                  title: 'Frais de transfert',
                  data: pmontant + pdevise,
                ),
                const SizedBox(
                  height: 10,
                ),
                CtmButton(btntext: "VALIDEZ", onPress: () => addTransfert()),
              ],
            ),
          ),
        ));
  }
}
