import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solaus/presentation/bloc/bloc.dart';
import 'package:solaus/presentation/widgets/loading_widget.dart';
import 'package:solaus/presentation/widgets/message_display.dart';

import 'package:solaus/injection_container.dart';
import 'package:solaus/presentation/widgets/user_profile_display.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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
                .add(GetUserProfileForApp(idstring: 'sdfsdf'));
            return MessageDisplay(
              message: 'Start searching!',
            );
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is UserProfileLoaded) {
            return UserProfileDisplay(userprofile: state.userprofile);
          } else if (state is Error) {
            return MessageDisplay(
              message: state.message,
            );
          }
        },
      ),
    );
  }
}
