import 'package:chatgpt_client/chatgpt_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpt/views/widgets/bubble_chat.dart';
import 'package:flutter_gpt/views/widgets/waiting_response.dart';

import '../constants/app_consts.dart';
import '../helper/snackbar_widget.dart';
import '../model/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();

  List<Message> messagesList = [];
  final client = ChatGPTClient(apiKey: AppConsts.apiKey);
  String text = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 96, 100),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return BubbleChatWidget(
                        message: messagesList[index],
                      );
                    },
                    itemCount: messagesList.length,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          client.clearHistoryList();
                          messagesList.clear();
                        });
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          enabledBorder: buildOutlineInputBorder(),
                          focusedBorder: buildOutlineInputBorder(),
                          hintText: 'Talk to Flutter GPT...',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (messageController.text.isEmpty) {
                          showSnackBar(
                              context, 'You must enter a message', Colors.red);
                        } else {
                          try {
                            final userMessage = messageController.text;
                            setState(() {
                              messagesList.add(
                                  Message(content: userMessage, isUser: true));
                              messageController.clear();
                            });

                            setState(() {
                              isLoading = true;
                            });

                            final gptResponse =
                                await client.sendMessage(userMessage);

                            setState(() {
                              messagesList.add(
                                  Message(content: gptResponse, isUser: false));
                              isLoading = false;
                            });
                          } catch (exception) {
                            showSnackBar(
                                context, exception.toString(), Colors.red);
                            setState(() {
                              isLoading =
                                  false; // Set loading flag to false in case of an exception
                            });
                          }
                        }
                      },
                      icon: const Icon(Icons.send, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          WaitingResponseWidget(isLoading: isLoading)
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
