import 'package:dw_barbershop_app/src/core/restClient/rest_cliente.dart';
import 'package:dw_barbershop_app/src/repositiories/user/user_repository.dart';
import 'package:dw_barbershop_app/src/repositiories/user/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));
