import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> chatData = [
    {
      "name": "Rozanne Barrientes",
      "message": "A wonderful serenity has taken...",
      "count": 2,
      "avatar": "asset/images/person.jpg"
    },
    {
      "name": "Anaya Sanji",
      "message": "What about Paypal?",
      "count": 1,
      "avatar": "asset/images/11.png"
    },
    {
      "name": "Elizabeth Olsen",
      "message": "We should move forward to talk with...",
      "count": 0,
      "avatar": null
    },
    {
      "name": "Tony Stark",
      "message": "Let's have a call for future projects...",
      "count": 0,
      "avatar": "asset/images/44.png"
    },
    {
      "name": "Banner",
      "message": "I don't think I can fit on this UI...",
      "count": 0,
      "avatar": "asset/images/22.png"
    },
    {
      "name": "Steave",
      "message": "Move in some special work recently so...",
      "count": 0,
      "avatar": "asset/images/33.png"
    },
    {
      "name": "Thor",
      "message": "You should be an Avenger I think...",
      "count": 0,
      "avatar": null
    },
    {
      "name": "Natasha",
      "message": "I am going to die in Avengers Endgame...",
      "count": 0,
      "avatar": "asset/images/44.png"
    },
    {
      "name": "Thor",
      "message": "You should be an Avenger I think...",
      "count": 0,
      "avatar": null
    },
    {
      "name": "Natasha",
      "message": "I am going to die in Avengers Endgame...",
      "count": 0,
      "avatar": null
    },
    {
      "name": "Hak Eye",
      "message": "I have to save Natasha in Endgame...",
      "count": 0,
      "avatar": null
    },
  ];
  bool isLoading = false;
  Future<String> fetchData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3)); // Simulating delay
    setState(() {
      isLoading = false;
    });
    return "Data fetched successfully!";
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return isLoading
          ? Lottie.asset(
              'asset/images/loading.json', // Make sure to add an animation file
              height: 200,
              repeat: true,
            ).centered()
          : Scaffold(
              backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
              appBar: AppBar(
                backgroundColor:
                    theamNotifier.isDark ? darkColor : Colors.white,
                title: Text("Message",
                    style: TextStyle(
                      color: theamNotifier.isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                actions: [
                  const Icon(CupertinoIcons.search, color: lightTextColor)
                      .pOnly(right: 20),
                ],
              ),
              body: ListView.builder(
                itemCount: chatData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                    onDismissed: (direction) {
                      // Handle dismiss action here
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: chat['avatar'] != null
                            ? AssetImage(chat['avatar'])
                            : null,
                        backgroundColor: mainColor,
                        child: chat['avatar'] == null
                            ? Text(
                                chat['name'][0],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            : null,
                      ),
                      title: Text(
                        chat['name'],
                        style: TextStyle(
                            color: theamNotifier.isDark
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        chat['message'],
                        style: const TextStyle(color: lightTextColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: chat['count'] > 0
                          ? Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: mainColor,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${chat['count']}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            )
                          : null,
                    ),
                  );
                },
              ),
            );
    });
  }
}
