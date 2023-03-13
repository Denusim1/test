import 'package:flutter/material.dart';
import 'email_sender.dart';

class BalconyTypesScreen extends StatelessWidget {
  const BalconyTypesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balcony Types'),
      ),
      body: Center(
        child: Text('Choose balcony type'),
      ),
    );
  }
}

class BalconyInsideScreen extends StatefulWidget {
  const BalconyInsideScreen({Key? key}) : super(key: key);

  @override
  _BalconyInsideScreenState createState() => _BalconyInsideScreenState();
}

class _BalconyInsideScreenState extends State<BalconyInsideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balcony Inside'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              EmailSender.sendEmail();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/balcony_empty.jpg',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Choose color and texture'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/balcony_empty.jpg',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Choose color and texture'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/balcony_empty.jpg',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Choose color and texture'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/balcony_empty.jpg',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Choose color and texture'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
