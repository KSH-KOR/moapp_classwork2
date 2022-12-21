import 'package:flutter/material.dart';
import 'buttons/button_panel.dart';
import 'model.dart';
import 'panels/message.dart';
import 'panels/profile.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Demo',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     home: const Homepage(),
//   ));
// }

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