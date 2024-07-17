import 'package:utmccos/Model/Tools/Entities/entities.dart';
import 'package:utmccos/Model/Home/HomeDataSource/home_source.dart';
import 'package:utmccos/Model/Home/HomeRepository/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepositoryInstance = HomeRepository(
      dataSource: HomeRemoteDataSource(httpClient: HttpPackage().dio));
  HomeRepository get homeRepository => homeRepositoryInstance;
}
