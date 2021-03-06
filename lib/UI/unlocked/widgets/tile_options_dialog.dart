import 'package:cboard_mobile/UI/unlocked/screens/tiles/EditTile.dart';
import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileOptionsDialog extends StatelessWidget {
  final TileModel tileModel;

  const TileOptionsDialog({Key key, @required this.tileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        AlertDialog(
          // insetPadding: EdgeInsets.symmetric(horizontal: 0),
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 0),
          content: Container(
            // alignment: Alignment.topCenter,
            width: _screenSize.width * 0.7,
            height: _screenSize.height * 0.35,
            child: Card(
              // margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: _screenSize.height * 0.35 - 22,
                        color: tileModel.backgroundColor,
                        child: tileModel.image.endsWith(".svg") ? SvgPicture.asset(
                          "assets" + tileModel.image,
                          width: 277.11,
                        ) : Image.asset("assets" + tileModel.image,
                          width: 277.11 ),
                      ),
                    ),
                    Container(
                      height: 22,
                      child: Center(
                        child: Text(tileModel.labelKey.split('.').last,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "Robotto",
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Spacer(),
        BottomSheet(
          onClosing: () {
            print("Bottom Sheet Close");
          },
          // height: _screenSize.height*0.4,
          builder: (context) => Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.edit,
                  color: paua,
                ),
                title: Text('Edit Tiles'),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTileScreen(tileModel: tileModel,)))
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.layers,
                  color: paua,
                ),
                title: Text('Duplicate'),
              ),
              ListTile(
                leading: Icon(
                  Icons.visibility_off,
                  color: paua,
                ),
                title: Text('Hide'),
              ),
              ListTile(
                leading: Icon(
                  Icons.delete,
                  color: paua,
                ),
                title: Text(
                  'Delete',
                  style: TextStyle(color: cinnabar),
                ),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTileScreen(
                                tileModel: tileModel,
                                isDelete: true,
                              )))
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}