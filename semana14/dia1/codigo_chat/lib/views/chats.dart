import 'package:codigo_chat/services/auth.dart';
import 'package:codigo_chat/services/database.dart';
import 'package:codigo_chat/utils/authenticate.dart';
import 'package:codigo_chat/utils/preferencias.dart';
import 'package:codigo_chat/views/chat.dart';
import 'package:codigo_chat/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Stream chats;
  String userName = '';

  getUserChats() async {
    userName = await Preferencias().getUserName();
    FirestoreHelper().getUserChats(userName).then((snapshots) {
      setState(() {
        chats = snapshots;
      });
    });
  }

  @override
  void initState() {
    getUserChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthService().logOut();
              Preferencias().saveLogInState(false);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Authenticate(),
                  ));
            },
          )
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: chats,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Chat(snapshot
                                    .data.documents[index]['chatRoomId']),
                              ));
                        },
                        title: Text(
                          snapshot.data.documents[index]['chatRoomId']
                              .toString()
                              .replaceAll('_', '')
                              .replaceAll(userName, ""),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  : Container();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(),
              ));
        },
      ),
    );
  }
}
