import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:word_bank/Model/word_model.dart';

class WordController extends GetxController{
  //since the loading by default should be true for fetch data
  var isLoading = true;
  var wordList = <WordModel>[];

  Future<void> getData() async {
    try{
      QuerySnapshot words = await FirebaseFirestore.instance.collection('word_bank').orderBy('title').get();
      wordList.clear();
      for(var word in words.docs){
        wordList.add(WordModel(word['title'], word['meaning'], word.id));
      }
      isLoading = false;
    } catch(e) {
      Get.snackbar('Error', '${e.toString()}');
    }
    //Update controller loading state
    update();
  }
}
