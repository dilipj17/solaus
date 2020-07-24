import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solaus/presentation/bloc/bloc.dart';
import 'package:solaus/presentation/widgets/books_display.dart';
import 'package:solaus/presentation/widgets/loading_widget.dart';
import 'package:solaus/presentation/widgets/message_display.dart';

import 'package:solaus/injection_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<SolausBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SolausBloc>(),
      child: BlocBuilder<SolausBloc, SolausState>(
        builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<SolausBloc>(context).add(GetBooksForApp());
            return MessageDisplay(
              message: 'Start searching!',
            );
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is BooksLoaded) {
            return BooksDisplay(books: state.books);
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
