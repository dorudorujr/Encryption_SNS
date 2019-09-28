import 'package:flutter/material.dart';
import 'package:encryption_sns/process_view.dart';
import 'package:encryption_sns/application_bloc.dart';
import 'package:encryption_sns/application_bloc_provider.dart';

class ReleaseRaisedButton extends StatelessWidget {
  final TextEditingController passWordTextFieldController;

  ReleaseRaisedButton({Key key, @required this.passWordTextFieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = ApplicationBlocProvider.of(context).applicationBloc;
    return RaisedButton(
      color: Colors.red,
      onPressed: (){
        bloc.setPassWord(passWordTextFieldController.text);
        Navigator.push(
          context,
          new MaterialPageRoute<Null>(
              settings: const RouteSettings(name: "/processView"),
              builder: (BuildContext context) => new ProcessView(bloc)
          ),
        );
        passWordTextFieldController.clear();
      },
      child: Text("解除"),
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}