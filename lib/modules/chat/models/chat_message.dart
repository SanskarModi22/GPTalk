import 'package:flutter/foundation.dart';

@immutable
class ChatMessage {
  final String message; // A String that contains the chat message
  final bool
      bot; // A boolean indicating whether the message was sent by a bot or not

  const ChatMessage(
      {required this.message,
      required this.bot}); // Constructor that initializes the message and bot properties

  @override
  bool operator ==(Object other) {
    // Overrides the == operator to compare instances of ChatMessage
    if (identical(this, other)) {
      return true; // If the two objects are identical, they are equal
    }
    return other is ChatMessage &&
        other.message == message &&
        other.bot == bot; // Otherwise, compare the message and bot properties
  }

  @override
  int get hashCode =>
      message.hashCode ^
      bot.hashCode; // Overrides the hashCode getter to generate a hash code based on the message and bot properties

  @override
  String toString() {
    // Overrides the toString method to provide a human-readable representation of the ChatMessage instance
    return 'ChatMessage{message: $message, bot: $bot}';
  }
}
