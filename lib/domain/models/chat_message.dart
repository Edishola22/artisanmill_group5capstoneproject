class ChatMessage {
  final String message;
  final String sender;
  final DateTime timeStamp;

  ChatMessage({
    required this.message,
    required this.sender,
  }) : timeStamp = DateTime.now();

  static List<ChatMessage> messages = [
    ChatMessage(message: 'Hello', sender: 'A'),
    ChatMessage(message: 'Hello', sender: 'B'),
    ChatMessage(message: 'Just saw your works on your bio. I must say your works are really nice.', sender: 'A'),
    ChatMessage(message: 'Wow', sender: 'B'),
    ChatMessage(message: 'Thank you very much', sender: 'B'),
    ChatMessage(message: "I’m actually preparing for my wedding and"
        "I will like you to do my makeup. ", sender: 'A'),
    ChatMessage(message: 'Would that be possible?', sender: 'A'),
    ChatMessage(message: 'Let me check', sender: 'B'),
    ChatMessage(message: 'When is your wedding? I mean the day.', sender: 'B'),
    ChatMessage(message: '3rd December. That’s next week Saturday.', sender: 'A'),
    ChatMessage(message: "Alright. I'll be available", sender: 'B'),
  ];
}
