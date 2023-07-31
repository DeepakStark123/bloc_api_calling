import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_demo/bloc/user_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UsersBloc>().add(UsersListLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Screen"),
      ),
      body: BlocBuilder<UsersBloc, UserState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 10),
              itemCount: state.usersList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(state.usersList[index].id.toString()),
                  title: Text(state.usersList[index].name.toString()),
                  subtitle: Text(state.usersList[index].username.toString()),
                );
              },
            );
          } else if (state is UsersErrorState) {
            return Center(child: Text(state.errormsg.toString()));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
