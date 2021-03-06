import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/UI/unlocked/screens/UnlockedHomepage.dart';
// import 'package:cboard_mobile/data/mockData.dart';
import 'package:cboard_mobile/models/data/data_unlocked.dart';
import 'package:cboard_mobile/models/data/jsonString.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  List<TileModel> words = [];
  String fullSent = "";
  int _unlockCount = 0;

  void addWords(TileModel newTile) {
    words.add(newTile);
    //For adding sentence to top bar
    // String newWord = newTile.name != "Edit" ? newTile.name : newTile.content;
    String newWord = newTile.labelKey.split('.').last;
    fullSent += newWord + ". ";
    print(fullSent);
    notifyListeners();
  }

  List<TileModel> getWords() {
    return words;
  }

  void removeWords() {
    if (words.length > 0) {
      fullSent = fullSent.substring(
          0, fullSent.length - words.last.labelKey.split('.').last.length - 2);
      words.removeLast();
    }
    notifyListeners();
  }

  String getFullSent() {
    return fullSent;
  }

  void tapUnlock(BuildContext context) {
    _unlockCount++;
    if (_unlockCount != 3 && _unlockCount < 5) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Press ${5 - _unlockCount} times to unlock"),
        duration: Duration(seconds: 1),
      ));
    }
    if (_unlockCount == 3) {
      final _screenSize = MediaQuery.of(context).size;
      // unlock dialog
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Theme.of(context).primaryColor,
              insetPadding:
                  EdgeInsets.symmetric(horizontal: _screenSize.width * 0.17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: SizedBox(
                width: _screenSize.width * 0.3,
                height: _screenSize.height * 0.2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.lock,
                      color: white,
                      size: 50,
                    ),
                    // SizedBox(height: 20,),
                    Text(
                      "Press 2 more times to unlock",
                      style: TextStyle(
                        color: white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          });
    } else if (_unlockCount == 5) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UnlockedHomeScreen(
                data: getData(jsonString).folders,
                folderId: "root",
              )));
    }
  }

  resetLock() {
    _unlockCount = 0;
  }
}
