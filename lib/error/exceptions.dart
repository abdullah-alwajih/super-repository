part of '../super_repository.dart';

enum ExceptionTypes { cache, process, connection, timeout, unexpected, empty }

abstract class Exceptions implements Exception {
  final String? message;

  const Exceptions(this.message);

  factory Exceptions.fromStatusCode([int? statusCode = 4000, String? message]) {
    switch (statusCode) {
      case 0:
        return CustomException(message: message);
      case 204:
        return NoContentException(message: message);
      case 400:
        return BadRequestException(message: message);
      case 401:
        return UnauthorizedException(message: message);
      case 402:
        return PaymentRequiredException(message: message);
      case 403:
        return ForbiddenException(message: message);
      case 404:
        return NotFoundException(message: message);
      case 405:
        return MethodNotAllowedException(message: message);
      case 406:
        return NotAcceptableException(message: message);
      case 407:
        return ProxyAuthenticationRequiredException(message: message);
      case 408:
        return RequestTimeoutException(message: message);
      case 409:
        return ConflictException(message: message);
      case 410:
        return GoneException(message: message);
        case 411:
        return LengthRequiredException(message: message);
      case 434:
        return UserExistsException(message: message);
      case 439:
        return BlockedException(message: message);
      case 500:
        return InternalServerErrorException(message: message);
      case 501:
        return NotImplementedException(message: message);
      case 502:
        return BadGatewayException(message: message);
      case 503:
        return ServiceUnavailableException(message: message);
      case 504:
        return GatewayTimeoutException(message: message);
      case 505:
        return HTTPVersionNotSupportedException(message: message);
      case 506:
        return VariantAlsoNegotiatesException(message: message);
      case 507:
        return InsufficientStorageException(message: message);
      case 508:
        return LoopDetectedException(message: message);
      case 510:
        return NotExtendedException(message: message);
      case 511:
        return NetworkAuthenticationRequiredException(message: message);
      default:
        return UnexpectedException(message: message);
    }
  }

  factory Exceptions.fromEnumeration(ExceptionTypes type) {
    switch (type) {
      case ExceptionTypes.cache:
        return const CacheException();
      case ExceptionTypes.process:
        return const ProcessException();
      case ExceptionTypes.connection:
        return const ConnectionException();
      case ExceptionTypes.timeout:
        return const TimeoutException();
      case ExceptionTypes.empty:
        return const EmptyException();
      case ExceptionTypes.unexpected:
        return const UnexpectedException();
    }
  }
}

// const int statusCodes = 400;
class BadRequestException implements Exceptions {
  @override
  final String? message;

  const BadRequestException({this.message});
}

// const int statusCodes = 401;
class UnauthorizedException implements Exceptions {
  @override
  final String? message;

  const UnauthorizedException({this.message});
}

// const int statusCodes = 402;
class PaymentRequiredException implements Exceptions {
  @override
  final String? message;

  const PaymentRequiredException({this.message});
}

// const int statusCodes = 403;
class ForbiddenException implements Exceptions {
  @override
  final String? message;

  const ForbiddenException({this.message});
}

// const int statusCodes = 404;
class NotFoundException implements Exceptions {
  @override
  final String? message;

  const NotFoundException({this.message});
}

// const int statusCodes = 405;
class MethodNotAllowedException implements Exceptions {
  @override
  final String? message;

  const MethodNotAllowedException({this.message});
}

// const int statusCodes = 406;
class NotAcceptableException implements Exceptions {
  @override
  final String? message;

  const NotAcceptableException({this.message});
}

// const int statusCodes = 407;
class ProxyAuthenticationRequiredException implements Exceptions {
  @override
  final String? message;

  const ProxyAuthenticationRequiredException({this.message});
}

// const int statusCodes = 408;
class RequestTimeoutException implements Exceptions {
  @override
  final String? message;

  const RequestTimeoutException({this.message});
}

// const int statusCodes = 409;
class ConflictException implements Exceptions {
  @override
  final String? message;

  const ConflictException({this.message});
}

// const int statusCodes = 410;
class GoneException implements Exceptions {
  @override
  final String? message;

  const GoneException({this.message});
}

// const int statusCodes = 411;
class LengthRequiredException implements Exceptions {
  @override
  final String? message;

  const LengthRequiredException({this.message});
}

// const int statusCodes = 412;
class PreconditionFailedException implements Exceptions {
  @override
  final String? message;

  const PreconditionFailedException({this.message});
}

// const int statusCodes = 413;
class PayloadTooLargeException implements Exceptions {
  @override
  final String? message;

  const PayloadTooLargeException({this.message});
}

// const int statusCodes = 414;
class URITooLongException implements Exceptions {
  @override
  final String? message;

  const URITooLongException({this.message});
}

// const int statusCodes = 415;
class UnsupportedMediaTypeException implements Exceptions {
  @override
  final String? message;

  const UnsupportedMediaTypeException({this.message});
}

// const int statusCodes = 416;
class RangeNotSatisfiableException implements Exceptions {
  @override
  final String? message;

  const RangeNotSatisfiableException({this.message});
}

// const int statusCodes = 417;
class ExpectationFailedException implements Exceptions {
  @override
  final String? message;

  const ExpectationFailedException({this.message});
}

// const int statusCodes = 431;
class RequestHeaderFieldsTooLargeException implements Exceptions {
  @override
  final String? message;

  const RequestHeaderFieldsTooLargeException({this.message});
}

// const int statusCodes = 451;
class UnavailableForLegalReasonsException implements Exceptions {
  @override
  final String? message;

  const UnavailableForLegalReasonsException({this.message});
}

// Server error responses

// const int statusCodes = 500;
class InternalServerErrorException implements Exceptions {
  @override
  final String? message;

  const InternalServerErrorException({this.message});
}

// const int statusCodes = 501;
class NotImplementedException implements Exceptions {
  @override
  final String? message;

  const NotImplementedException({this.message});
}

// const int statusCodes = 502;
class BadGatewayException implements Exceptions {
  @override
  final String? message;

  const BadGatewayException({this.message});
}

// const int statusCodes = 503;
class ServiceUnavailableException implements Exceptions {
  @override
  final String? message;

  const ServiceUnavailableException({this.message});
}

// const int statusCodes = 504;
class GatewayTimeoutException implements Exceptions {
  @override
  final String? message;

  const GatewayTimeoutException({this.message});
}

// const int statusCodes = 505;
class HTTPVersionNotSupportedException implements Exceptions {
  @override
  final String? message;

  const HTTPVersionNotSupportedException({this.message});
}

// const int statusCodes = 506;
class VariantAlsoNegotiatesException implements Exceptions {
  @override
  final String? message;

  const VariantAlsoNegotiatesException({this.message});
}

// const int statusCodes = 507;
class InsufficientStorageException implements Exceptions {
  @override
  final String? message;

  const InsufficientStorageException({this.message});
}

// const int statusCodes = 508;
class LoopDetectedException implements Exceptions {
  @override
  final String? message;

  const LoopDetectedException({this.message});
}

// const int statusCodes = 510;
class NotExtendedException implements Exceptions {
  @override
  final String? message;

  const NotExtendedException({this.message});
}

// const int statusCodes = 511;
class NetworkAuthenticationRequiredException implements Exceptions {
  @override
  final String? message;

  const NetworkAuthenticationRequiredException({this.message});
}

class CacheException implements Exceptions {
  @override
  final String? message;

  const CacheException({this.message});

  CacheException copyWith({String? message}) =>
      CacheException(message: message ?? this.message);
}

class EmptyException implements Exceptions {
  @override
  final String? message;

  const EmptyException({this.message});

  EmptyException copyWith({String? message}) =>
      EmptyException(message: message ?? this.message);
}

class UniqueException implements Exceptions {
  @override
  final String? message;

  const UniqueException({this.message});

  UniqueException copyWith({String? message}) =>
      UniqueException(message: message ?? this.message);
}

class UserExistsException implements Exceptions {
  @override
  final String? message;

  const UserExistsException({this.message});

  UserExistsException copyWith({String? message}) =>
      UserExistsException(message: message ?? this.message);
}

class ReceiveException implements Exceptions {
  @override
  final String? message;

  const ReceiveException({this.message});

  ReceiveException copyWith({String? message}) =>
      ReceiveException(message: message ?? this.message);
}

class PasswordException implements Exceptions {
  @override
  final String? message;

  const PasswordException({this.message});

  PasswordException copyWith({String? message}) =>
      PasswordException(message: message ?? this.message);
}

class UnexpectedException implements Exceptions {
  @override
  final String? message;

  const UnexpectedException({this.message});

  UnexpectedException copyWith({String? message}) =>
      UnexpectedException(message: message ?? this.message);
}

class BlockedException implements Exceptions {
  @override
  final String? message;

  const BlockedException({this.message});

  BlockedException copyWith({String? message}) =>
      BlockedException(message: message ?? this.message);
}

class CustomException implements Exceptions {
  @override
  final String? message;

  const CustomException({this.message});

  CustomException copyWith({String? message}) =>
      CustomException(message: message ?? this.message);
}

class NoContentException implements Exceptions {
  @override
  final String? message;

  const NoContentException({this.message});

  NoContentException copyWith({String? message}) =>
      NoContentException(message: message ?? this.message);
}

class ConnectionException implements Exceptions {
  @override
  final String? message;

  const ConnectionException({this.message});

  ConnectionException copyWith({String? message}) =>
      ConnectionException(message: message ?? this.message);
}

class ProcessException implements Exceptions {
  @override
  final String? message;

  const ProcessException({this.message});

  ProcessException copyWith({String? message}) =>
      ProcessException(message: message ?? this.message);
}

class TimeoutException implements Exceptions {
  @override
  final String? message;

  const TimeoutException({this.message});

  TimeoutException copyWith({String? message}) =>
      TimeoutException(message: message ?? this.message);
}

class UnknownException implements Exceptions {
  @override
  final String? message;

  const UnknownException({this.message});

  UnknownException copyWith({String? message}) =>
      UnknownException(message: message ?? this.message);
}

class ValidationException implements Exceptions {
  @override
  final String? message;

  const ValidationException({this.message});

  ValidationException copyWith({String? message}) =>
      ValidationException(message: message ?? this.message);
}
