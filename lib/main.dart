import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final MessageBox messageBox = MessageBox();
  final Model pageModel = Model(
    image: Image.asset(
      'assets/images/lake1.jpg', //###### image path. please change this path as yours ######
      fit: BoxFit.cover,
    ),
    name: 'Shinhoo Kim', /*Change the text to your NAME and STUDENT NUMBER*/
    studentNumber: '21900136',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            /*ImageSection*/
            SizedBox(
              width: 600,
              height: 240,
              child: pageModel.image,
            ),
            /*TitleSection*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: ProfilePanel(
                pageModel: pageModel,
              ),
            ),
            const Divider(height: 1.0, color: Colors.black), /*Add a Divider under the titleSection */
            /*ButtonSection*/
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0), // Especially, in buttonSection Container needs padding ( EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0) )
              child: ButtonPanel(),
            ),
            const Divider(height: 1.0, color: Colors.black), /*Add a Divider under the buttonSection*/
            /*MessageSection*/
            const Padding(
              padding: EdgeInsets.all(32.0), //Set the padding area(EdgeInsets.all(32.0)) to all four sides of the Text Section
              child: MessagePanel(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePanel extends StatelessWidget {
  const ProfilePanel({Key? key, required this.pageModel}) : super(key: key);

  final Model pageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pageModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            addVerticalSpace(5),
            Text(
              pageModel.studentNumber,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const FavoriteButton(),
      ],
    );
  }
}


class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = true;
  int favoriteCount = 41;
  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        favoriteCount++;
      } else {
        favoriteCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleFavorite,
      child: Container(
        decoration: const BoxDecoration(
        ),
        child: Row(
          children: [
            Icon(
              isFavorited ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
            Text(
              favoriteCount.toString(),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonPanel extends StatelessWidget {
  const ButtonPanel({Key? key}) : super(key: key);

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [ /*make 5 buttons using _buildButtonColumn()*/
        _buildButtonColumn(Colors.black, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.black, Icons.message, 'MESSAGE'),
        _buildButtonColumn(Colors.black, Icons.email, 'EMAIL'),
        _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
        _buildButtonColumn(Colors.black, Icons.description, 'ETC'),
      ],
    );
  }
}

class MessagePanel extends StatefulWidget {
  const MessagePanel({Key? key}) : super(key: key);

  @override
  State<MessagePanel> createState() => _MessagePanelState();
}

class _MessagePanelState extends State<MessagePanel> {
  final MessageBox messageBox = MessageBox();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: messageBox.messageList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 40,
          child: MessageCard(
              message: messageBox.messageList[index]!,
          ),
        );
      },
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row( /*Place the Icon on the left side, and the text on the right side*/
      crossAxisAlignment: CrossAxisAlignment.start, /*Use CrossAxisAlignment.start for each row and column*/
      children: [
        message.icon,
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0), /*Apply padding (EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0) to the text part of textSection. */
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, /*Use CrossAxisAlignment.start for each row and column*/
            children: [
              Text(message.title, style: const TextStyle(fontWeight: FontWeight.bold)), /*Change the font weight of the Text('Recent Message') bold*/
              Text(message.contents),
            ],
          ),
        ),
      ],
    );
  }
}

Widget addHoriziontalSpace(double size){
  return SizedBox(width: size,);
}
Widget addVerticalSpace(double size){
  return SizedBox(height: size,);
}


class Model {
  final String name;
  final String studentNumber;
  final Image image;

  Model(
      {required this.name,
      required this.studentNumber,
      required this.image});
}

class Message {
  final Icon icon;
  final String title;
  final String contents;
  final String id;

  Message(
      {required this.icon,
      required this.title,
      required this.contents,
      required this.id});
}

class MessageBox {
  List<Message?> _messagebox = [
    Message(
        icon: const Icon(Icons.message, size: 40,), /*Icon : Icons.message, size: 40.0*/
        title: 'Recent Message',
        contents: 'Long time no see!',
      id: '0'/*const Uuid().v4()*/,
    ),
  ];

  void addMessage(Message newMessage) {
    _messagebox.add(newMessage);
  }

  void deleteMessage(Message newMessage) {}

  List<Message?> get messageList => _messagebox;
}
