import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';

class TabCubit extends Cubit<AppTab> {
  TabCubit() : super(AppTab.home);

  /// Change Tab
  void changeTab({
    required AppTab tab,
  }) {
    emit(tab);
  }
}
