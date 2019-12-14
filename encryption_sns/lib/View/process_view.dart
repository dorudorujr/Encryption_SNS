import 'package:flutter/material.dart';
import 'package:encryption_sns/Bloc/application_bloc.dart';
import 'package:encryption_sns/Widget/ProcessView/bottom_navigationbar.dart';
import 'package:encryption_sns/Widget/ProcessView/result_text_card.dart';
import 'package:encryption_sns/Widget/ProcessView/input_text_field.dart';
import 'package:provider/provider.dart';

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
              Provider<ApplicationBloc>(
                create: (_) => ApplicationBloc.instance,
                dispose: (_, bloc) => bloc.dispose(),
                child: InputTextField(focusNode: this.focusNode),
              ),
              Provider<ApplicationBloc>(
                create: (_) => ApplicationBloc.instance,
                dispose: (_, bloc) => bloc.dispose(),
                child: ResultTextCard(),
              ),
            ],
          ),
        )
        ,
        bottomNavigationBar:
          Provider<ApplicationBloc>(
            create: (_) => ApplicationBloc.instance,
            dispose: (_, bloc) => bloc.dispose(),
            child: ProcessBottomNavigationBar(),
          ),
      ),
    );
  }
}
