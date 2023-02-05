
import 'package:super_localizations/super_localizations.dart';
import 'package:super_repository/super_repository.dart';

abstract class Failure {
  static String exceptionToMessage(Exceptions exception) {
    switch (exception.runtimeType) {
      case InternalServerErrorException:
        return exception.message ?? SuperTranslations.of.errorServerException;
      case ConflictException:
        return exception.message ?? SuperTranslations.of.errorConflictException;
      case CacheException:
        return exception.message ?? SuperTranslations.of.errorCacheException;
      case NoContentException:
        return exception.message ?? SuperTranslations.of.errorEmptyException;
      case ConnectionException:
        return exception.message ??
            SuperTranslations.of.errorConnectionException;
      case NotFoundException:
        return exception.message ?? SuperTranslations.of.errorNotFoundException;
      case NotAcceptableException:
        return exception.message ?? SuperTranslations.of.errorInvalidException;
      case GoneException:
        return exception.message ?? SuperTranslations.of.errorExpireException;

      case UserExistsException:
        return exception.message ??
            SuperTranslations.of.errorUserExistsException;
      case PasswordException:
        return exception.message ?? SuperTranslations.of.errorPasswordException;

      case UnauthorizedException:
        return exception.message ??
            SuperTranslations.of.errorUnauthenticatedException;

      case ForbiddenException:
        return exception.message ??
            SuperTranslations.of.errorUnexpectedException;
      case BlockedException:
        return exception.message ?? SuperTranslations.of.errorBlockedException;
      case EmptyException:
        return exception.message ?? SuperTranslations.of.errorEmptyException;

      case CustomException:
        return exception.message ??
            SuperTranslations.of.errorUnexpectedException;
      default:
        return exception.message ??
            SuperTranslations.of.errorUnexpectedException;
    }
  }
}
