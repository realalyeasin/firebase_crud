import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/send_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/money_texfield.dart';
import '../widgets/numerical_textfield.dart';
import 'savetransfert.dart';

class Send extends StatelessWidget {
  const Send({super.key});

  @override
  Widget build(BuildContext context) {
    final transcontroller = Get.put(TransactionController());
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
                "Veuillez fournir les informations suivantes pour nous aider à identifier la personne qui envoi l'argent :"),
            CtmTextField(
              text: 'Nom',
              mycontroller: transcontroller.sname,
            ),
            CtmTextField(
              text: 'Post-nom',
              mycontroller: transcontroller.smidname,
            ),
            CtmTextField(
              text: 'Prenom',
              mycontroller: transcontroller.ssurname,
            ),
            CtmTextField(
              text: 'Adresse',
              mycontroller: transcontroller.sadress,
            ),
            NumTextField(
              mycontroller1: transcontroller.snum,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                "Veuillez fournir les informations suivantes pour nous aider à identifier la personne qui reçoit l'argent :"),
            CtmTextField(
              text: 'Nom',
              mycontroller: transcontroller.rname,
            ),
            CtmTextField(
              text: 'Post-nom',
              mycontroller: transcontroller.rmidname,
            ),
            CtmTextField(
              text: 'Prenom',
              mycontroller: transcontroller.rsurname,
            ),
            const SizedBox(
              height: 10,
            ),
            CtmTextField(
              text: 'Adresse',
              mycontroller: transcontroller.radress,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                "Veuillez fournir les informations suivantes sur le transfert :"),
            MoneyTextField(
              text: 'Montant',
              devisecontroller: transcontroller.sdevise,
              montantcontroller: transcontroller.smontant,
            ),
            MoneyTextField(
              text: 'Frais de Transfert',
              devisecontroller: transcontroller.pdevise,
              montantcontroller: transcontroller.pmontant,
            ),
            const SizedBox(
              height: 15,
            ),
            CtmButton(
                btntext: "ENVOYER",
                onPress: () => Get.to(const AddTransfert())),
          ],
        ),
      ),
    );
  }
}
