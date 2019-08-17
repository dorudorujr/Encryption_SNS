import 'package:flutter/material.dart';

class ProcessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPage 2')),
      body: Center(
        child: Text('Back to MyPage 1')
      ),
    );
  }
}
