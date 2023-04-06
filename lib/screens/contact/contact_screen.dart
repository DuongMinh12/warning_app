import 'package:flutter/material.dart';
class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),),
      ),
      body: Center(
        child: Text('contact page'),
      ),
    );
  }
}
