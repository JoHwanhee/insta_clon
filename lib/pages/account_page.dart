import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;

  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  int _postCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance.collection('post').where('email', isEqualTo: widget.user.email)
    .getDocuments()
    .then((snapShot){
      setState(() {
        _postCount = snapShot.documents.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }



  _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
          icon: Icon(Icons.exit_to_app),
        )
      ],
    );
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ),
                  Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                        SizedBox(
                          width: 28.0,
                          height: 28.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ]))
                ],
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text(
                widget.user.displayName,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            '${_postCount}\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Text('0\n팔로워',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
          Text('0\n팔로잉',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
