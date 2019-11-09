
import 'package:for_coworking/feature/home/models/home.dart';
import 'package:for_coworking/services/home.dart';
import 'package:for_coworking/src/app_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends AppBloc{
  final HomeService _homeService;

  final _home = BehaviorSubject<Home>();

  HomeBloc(this._homeService);

  ValueObservable<Home> get home => _home.stream;

  Future getHome() async {
    cleanUp();
    try{
      super.isLoading();

      final home = await _homeService.requestHome();
      _home.sink.add(home);
      super.isLoading();
    } catch (e){
      super.setError(e);
      _home.addError(e);
      super.isLoading();
    }
  }

  @override
  void cleanUp() {
    _home.sink.add(null);
    super.cleanUp();
  }

  @override
  void dispose() {
    _home.close();
    super.dispose();
  }

}