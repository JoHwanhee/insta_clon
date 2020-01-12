import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;


  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['userPhotoUrl']),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(document['email']),
                        Text(document['displayName']),
                      ],
                    )
                  ),


                ],

              ),
            ),

            Hero(
              tag: document['photoUrl'],
              child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Image.network(document['photoUrl'])
              ),
            ),
            Text(document['contents'])
          ],
        ),
      ),
    );
  }
}

