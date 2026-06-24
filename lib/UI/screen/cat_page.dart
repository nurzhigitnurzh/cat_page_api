import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cat_bloc.dart';
import '../../bloc/cat_state.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CatBloc, CatState>(
        builder: (context, state) {
          if (state is CatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CatLoaded) {
            return SizedBox.expand(
              child: Image.network(
                state.cats.first.url,
                fit: BoxFit.cover,
                webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}