import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/teste/message_model.dart';
import 'package:flutter_web_1/constant.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final TextEditingController controladorMensagemEnvio = TextEditingController();

List<Message> messages = [
  Message(
    sender: james,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
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
        color: isMe
            ? const Color.fromARGB(255, 217, 217, 217)
            : const Color.fromARGB(255, 160, 160, 160),
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
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
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
        color: Colors.white,
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
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: controladorMensagemEnvio,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Envie uma mensagem...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              print(controladorMensagemEnvio.text);
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
              print(messages[0].text);
              print(messages[1].text);
              print(messages[2].text);
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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                    reverse: true,
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
