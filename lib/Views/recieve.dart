import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/recieve_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'view_receptions.dart';

class Recieve extends StatelessWidget {
  const Recieve({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecController());
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
                "Veuillez fournir les informations suivantes pour nous aider à identifier la personne qui  qui reçoit l'argent :"),
            CtmTextField(
              text: 'Code',
              mycontroller: controller.code,
            ),
            CtmTextField(
              text: 'Nom',
              mycontroller: controller.name,
            ),
            CtmTextField(
              text: 'Post-nom',
              mycontroller: controller.midname,
            ),
            CtmTextField(
              text: 'Prenom',
              mycontroller: controller.surname,
            ),
            const SizedBox(
              height: 15,
            ),
            CtmButton(
              btntext: "ENVOYER",
              onPress: () => Get.to(GetTransfert(controller.code.text)),
            ),
          ],
        ),
      ),
    );
  }
}
