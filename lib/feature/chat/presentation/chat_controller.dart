import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:chat_app/core/constants/app_config.dart';
import 'package:chat_app/feature/chat/domain/repositories/chat_repository.dart';
import 'package:chat_app/feature/chat/domain/datasources/chat_remote_datasource.dart';
import 'package:chat_app/feature/chat/domain/datasources/chat_remote_datasource_mock.dart';
import 'package:chat_app/feature/chat/domain/repositories/chat_repository_impl.dart';
import 'package:chat_app/feature/chat/domain/entities/chat_entity.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final dataSource = AppConfig.useMockChat
      ? ChatRemoteDataSourceMock()
      : GetIt.I<ChatRemoteDataSource>();
  return ChatRepositoryImpl(dataSource);
});

class ChatState {
  static const _unset = Object();

  final bool isLoading;
  final String? error;
  final List<ChatEntity> chats;
  final String query;

  const ChatState({
    this.isLoading = false,
    this.error,
    this.chats = const [],
    this.query = '',
  });

  List<ChatEntity> get filteredChats {
    if (query.isEmpty) {
      return chats;
    }
    final loweredQuery = query.toLowerCase();
    return chats
        .where((chat) => chat.name.toLowerCase().contains(loweredQuery))
        .toList();
  }

  ChatState copyWith({
    bool? isLoading,
    Object? error = _unset,
    List<ChatEntity>? chats,
    String? query,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      error: error == _unset ? this.error : error as String?,
      chats: chats ?? this.chats,
      query: query ?? this.query,
    );
  }
}

class ChatController extends StateNotifier<ChatState> {
  ChatController(this._repository) : super(const ChatState()) {
    _loadChats();
  }

  final ChatRepository _repository;

  Future<void> _loadChats() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _repository.getChats();
    state = result.fold(
      (failure) => state.copyWith(isLoading: false, error: failure.message),
      (chats) => state.copyWith(isLoading: false, error: null, chats: chats),
    );
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
  }

  void clearQuery() {
    state = state.copyWith(query: '');
  }
}

final chatControllerProvider = StateNotifierProvider<ChatController, ChatState>(
  (ref) => ChatController(ref.read(chatRepositoryProvider)),
);
