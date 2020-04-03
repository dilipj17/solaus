import 'package:solaus/data/models/book_model.dart';
import 'package:solaus/data/models/history_model.dart';
import 'package:solaus/data/models/result_model.dart';
import 'package:solaus/data/models/user_profile_model.dart';

abstract class SolausRemoteDataSource {
  Future<BookModel> getBooks();
  Future<HistoryModel> getHistory(String id);
  Future<ResultModel> getResult(String id);
  Future<UserProfileModel> getUserProfile(String id);
}
