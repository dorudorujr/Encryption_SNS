import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:encryption_sns/Bloc/application_bloc.dart';

class ResultTextCard extends StatefulWidget {
  ResultTextCard({Key key,}) : super(key: key);

  @override
  ResultTextCardState createState() => new ResultTextCardState();
}

class ResultTextCardState extends State<ResultTextCard> {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ApplicationBloc>(context);
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 400,
        height: 200,
        child: StreamBuilder(
          stream: bloc.showingText,                //出力用streamを取得
          builder: (context, snapshot) {
            return _resultText(snapshot.hasData ? snapshot.data.toString() : "");
          },
        ),
      ),
    );
  }

  //TODO:statelessで定義できると思う
  Widget _resultText(String resultText) {
    return GestureDetector(
      child: new Tooltip(preferBelow: false,
          message: "Copy", child: new Text(resultText)),
      onTap: () {
        Clipboard.setData(new ClipboardData(text: resultText));
      },
    );
  }
}