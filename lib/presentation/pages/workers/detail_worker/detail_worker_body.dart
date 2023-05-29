import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/models/responses/person_response.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import 'detail_worker_bloc.dart';

class DetailWorkerBody extends StatelessWidget {
  const DetailWorkerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<DetailWorkerBloc>(context);
    final PersonResponse worker = bloc.worker;
    final myLoading = MyLoading(context);
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            height: 220,
            child: (!MyUtils.stringIsnullOrEmpty(worker.uImage))
                ? FadeInImage(
                    image: NetworkImage(
                      worker.uImage!,
                    ),
                    placeholder: const AssetImage('assets/gif/loading.gif'),
                    height: 180,
                    fit: BoxFit.fill,
                  )
                : Image.asset('assets/png/no-image.png', fit: BoxFit.cover),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   height: 220,
          //   child: (!MyUtils.stringIsnullOrEmpty(worker.uImage))
          //       ? MyCachedNetworkImage(
          //           url: worker.uImage!,
          //         )
          //       : Image.asset('assets/png/no-image.png', fit: BoxFit.cover),
          // ),
          const MySizedBoxHeight(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const MyText(
                  text: 'Datos del empleado',
                  color: Palette.colorApp,
                  fontWeight: FontWeight.w700,
                  size: SizeText.text3 - 1,
                  maxLines: 2,
                ),
                const MySizedBoxHeight(),
                MyText(
                  text: worker.description ?? '',
                  fontWeight: FontWeight.w500,
                  size: SizeText.text4,
                  maxLines: 10,
                ),
                const MySizedBoxHeight(kDouble: 20),
                const MyText(
                  text: 'Servicios',
                  color: Palette.colorApp,
                  fontWeight: FontWeight.w700,
                  size: SizeText.text3 - 1,
                  maxLines: 2,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  final service = bloc.services[index];
                  return MyCardContainer(
                    backgroundColor: Palette.gray,
                    child: Row(
                      children: [
                        Flexible(
                          child: MyText(
                            text: service.description ?? '',
                            maxLines: 3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: bloc.services.length),
          ),

          //

          //MaterialPageRoute(

          //
        ],
      ),
    );
  }
}

class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: 230,
      width: double.infinity,
      imageBuilder: (_, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (_, __) => const Center(
          child: CircularProgressIndicator(
        color: Palette.primaryColor,
      )),
      errorWidget: (_, __, ___) => Container(
        color: Palette.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.camera_alt_outlined,
              color: Palette.gray,
            ),
            MyText(
              text: 'Imagen no disponible',
              textAlign: TextAlign.center,
              color: Palette.gray,
            ),
          ],
        ),
      ),
    );
  }
}
