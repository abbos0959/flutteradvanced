import 'package:course/core/errors/failure.dart';
import 'package:course/src/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

typedef Resultfuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = Resultfuture<void>;
