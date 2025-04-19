import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_events.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabbarBloc(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Main Screen'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: BlocBuilder<TabbarBloc, TabbarStates>(
                builder: (context, state) {
                  return TabBar(
                      onTap: (val) {
                        context.read<TabbarBloc>().add(TabValueSelector(val));
                      },
                      tabs: const [
                        Tab(text: 'Tab 1'),
                        Tab(text: 'Tab 2'),
                        Tab(text: 'Tab 3'),
                      ]);
                },
              ),
            ),
          ),
          body: BlocBuilder<TabbarBloc, TabbarStates>(
            builder: (context, state) {
              return TabBarView(children: [
                Center(
                    child: state.tabValue == 0
                        ? const Text('Content for Tab 1')
                        : null),
                const Center(child: Text('Content for Tab 2')),
                const Center(child: Text('Content for Tab 3')),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
