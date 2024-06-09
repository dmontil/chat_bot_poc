/// Generated file. Do not edit.
///
/// Original: lib/shared/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 14
///
/// Built on 2024-06-09 at 13:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.es;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.es) // set locale
/// - Locale locale = AppLocale.es.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.es) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	es(languageCode: 'es', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsCommonEs common = _TranslationsCommonEs._(_root);
	late final _TranslationsPresentationEs presentation = _TranslationsPresentationEs._(_root);
}

// Path: common
class _TranslationsCommonEs {
	_TranslationsCommonEs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appName => 'chat_bot_poc';
	late final _TranslationsCommonFailuresEs failures = _TranslationsCommonFailuresEs._(_root);
}

// Path: presentation
class _TranslationsPresentationEs {
	_TranslationsPresentationEs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsPresentationOnboardingEs onboarding = _TranslationsPresentationOnboardingEs._(_root);
	late final _TranslationsPresentationChatEs chat = _TranslationsPresentationChatEs._(_root);
	late final _TranslationsPresentationHomeEs home = _TranslationsPresentationHomeEs._(_root);
}

// Path: common.failures
class _TranslationsCommonFailuresEs {
	_TranslationsCommonFailuresEs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get unknown => 'Se ha producido un error inesperado.';
	String get loading => 'No se ha podido cargar el contenido.';
	String get connection => 'Se ha producido un error de conexión.';
	String get request => 'Error en la solicitud.';
}

// Path: presentation.onboarding
class _TranslationsPresentationOnboardingEs {
	_TranslationsPresentationOnboardingEs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get rankingHelp => 'Estoy aquí para ayudarte a buscar información';
	String get assistant => 'Asistente IA';
	String get start => 'Empezar';
}

// Path: presentation.chat
class _TranslationsPresentationChatEs {
	_TranslationsPresentationChatEs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Aquí tienes tu top 5';
	String get writeRanking => 'Introduce un tema';
	String get errorLink => 'No se ha podido abrir el enlace';
}

// Path: presentation.home
class _TranslationsPresentationHomeEs {
	_TranslationsPresentationHomeEs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '¿Qué ranking quieres consultar hoy?';
	String get talkToOpenIa => 'Hablar con OpenAI';
	String get talkToGemini => 'Hablar con Gemini';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.appName': return 'chat_bot_poc';
			case 'common.failures.unknown': return 'Se ha producido un error inesperado.';
			case 'common.failures.loading': return 'No se ha podido cargar el contenido.';
			case 'common.failures.connection': return 'Se ha producido un error de conexión.';
			case 'common.failures.request': return 'Error en la solicitud.';
			case 'presentation.onboarding.rankingHelp': return 'Estoy aquí para ayudarte a buscar información';
			case 'presentation.onboarding.assistant': return 'Asistente IA';
			case 'presentation.onboarding.start': return 'Empezar';
			case 'presentation.chat.title': return 'Aquí tienes tu top 5';
			case 'presentation.chat.writeRanking': return 'Introduce un tema';
			case 'presentation.chat.errorLink': return 'No se ha podido abrir el enlace';
			case 'presentation.home.title': return '¿Qué ranking quieres consultar hoy?';
			case 'presentation.home.talkToOpenIa': return 'Hablar con OpenAI';
			case 'presentation.home.talkToGemini': return 'Hablar con Gemini';
			default: return null;
		}
	}
}
