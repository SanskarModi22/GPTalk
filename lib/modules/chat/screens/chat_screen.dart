import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../utils/common.dart';
import '../../../widgets/custom_colors.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/heading.dart';
import '../actions/chat_action.dart';
import '../models/chat_message.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  List<ChatMessage> chatMessages = [
    ChatMessage(message: AIBotConstants.introMessage, bot: true)
  ];
  bool apiCallInProgress = false;

  TextEditingController userMessageController = TextEditingController();

  Future<void> onSendPress() async {
    String userMessage = userMessageController.text;
    setState(() {
      chatMessages = [
        ...chatMessages,
        ChatMessage(message: userMessage, bot: false),
        const ChatMessage(
            message: '',
            bot: true), // Add an empty message to show loading indicator
      ];
      apiCallInProgress = true;
    });
    userMessageController.text = '';
    try {
      final response = await getResponseFromOpenAi(userMessage);
      String botMessage = response['choices'][0]['text'];
      setState(() {
        chatMessages.last = ChatMessage(message: botMessage, bot: true);
        apiCallInProgress = false;
      });
    } catch (error) {
      logApiErrorAndShowMessage(context, exception: error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Heading(
            'GPTalk',
            type: HeadingType.h4,
          ),
          backgroundColor: CustomColors.darkBackground,
          actions: <Widget>[
            IconButton(
                tooltip: 'Help',
                onPressed: (() {}),
                icon: const Icon(Icons.help)),
            IconButton(
                tooltip: 'Settings',
                onPressed: (() {}),
                icon: const Icon(Icons.settings))
          ]),
      body: Stack(children: [
        ListView.builder(
            itemCount: chatMessages.length + 1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == chatMessages.length) {
                // todo show typing indicator when loading
                return Container();
              }
              var chatItem = chatMessages[index];
              return Bubble(
                  nip: chatItem.bot ? BubbleNip.leftTop : BubbleNip.rightTop,
                  margin: const BubbleEdges.only(top: 16, left: 8, right: 16),
                  color: chatItem.bot ? Colors.white : CustomColors.lightText,
                  alignment:
                      chatItem.bot ? Alignment.topLeft : Alignment.topRight,
                  child: CustomText(chatItem.message));
            }),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              margin:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: CustomTextFormField(
                          onChanged: (value) => {},
                          controller: userMessageController,
                          hintText: 'Ask anything to GPTalk bot'),
                    ),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(
                      color: CustomColors.secondary,
                      shape: CircleBorder(),
                    ),
                    child: apiCallInProgress
                        ? const SizedBox(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : IconButton(
                            tooltip: 'Send',
                            onPressed: onSendPress,
                            color: CustomColors.primary,
                            icon: const Icon(Icons.send_rounded)),
                  )
                ],
              )),
        )
      ]),
    );
  }
}
