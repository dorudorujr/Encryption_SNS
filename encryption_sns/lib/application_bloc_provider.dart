import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:encryption_sns/application_bloc.dart';

class ApplicationBlocProvider extends InheritedWidget {
  const ApplicationBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  ApplicationBloc get applicationBloc => ApplicationBloc();

  @override
  bool updateShouldNotify(_) => true;

  static ApplicationBlocProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ApplicationBlocProvider);
  }
}