
import 'package:flutter/material.dart';

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
