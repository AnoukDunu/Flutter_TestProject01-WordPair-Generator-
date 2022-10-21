import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//main pade interface?
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

//main class which is extended by RandomWords interface?
class RandomWordsState extends State<RandomWords>{

  //variable which calls a list a WordPaid words
  final _randomWordPairs = <WordPair>[];

  //variable to store saved wordpairs
  final _savedWordPairs = Set<WordPair>();

  //widget to build the listview
  Widget _buildList(){
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item){
        //generating a divider between entries
        if(item.isOdd) return Divider();

        final index = item ~/ 2;

        if(index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        //calls widget to put the wordpairs in each row
        return _buildRow(_randomWordPairs[index]);
      }
     
    );
  }

  //widget to output a random word pair per list item row
  Widget _buildRow(WordPair pair){

    final alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle (fontSize: 18)),

      //adding a working 'favorites' button
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border, color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if(alreadySaved){
            _savedWordPairs.remove(pair);
          }
          else{
            _savedWordPairs.add(pair);
          }
        });
      },
    );

  }

  //main widget in randomWords class. 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('WordPare Generator')),
      body: _buildList(),
    );
  }
}