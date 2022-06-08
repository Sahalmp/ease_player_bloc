import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/home_bloc.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, spreadRadius: 0, blurRadius: 0.5),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.folder), label: 'Files'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie_creation), label: 'Videos'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My')
              ],
              currentIndex: state.index,
              onTap: (index) {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeEvent.getbottomnavbarpage(index: index));
              },
              selectedItemColor: const Color(0xff233F78),
            ),
          ),
        );
      },
    );
  }
}