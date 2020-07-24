import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solaus/presentation/bloc/bloc.dart';
import 'package:solaus/presentation/widgets/history_display.dart';
import 'package:solaus/presentation/widgets/loading_widget.dart';
import 'package:solaus/presentation/widgets/message_display.dart';

import 'package:solaus/injection_container.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                .add(GetHistoryForApp(idstring: 'asfd'));
            return MessageDisplay(
              message: 'Start searching!',
            );
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is HistoryLoaded) {
            return HistoryDisplay(history: state.history);
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
