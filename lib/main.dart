import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'bloc/cat_bloc.dart';
import 'bloc/cat_event.dart';
import 'repository/cat_repository.dart';
import 'UI/screen/cat_page.dart';
void main() {
  Bloc.observer = TalkerBlocObserver();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatBloc(CatRepository())..add(FetchCatsEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CatPage(),
      ),
    );
  }
}