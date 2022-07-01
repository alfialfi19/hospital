import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';
import 'package:hospital/ui/ui.dart';
import 'package:intl/intl.dart';

class CheckHistoryListScreen extends StatelessWidget with RandomMixin {
  const CheckHistoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionHistoryCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        transactionHistoryRepository:
            context.read<BaseTransactionHistoryRepository>(),
      )..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.checkHistory),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: ListView(
          padding: const EdgeInsets.all(
            26.0,
          ),
          children: [
            BlocBuilder<TransactionHistoryCubit, BaseState>(
              builder: (context, state) {
                List<TransactionHistory> data = [];

                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.hospitalPrimary,
                    ),
                  );
                }

                if (state is ErrorState) {
                  return Center(
                    key: const Key(UIKeys.transactionHistoryListErrorContainer),
                    child: Text(
                      Wording.somethingWentWrong,
                      style: FontHelper.h7Regular(),
                    ),
                  );
                }

                if (state is EmptyState) {
                  return Center(
                    key: const Key(UIKeys.transactionHistoryListEmptyContainer),
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
                    return CheckHistoryItem(
                      key: Key(UIKeys.cardItemTransactionHistory(index)),
                      actionKey:
                          Key(UIKeys.cardItemTransactionHistoryAction(index)),
                      polyValue:
                          data[index].queue?.doctorSchedule?.poly?.name ?? "-",
                      dateTimeValue: DateFormat("dd MMMM yyyy", "id_ID").format(
                            DateTime.parse(data[index].queue?.date ?? "-"),
                          ) +
                          " " +
                          getRandomTime(),
                      doctorName:
                          data[index].queue?.doctorSchedule?.doctor?.name ??
                              "-",
                      action: () => Navigator.pushNamed(
                        context,
                        RouteName.checkHistoryDetailScreen,
                        arguments: ScreenArgument(
                          data: data[index],
                        ),
                      ),
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
}
