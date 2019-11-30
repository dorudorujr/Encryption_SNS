import 'package:flutter/material.dart';
import 'package:encryption_sns/Bloc/application_bloc.dart';
import 'package:encryption_sns/Bloc/application_bloc_provider.dart';

class InputTextField extends StatefulWidget {
  final FocusNode focusNode;

  InputTextField({Key key, @required this.focusNode}) : super(key: key);

  @override
  InputTextFieldState createState() => new InputTextFieldState();
}

class InputTextFieldState extends State<InputTextField> {
  final _textFieldController = TextEditingController();

  TextEditingController get getTextField => _textFieldController;

  @override
  void initState() {
    super.initState();
  }

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ApplicationBlocProvider.of(context).applicationBloc;
    return Container(
      padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Text"
        ),
        controller: _textFieldController,
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        maxLength: 500,
        maxLengthEnforced: true,
        textAlign: TextAlign.left,
        focusNode: widget.focusNode,
        onChanged: (text) {
          _tellTextToApplicationBloc(bloc,text);
        },
      ),
    );
  }

  _tellTextToApplicationBloc(ApplicationBloc bloc, String text) {
    bloc.addProcessInputTextFieldController.add(_textFieldController.text);
  }
}