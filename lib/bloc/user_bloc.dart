import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repo/users_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;

  UsersBloc(this.userRepo) : super(UsersLoadingState()) {
    on<UsersListLoadedEvent>((event, emit) async {
      try {
        emit(UsersLoadingState());
        var data = await userRepo.getUsers();
        debugPrint(data.toString());
        emit(UsersLoadedState(data));
      } catch (e) {
        emit(UsersErrorState(e.toString()));
      }
    });
  }
}
