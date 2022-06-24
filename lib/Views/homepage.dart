import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:word_bank/Controller/word_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WordController wordController = Get.put(WordController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WordController>(
        init: WordController(),
        initState: (_){},
        builder: (wordController){
          wordController.getData();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: Text('Word Bank', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2
              ),),
            ),
            body: Center(
              child: wordController.isLoading ? CircularProgressIndicator() :
              ListView.separated(
                itemCount: wordController.wordList.length,
                itemBuilder: (BuildContext context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.deepOrangeAccent.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(wordController.wordList[index].title, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start),
                              Text(wordController.wordList[index].meaning, style: TextStyle(fontSize: 16),overflow: TextOverflow.visible,textAlign: TextAlign.start,),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.edit)),
                              IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.deleteLeft)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index){
                  return Divider(thickness: 2, color: Colors.black,);
                }, ),
            ),
          );
        });
  }
}
