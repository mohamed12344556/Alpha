import 'package:flutter_bloc/flutter_bloc.dart';

enum PageType { payment, privacy, settings }

class PageNavigationCubit extends Cubit<PageType> {
  PageNavigationCubit() : super(PageType.payment);

  void setPage(PageType pageType) => emit(pageType);
}
