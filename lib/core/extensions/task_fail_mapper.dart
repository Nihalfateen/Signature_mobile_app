import 'package:dartz/dartz.dart';

import '../../common/model/failure_model.dart';

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<FailureModel, U>> mapFailure() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as FailureModel;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
