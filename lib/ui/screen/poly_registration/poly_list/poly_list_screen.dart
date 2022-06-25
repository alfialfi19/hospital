import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';
import 'package:intl/intl.dart';

import '../../../ui.dart';

class PolyListScreen extends StatelessWidget {
  const PolyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyQueue? _myQueueData;

    if (ModalRoute.of(context)!.settings.arguments is MyQueue) {
      _myQueueData = ModalRoute.of(context)!.settings.arguments as MyQueue;
    }

    return BlocProvider(
      create: (context) => PolyCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        polyRepository: context.read<BasePolyRepository>(),
      )..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.selectPoly),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: ListView(
          padding: const EdgeInsets.all(
            26.0,
          ),
          children: [
            _buildHeaderSection(
              context,
              selectedDate: _myQueueData?.date,
            ),
            const SizedBox(
              height: 40.0,
            ),
            BlocBuilder<PolyCubit, BaseState>(
              builder: (context, state) {
                List<Poly> data = [];

                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.hospitalPrimary,
                    ),
                  );
                }

                if (state is ErrorState) {
                  return Center(
                    child: Text(
                      Wording.somethingWentWrong,
                      style: FontHelper.h7Regular(),
                    ),
                  );
                }

                if (state is EmptyState) {
                  return Center(
                    child: Text(
                      Wording.noData,
                      style: FontHelper.h7Regular(),
                    ),
                  );
                }

                if (state is LoadedState) {
                  data = state.data;
                }

                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return SquareButton(
                      buttonText: data[index].name ?? "-",
                      textStyle: FontHelper.h7Regular(
                        color: Palette.white,
                      ),
                      onTap: () {
                        _myQueueData = _myQueueData?.copyWith(
                          poly: data[index],
                        );

                        Navigator.pushNamed(
                          context,
                          RouteName.doctorSelectionScreen,
                          arguments: ScreenArgument(
                            data: _myQueueData,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(
    BuildContext context, {
    String? selectedDate,
  }) {
    String convertedDate = DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(
      DateTime.parse(selectedDate ?? "-"),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${Wording.dateVisit} -> $convertedDate",
          style: FontHelper.h6Bold(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        RichText(
          text: TextSpan(
            text: Wording.note,
            style: FontHelper.h9Regular(
              color: Palette.hospitalPrimary,
            ),
            children: [
              TextSpan(
                text: Wording.doctorListNotes,
                style: FontHelper.h9Regular(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
