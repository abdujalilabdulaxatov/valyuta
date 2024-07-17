import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valyuta_calculator/cubits/valyuta_cubit.dart';
import 'package:valyuta_calculator/cubits/valyuta_state.dart';
import 'package:valyuta_calculator/services/get_services_valyuta.dart';
import 'package:valyuta_calculator/ui/screens/calculate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<ValyutaCubit>().getValyuta();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Valyuta"),
      ),
      body: BlocBuilder<ValyutaCubit, ValyutaState>(builder: (ctx, state) {
        if (state is InitialState) {
          return const Center(
            child: Text("Ma'lumotlar yuklanmoqda"),
          );
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorState) {
          return Center(child: Text(state.message));
        }
        final lst = (state as LoadedState).lst;
        return ListView.builder(
            itemCount: lst.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => Calculate(
                          name: lst[index].name,
                          price: lst[index].price,
                          code: lst[index].code)));
                },
                child: ListTile(
                  title: Text(lst[index].name),
                  subtitle: Text("${lst[index].price}"),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
              );
            });
      }),
    );
  }
}
