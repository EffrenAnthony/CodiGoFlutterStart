import 'dart:io';

import 'package:codigo_chat/services/database.dart';
import 'package:codigo_chat/utils/preferencias.dart';
import 'package:codigo_chat/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Chat extends StatefulWidget {
  String chatRoomId;
  Chat(this.chatRoomId);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Stream chats;
  String userName;
  TextEditingController messageController = TextEditingController();
  ImagePicker picker = ImagePicker();

  getMessage() async {
    userName = await Preferencias().getUserName();
    chats = await FirestoreHelper().getMessages(widget.chatRoomId);
    setState(() {
      chats = chats;
    });
  }

  sendMessage() {
    Map<String, dynamic> mensaje = {
      'sendBy': userName,
      'message': messageController.text,
      'time': DateTime.now().millisecondsSinceEpoch
    };
    FirestoreHelper().addMessage(widget.chatRoomId, mensaje);

    setState(() {
      messageController.text = '';
    });
  }

  Future pickImage() async {
    var pickedImage = await picker.getImage(
      source: ImageSource.camera,
    );
    print(pickedImage.path);
    uploadImageToFirebase(pickedImage.path);
  }

  Future uploadImageToFirebase(String imagePath) async {
    String fileName = basename(imagePath);
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child('tonyFile/$fileName');
    StorageUploadTask uploadTask = storageRef.putFile(File(imagePath));
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    snapshot.ref.getDownloadURL().then((value) => print(value));
  }

  @override
  void initState() {
    getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCodigo(context),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder(
                  stream: chats,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) => getMessageTile(
                              snapshot.data.documents[index]['message'],
                              snapshot.data.documents[index]['sendBy'],
                            ),
                          )
                        : Container();
                  }),
            )),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: messageController,
                      style: TextStyle(color: Colors.white),
                      decoration: textFieldInputDecoration('email'),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      sendMessage();
                    })
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        pickImage();
      }),
    );
  }

  Widget getMessageTile(String message, String user) {
    bool isMine = user == userName;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: isMine ? 48 : 15, right: isMine ? 15 : 48),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isMine ? Colors.greenAccent.shade700 : Colors.blueAccent,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              user,
              textAlign: isMine ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            Text(
              message,
              textAlign: isMine ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
