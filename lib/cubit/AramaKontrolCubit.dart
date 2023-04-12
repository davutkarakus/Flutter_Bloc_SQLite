
import 'package:flutter_bloc/flutter_bloc.dart';

class AramaKontrolCubit extends Cubit<bool> {
  AramaKontrolCubit():super(false);

  bool aramaKontrol(bool kontrol) {
    kontrol =  !state;
    emit(kontrol);
    return kontrol;
  }
}