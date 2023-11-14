import 'package:get/get.dart';
import 'package:getx_mvvm/models/list_model.dart';
import 'package:getx_mvvm/utils/utils.dart';
import '../../../data/response/status.dart';
import '../../../repository/list_repository.dart';

class ListViewModel extends GetxController {

  final _myrepository = ListRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userlist = ListModel().obs;
  RxString error = ''.obs;
  void setrxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setuserlist(ListModel _value) => userlist.value = _value;
  void seterror(String _value) => error.value = _value;

  void listApiViewModel() {
    _myrepository.listApi().then((value) {
      setrxRequestStatus(Status.COMPLETED);
      setuserlist(value);
    }).onError((error, stackTrace) {
      seterror(error.toString());
      setrxRequestStatus(Status.ERROR);
      Utils.snackbar('Error', error.toString());
    });
  }

  void refreshlistApiViewModel() {
    setrxRequestStatus(Status.LOADING);
    _myrepository.listApi().then((value) {
      setrxRequestStatus(Status.COMPLETED);
      setuserlist(value);
    }).onError((error, stackTrace) {
      seterror(error.toString());
      setrxRequestStatus(Status.ERROR);
      Utils.snackbar('Error', error.toString());
    });
  }
}
