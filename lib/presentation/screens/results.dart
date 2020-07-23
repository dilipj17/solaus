import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solaus/presentation/bloc/bloc.dart';
import 'package:solaus/presentation/widgets/result_display.dart';
import 'package:solaus/presentation/widgets/loading_widget.dart';
import 'package:solaus/presentation/widgets/message_display.dart';

import 'package:solaus/injection_container.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sd'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<SolausBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SolausBloc>(),
      child: BlocBuilder<SolausBloc, SolausState>(
        builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<SolausBloc>(context)
                .add(GetResultsForApp(idstring: 'sdfsdf'));
            return MessageDisplay(
              message: 'Start searching!',
            );
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is ResultLoaded) {
            return ResultDisplay(result: state.result);
          } else if (state is Error) {
            return MessageDisplay(
              message: state.message,
            );
          }
          return null;
        },
      ),
    );
  }
}
