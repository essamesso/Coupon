import 'dart:async';
import 'package:copoun/DataLayer/Models/usermodel.dart';
import 'package:copoun/bloc/bloc.dart';

class UserBloc extends Bloc {
  final userController = StreamController<List<RandomUserModel>>.broadcast();

  @override
  void dispose() {
    // TODO: implement dispose
    userController.close();
  }
}

UserBloc userBloc = UserBloc();
