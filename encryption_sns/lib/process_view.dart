import 'package:flutter/material.dart';
import 'package:encryption_sns/application_bloc.dart';
import 'package:flutter/services.dart';
import 'package:encryption_sns/Widget/ProcessView/bottom_navigationbar.dart';
import 'package:encryption_sns/Widget/ProcessView/result_text_card.dart';

class ProcessView extends StatefulWidget {
  final ApplicationBloc applicationBloc;

  ProcessView({Key key, @required this.applicationBloc}) : super(key: key);

  @override
  _ProcessViewState createState() => new _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {
  final appBar = AppBar(title: Text('処理画面'));
  final textFieldController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

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
              _textField(),
              ResultTextCard(applicationBloc: widget.applicationBloc),
            ],
          ),
        )
        ,
        bottomNavigationBar: ProcessBottomNavigationBar(applicationBloc: widget.applicationBloc, textFieldController: textFieldController),
      ),
    );
  }

  Widget _textField() {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Text"
        ),
        controller: textFieldController,
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        maxLength: 500,
        maxLengthEnforced: true,
        textAlign: TextAlign.left,
        focusNode: this.focusNode,
      ),
    );
  }
}
