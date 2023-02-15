import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/presentation/bloc/schedule_bloc.dart';
import 'package:calendario/presentation/pages/agent/agent_reprogramming/agent_repro_body.dart';
import 'package:calendario/presentation/pages/agent/agent_reprogramming/agent_repro_detail_page.dart';
import 'package:calendario/presentation/widgets/confirm_alternate.dart';
import 'package:calendario/presentation/widgets/my_background_with_buttons.dart';
import 'package:calendario/presentation/widgets/my_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgentReproPage extends StatefulWidget {
  static String routeName = "/AgentReproPage";

  const AgentReproPage({Key? key}) : super(key: key);

  @override
  State<AgentReproPage> createState() => _AgentReproPageState();
}

class _AgentReproPageState extends State<AgentReproPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final agendaBloc = Provider.of<ScheduleBloc>(context, listen: false);
      await agendaBloc.getRandeDatePerson();
      await agendaBloc.getProgramTurn(date: MyUtils.formatDate(DateTime.now()));
      agendaBloc.dateSelectedTurn = MyUtils.formatDate(DateTime.now());
      //

      //
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

    if (bloc.errorRepro != null) {
      if (bloc.errorRepro!.statusCode != 200) {
        Future.delayed(Duration.zero, () async {
          confirmAlternantError(
              context: context,
              errormodel: bloc.errorRepro!.error!,
              statuscode: bloc.errorRepro!.statusCode!);
          bloc.errorRepro = null;
        });
      }
    }

    // return BackgroundPage(
    return MyBackGroundWithButtons(
      titleAppBar: 'REPROGRAMAR CITA',
      // centerTitle: false,
      isLoading: bloc.isLoadingPageRepro,

      bottomExpanded: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: MyButtom(
          text: 'CONTINUAR',
          color: Palette.blue,
          onTap: (bloc.programTurnSelected != null)
              ? () {
                  Navigator.pushNamed(context, AgentReproDetailPage.routeName);
                  // print(bloc.rangeDatePerson?.initialDate);
                }
              : null,
        ),
      ),
      child: AgentReproBody(),
    );
  }
}
