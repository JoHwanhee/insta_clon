import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clon',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Instagram에 오신 것을 환영합니다.',
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text('사진과 동영상을 보려면 팔로우 하세요'),
              Padding(
                padding: EdgeInsets.all(16.0),
              ),
              SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                          ),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(widget.user.photoUrl),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          Text(
                            widget.user.email,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(widget.user.displayName),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.network(
                                      'https://scontent-icn1-1.cdninstagram.com/v/t51.2885-19/s150x150/44793071_335876253659988_7115766103636180992_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com&_nc_ohc=W0vy2j6UTFMAX895AzU&oh=83b3e88e4f99cfd24233c164f8a4b337&oe=5EAEF5A5'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.network(
                                      'https://scontent-icn1-1.cdninstagram.com/v/t51.2885-19/s150x150/44793071_335876253659988_7115766103636180992_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com&_nc_ohc=W0vy2j6UTFMAX895AzU&oh=83b3e88e4f99cfd24233c164f8a4b337&oe=5EAEF5A5'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.network(
                                      'https://scontent-icn1-1.cdninstagram.com/v/t51.2885-19/s150x150/44793071_335876253659988_7115766103636180992_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com&_nc_ohc=W0vy2j6UTFMAX895AzU&oh=83b3e88e4f99cfd24233c164f8a4b337&oe=5EAEF5A5'),
                                ),
                              ]),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                          Text('Facebook 친구'),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                          RaisedButton(
                            child: Text("팔로우"),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
