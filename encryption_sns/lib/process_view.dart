import 'package:flutter/material.dart';
import 'package:encryption_sns/application_bloc.dart';
import 'package:encryption_sns/Widget/ProcessView/bottom_navigationbar.dart';
import 'package:encryption_sns/Widget/ProcessView/result_text_card.dart';
import 'package:encryption_sns/Widget/ProcessView/input_text_field.dart';

class ProcessView extends StatefulWidget {
  final ApplicationBloc applicationBloc;

  ProcessView({Key key, @required this.applicationBloc}) : super(key: key);

  @override
  _ProcessViewState createState() => new _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {
  final appBar = AppBar(title: Text('処理画面'));
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InputTextField(applicationBloc: widget.applicationBloc, focusNode: this.focusNode),
              ResultTextCard(applicationBloc: widget.applicationBloc),
            ],
          ),
        )
        ,
        bottomNavigationBar: ProcessBottomNavigationBar(applicationBloc: widget.applicationBloc),
      ),
    );
  }
}
