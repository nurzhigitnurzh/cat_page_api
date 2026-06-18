import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cat_bloc.dart';
import '../../bloc/cat_event.dart';
import '../../bloc/cat_state.dart';
import '../../models/cat_model.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CatBloc, CatState>(
        builder: (context, state) {
          if (state is CatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CatLoaded) {
            return ListView.builder(
              itemCount: state.cats.length,
              itemBuilder: (context, index) {
                final CatModel cat = state.cats[index];
                return Image.network(
                  cat.url,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}