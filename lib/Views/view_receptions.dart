import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class GetTransfert extends StatelessWidget {
   const GetTransfert(    this.documentId, {super.key}); 
  final String documentId;
 

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('transactions');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['sname']} ${data['slastname']}");
        }

        return Text("loading");
      },
    );
  }
}
// class TransactionInformation extends StatefulWidget {
//   const TransactionInformation({super.key});

//   @override
//   _TransactionInformationState createState() => _TransactionInformationState();
// }

// class _TransactionInformationState extends State<TransactionInformation> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('transactions').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['montant']),
//               subtitle: Column(
//                 children: [
//                   const Text(
//                     "Informations sur l'expéditeur",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Info(
//                     title: 'Nom',
//                     data: data['sname'.toString()],
//                   ),
//                   Info(
//                     title: 'Post-nom',
//                     data: data['smidname'.toString()],
//                   ),
//                   Info(
//                     title: 'prénom',
//                     data: data['ssurname'.toString()],
//                   ),
//                   Info(
//                     title: 'Mobile',
//                     data: data['snum'.toString()],
//                   ),
//                   Info(
//                     title: 'Adresse',
//                     data: data['sadress'.toString()],
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
