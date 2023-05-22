import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user_model.dart';
import '../../logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import '../../logic/bloc/user_list_bloc.dart';
import '../cards/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocBuilder<UserListBloc, ItemListState<UserModel>>(
        builder: (context, state) {
          var size = MediaQuery.of(context).size;
          return SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
              shrinkWrap: true,
              children: state.list.map((e) => UserCard(e)).toList(),
            ),
          );
        },
      ),
    );
  }
}
