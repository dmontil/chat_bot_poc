// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_bot_poc/features/chat/data/datasources/gemini_chat_datasource.dart'
    as _i9;
import 'package:chat_bot_poc/features/chat/data/datasources/open_ia_chat_datasource.dart'
    as _i8;
import 'package:chat_bot_poc/features/chat/data/repositories/chat_repository.dart'
    as _i11;
import 'package:chat_bot_poc/features/chat/domain/repositories/chat_repository.dart'
    as _i10;
import 'package:chat_bot_poc/features/chat/presentation/cubits/chat_cubit.dart'
    as _i15;
import 'package:chat_bot_poc/features/onboarding/data/datasource/local_onboarding_datasource.dart'
    as _i7;
import 'package:chat_bot_poc/features/onboarding/data/repositories/onboarding_repository.dart'
    as _i13;
import 'package:chat_bot_poc/features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i12;
import 'package:chat_bot_poc/features/onboarding/presentation/cubits/onboarding_cubit.dart'
    as _i14;
import 'package:chat_bot_poc/inyectable_module.dart' as _i16;
import 'package:chat_bot_poc/shared/services/network_info.dart' as _i4;
import 'package:chat_bot_poc/shared/storage/local_storage_service.dart' as _i5;
import 'package:chat_bot_poc/shared/storage/shared_preferences_storage_service.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

const String _real = 'real';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i4.NetworkInfo>(() => _i4.NetworkInfo.create());
    gh.factory<_i5.LocalStorageService>(() =>
        _i6.SharedPreferencesService(preferences: gh<_i3.SharedPreferences>()));
    gh.singleton<_i7.LocalOnboardingDatasource>(
      () => _i7.LocalOnboardingDatasource(gh<_i5.LocalStorageService>()),
      registerFor: {
        _real,
        _dev,
      },
    );
    gh.singleton<_i8.OpenIaChatDatasource>(
      () => _i8.OpenIaChatDatasource(),
      registerFor: {
        _real,
        _dev,
      },
    );
    gh.singleton<_i9.GemminiChatDatasource>(
      () => _i9.GemminiChatDatasource(),
      registerFor: {
        _real,
        _dev,
      },
    );
    gh.factory<_i10.ChatRepository>(() => _i11.ChatRepositoryImpl(
          gh<_i8.OpenIaChatDatasource>(),
          gh<_i9.GemminiChatDatasource>(),
        ));
    gh.factory<_i12.OnboardingRepository>(() =>
        _i13.OnboardingRepositoryImpl(gh<_i7.LocalOnboardingDatasource>()));
    gh.factory<_i14.OnboardingCubit>(
        () => _i14.OnboardingCubit(gh<_i12.OnboardingRepository>()));
    gh.factoryParam<_i15.ChatCubit, int, dynamic>((
      _chatProvider,
      _,
    ) =>
        _i15.ChatCubit(
          _chatProvider,
          gh<_i10.ChatRepository>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i16.InjectableModule {}
