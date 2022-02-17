
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:random_cat/presentation/bloc/cat_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if (state is CatInitial) {
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is CatLoadedState) {
              return Center(
                child: state.catImage != null
                    ? Image.network(state.catImage.url)
                    : Text('Image not loaded yet'),
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {
          BlocProvider.of<CatBloc>(context).add(GetCatEvent());
        },
      ),
    );
  }
}