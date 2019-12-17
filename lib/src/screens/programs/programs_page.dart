import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:congreso_incca/src/screens/programs/components/card-item.dart';
import './bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    ProgramsBloc _bloc = BlocProvider.of<ProgramsBloc>(context);
    _bloc.dispatch(LoadProgramsEvent());
    return BlocBuilder<ProgramsBloc, ProgramsState>(
        bloc: _bloc,
        builder: (BuildContext context, ProgramsState state) {
          items.clear();
          items.add(ClipShape(
            name: 'Programa',
            hasImage: true,
            image: URL_LOGO_APP,
          ));
          if (state.inProgress) {
            items.add(
                Container(child: Center(child: CircularProgressIndicator())));
          }
          state.programsByDay.forEach((program) => items.add(CardItem(
                program: program,
              )));
          return Scaffold(
            appBar: AppBar(title: Text('Programa')),
            drawer: MainDrawer(),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (int index) {
                _bloc.dispatch(LoadProgramsByDayEvent(id: index));
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text('Jueves 05'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text('Viernes 06'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text('Sabado 07'),
                ),
              ],
              currentIndex: state.selectedTab,
              selectedItemColor: Colors.amber[800],
            ),
          );
        });
  }
}
