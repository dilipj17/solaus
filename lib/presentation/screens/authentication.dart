import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solaus/presentation/bloc/bloc.dart';
import 'package:solaus/presentation/screens/camera.dart';
import 'package:solaus/presentation/screens/homepage.dart';
import 'package:solaus/presentation/widgets/loading_widget.dart';

import '../../injection_container.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
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
            BlocProvider.of<SolausBloc>(context).add(LogInWithGooglePressed());
            return LoadingWidget();
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is AuthSuccessful) {
            return TakePictureScreen();
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
