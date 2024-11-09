import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/strings_manager.dart';

class ClassificationListCubit extends Cubit<String> {
  ClassificationListCubit() : super(AppStrings.surah);

  void selectItem(String selectedItem) {
    emit(selectedItem);
  }
}
