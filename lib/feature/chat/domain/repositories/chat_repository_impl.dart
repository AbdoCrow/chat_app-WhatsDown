import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/feature/chat/domain/repositories/chat_repository.dart';
import 'package:chat_app/feature/chat/domain/entities/chat_entity.dart';
import 'package:chat_app/feature/chat/domain/datasources/chat_remote_datasource.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;

  ChatRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ChatEntity>>> getChats() async {
    try {
      final chatDtos = await _remoteDataSource.getChats();
      return Right(chatDtos.map((dto) => dto.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatEntity>> getChatById(String chatId) async {
    try {
      final chatDto = await _remoteDataSource.getChatById(chatId);
      return Right(chatDto.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
