import 'package:calendario/core/config/palette.dart';
import 'package:calendario/data/models/entities/client_entity.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SearchClient extends SearchDelegate {
  final List<ClientEntity> list;

  SearchClient(this.list);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _cargarData(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _cargarData(context);
  }

  Widget _cargarData(BuildContext context) {
    // final bloc = Provider.of<ScheduleReservationBloc>(context);

    if (list.isNotEmpty) {
      List<ClientEntity> listTemp;

      if (query.isEmpty) {
        listTemp = list;
      } else {
        listTemp =
            list.where((p) => p.name!.toLowerCase().contains(query)).toList();
      }

      return ListView(
          physics: const BouncingScrollPhysics(),
          children: listTemp.map((obj) {
            return ListTile(
              title: Row(
                children: <Widget>[
                  const Icon(
                    Icons.account_balance,
                    color: Palette.colorApp,
                    size: (25),
                  ),
                  const SizedBox(width: 20.0),
                  MyText(
                    text: obj.name!,
                    color: Palette.black,
                    size: (15 + 1),
                  )
                ],
              ),
              onTap: () {
                // final bloc =
                //     Provider.of<AppService>(context, listen: false);
                // bloc.serviceSelected = obj;
                // Navigator.pop(context);
                // close(context, null);
                close(context, obj);
              },
            );
          }).toList());
    } else {
      return const Center(
        child: MyText(
          // text: '${list.length}',
          text: 'No hay data',
          color: Colors.black,
          size: 14,
        ),
      );
    }
  }
}