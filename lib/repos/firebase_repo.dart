import 'package:dartz/dartz.dart';
import 'package:pocketbook/utils/app_repo_utils.dart';

abstract class FirebaseRepo {
  Future<Either<DataError, void>> deleteDocument({
    required String documentId,
  });
}
