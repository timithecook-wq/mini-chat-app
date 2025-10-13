import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chat_message.dart';
import 'package:flutter_app/widgets/chatlist_topbar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class ChatItem {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final bool isUnread;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    this.isUnread = false,
  });
}

final List<ChatItem> chatList = [
  ChatItem(
    name: "Daniel O.",
    lastMessage: "Yo, you around?",
    time: "10:42 PM",
    avatarUrl: "assets/images/dp.jpg",
    isUnread: true,
  ),
  ChatItem(
    name: "Faith",
    lastMessage: "Sure, see you then!",
    time: "9:10 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "BigJay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "BJay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "BgJay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "igJay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "Bigay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "BigJy",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "Jay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "Biay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "By",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "Bay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "ay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "Biy",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "gJay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "iJay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "Bigy",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "Big",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "gay",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
  ChatItem(
    name: "BJ",
    lastMessage: "check out this New convo started by @jay",
    time: "8:35 PM",
    avatarUrl: "assets/images/dp.jpg",
  ),
];

class _ChatScreenState extends State<ChatScreen> {
  bool isDms = true;
  bool isGroups = false;
  int _selectedindex = 0;

  Widget _buildBody() {
    final colors = Theme.of(context).colorScheme;
    switch (_selectedindex) {
      case 0:
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: colors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide.none,
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        Topbar(),

                        Row(
                          children: [
                            Text(
                              "Chats",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.filter_list,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() {
                                isDms = true;
                                isGroups = false;
                              }),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.black87),
                                ),
                                elevation: 3,
                                color: isDms
                                    ? colors.surface
                                    : colors.secondary,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Dms",
                                        style: TextStyle(
                                          fontSize: 20,
                                          shadows: isDms
                                              ? [
                                                  Shadow(
                                                    color: Colors.black26,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 1),
                                                  ),
                                                ]
                                              : null,
                                          color: isDms
                                              ? colors.secondary
                                              : colors.surface,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isDms
                                              ? colors.secondary
                                              : colors.surface,
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: Text(
                                          "8",
                                          style: TextStyle(
                                            color: isDms
                                                ? colors.surface
                                                : colors.secondary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => setState(() {
                                isGroups = true;
                                isDms = false;
                              }),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.black87),
                                ),
                                elevation: 3,
                                color: isGroups
                                    ? colors.surface
                                    : colors.secondary,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Groups",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: isGroups
                                              ? colors.secondary
                                              : colors.surface,
                                          shadows: isGroups
                                              ? [
                                                  Shadow(
                                                    color: Colors.black26,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 1),
                                                  ),
                                                ]
                                              : null,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isGroups
                                              ? colors.secondary
                                              : colors.surface,
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                            color: isGroups
                                                ? colors.surface
                                                : colors.secondary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatList[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: chat.isUnread
                            ? Color(0xFFA8DCFF)
                            : Colors.transparent,
                        border: Border(
                          top: BorderSide(color: Colors.black87),
                          bottom: BorderSide(color: Colors.black87),
                          left: BorderSide(color: Colors.black87),
                          right: BorderSide(color: Colors.black87),
                        ),
                        boxShadow: chat.isUnread
                            ? [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      width: double.infinity,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatMessageScreen(
                                name: chat.name,
                                lastMessage: chat.lastMessage,
                                avatarUrl: chat.avatarUrl,
                              ),
                            ),
                          );
                        },
                        onLongPress: () {},
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(chat.avatarUrl),
                        ),
                        title: Text(
                          chat.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          chat.lastMessage,
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: chat.isUnread
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              chat.time,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            if (chat.isUnread)
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors.surface,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      case 1:
        return Center(
          child: Text(
            "Circles",
            style: TextStyle(fontSize: 24, color: colors.surface),
          ),
        );
      case 2:
        return Center(
          child: Text(
            "Me",
            style: TextStyle(fontSize: 24, color: colors.surface),
          ),
        );
      default:
        return Center(child: Text("Unknown tab"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.secondary,
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colors.secondary,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedindex,
          onTap: (index) {
            setState(() {
              _selectedindex = index;
            });
          },
          selectedItemColor: colors.surface,
          unselectedItemColor: Colors.black87,
          backgroundColor: colors.secondary,
          selectedFontSize: 18,
          unselectedFontSize: 12,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Circles"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
          ],
        ),
      ),
    );
  }
}
