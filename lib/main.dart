import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saweha/features/home/presentation/home_page.dart';
import 'package:saweha/l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';

void main() async {
  // 1. التأكد من تهيئة بيئة فلاتر الأساسية
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 2. تجميد شاشة البداية (إبقائها ظاهرة)
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 3. تهيئة خدمات التطبيق الأساسية (مثل Firebase)
  // await Firebase.initializeApp();

  // (هنا يمكنك أيضاً جلب بيانات المستخدم المحفوظة محلياً لمعرفة هل هو مسجل دخول أم لا)

  // 4. إزالة شاشة البداية بعد انتهاء التهيئة
  FlutterNativeSplash.remove();

  // 5. تشغيل التطبيق (مع تغليفه بـ ProviderScope الخاص بـ Riverpod)
  runApp(const ProviderScope(child: SawehaApp()));
}

class SawehaApp extends StatelessWidget {
  const SawehaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,

      // -- إعدادات الثيم (تم استدعاؤها من الملف المنفصل) --
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // سيتغير تلقائياً حسب إعدادات هاتف المستخدم

      // -- إعدادات اللغة وتغيير الاتجاه تلقائياً (RTL / LTR) --
      // قم بتغيير 'ar' إلى 'en' لرؤية كيف ينعكس التطبيق بالكامل لليسار
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // العربية
        Locale('en', ''), // الإنجليزية
      ],
      locale: const Locale('ar', ''),

      home: const HomeScreen(),
    );
  }
}