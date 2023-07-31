part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UserState {}

class UsersLoadingState extends UserState {}

class UsersLoadedState extends UserState {
  final List<UserModel> usersList;
  const UsersLoadedState(this.usersList);
  @override
  List<Object> get props => [usersList];
}

class UsersErrorState extends UserState {
  final String errormsg;
  const UsersErrorState(this.errormsg);
  @override
  List<Object> get props => [errormsg];
}
