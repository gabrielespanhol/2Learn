import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/FinalModels/message_model.dart';
import 'package:flutter_web_1/constant.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

final TextEditingController controladorMensagemEnvio = TextEditingController();

List<Message> messages = [
  Message(
    sender: james,
    text: 'Conseguiu fazer a atividade que te passei?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    text:
        'Ainda falta uma parte, preciso tirar algumas duvidas na proxima aula',
    isLiked: false,
    unread: true,
  ),
  // Message(
  //   sender: james,
  //   text: 'How\'s the doggo?',
  //   isLiked: false,
  //   unread: true,
  // ),
  // Message(
  //   sender: james,
  //   text: 'All the food',
  //   isLiked: true,
  //   unread: true,
  // ),
  // Message(
  //   sender: currentUser,
  //   text: 'Nice! What kind of food did you eat?',
  //   isLiked: false,
  //   unread: true,
  // ),
  // Message(
  //   sender: james,
  //   text: 'I ate so much food today.',
  //   isLiked: false,
  //   unread: true,
  // ),
];

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    Size size = MediaQuery.of(context).size;
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: (size.height + size.width) / 12,
      decoration: BoxDecoration(
        color: isMe ? KPrimaryColor : kSecondaryColor,
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.text,
            style: const TextStyle(
              color: KTextcolor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      decoration: const BoxDecoration(
        color: kChatcolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      // color: Colors.red,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.file_present),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              // ignore: unused_local_variable
              final result = await FilePicker.platform.pickFiles();
            },
          ),
          IconButton(
            icon: const Icon(Icons.file_upload_outlined),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              // ignore: unused_local_variable
              final result = await FilePicker.platform.pickFiles();
            },
          ),
          Expanded(
            child: TextField(
              controller: controladorMensagemEnvio,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'mensagem...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              if (controladorMensagemEnvio.text != "") {
                messages.add(
                  Message(
                    sender: currentUser,
                    text: controladorMensagemEnvio.text,
                    isLiked: false,
                    unread: true,
                  ),
                );
              }
              controladorMensagemEnvio.text = "";
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kChatcolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: ListView.builder(
                    reverse: false,
                    padding: const EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
