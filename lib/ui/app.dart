import 'package:bloc_tutorial/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/user_repository.dart';
import '../logic/bloc/album_list_bloc.dart';
import '../logic/bloc/app_error_bloc/app_error_bloc.dart';
import '../logic/bloc/comment_list_bloc.dart';
import '../logic/bloc/loading_bloc/loading_bloc.dart';
import '../logic/bloc/photo_list_bloc.dart';
import '../logic/bloc/post_list_bloc.dart';
import '../logic/bloc/user_list_bloc.dart';
import 'dialogs/show_app_error.dart';
import 'global/keys.dart';
import 'loading/loading_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: "Foo",
        theme: ThemeData(primaryColor: Colors.blue),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        builder: (context, child) {
          return MultiBlocListener(
            listeners: [
              BlocListener<LoadingBloc, LoadingState>(
                listener: (_, state) {
                  if (state is LoadingStateOn) {
                    LoadingScreen.instance().show(
                      navigatorKey: navigatorKey,
                      text: "Loading",
                    );
                  } else {
                    LoadingScreen.instance().hide();
                  }
                },
              ),
              BlocListener<AppErrorBloc, AppErrorState>(
                listener: (context, state) {
                  if (state.error != null) {
                    final error = state.error!;

                    showAppError(
                      error: error,
                      context: navigatorKey.currentContext!,
                    ).then((value) {
                      context
                          .read<AppErrorBloc>()
                          .add(AppErrorRemoveEvent(error));
                    });
                  }
                },
              ),
            ],
            child: child!,
          );
        },
      ),
    );
  }

  List<BlocProvider> _getProviders() {
    final loadingBloc = LoadingBloc();
    final appErrorBloc = AppErrorBloc();

    final photoListBloc = PhotoListBloc(
      appErrorBloc: appErrorBloc,
      loadingBloc: loadingBloc,
    );
    final postListBloc = PostListBloc(
      appErrorBloc: appErrorBloc,
      loadingBloc: loadingBloc,
    );
    final commentListBloc = CommentListBloc(
      appErrorBloc: appErrorBloc,
      loadingBloc: loadingBloc,
    );

    final userListBloc = UserListBloc(
      appErrorBloc: appErrorBloc,
      loadingBloc: loadingBloc,
    );

    final albumListBloc = AlbumListBloc(
      appErrorBloc: appErrorBloc,
      loadingBloc: loadingBloc,
      photoListBloc: photoListBloc,
    );

    userListBloc.add(
      LoadUsersEvent(
        loader: UserRepository().getAll,
      ),
    );

    return <BlocProvider>[
      BlocProvider<LoadingBloc>(create: (_) => loadingBloc),
      BlocProvider<AppErrorBloc>(create: (_) => appErrorBloc),
      BlocProvider<AlbumListBloc>(create: (_) => albumListBloc),
      BlocProvider<PhotoListBloc>(create: (_) => photoListBloc),
      BlocProvider<PostListBloc>(create: (_) => postListBloc),
      BlocProvider<CommentListBloc>(create: (_) => commentListBloc),
      BlocProvider<UserListBloc>(create: (_) => userListBloc),
    ];
  }
}
