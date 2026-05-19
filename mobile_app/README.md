# mobile_app

دليل تشغيل وتهيئة الجزء الخاص بتطبيق Flutter (mobile_app)

المتطلبات
- Flutter SDK (>= 3.0)
- Dart
- Android SDK / Xcode (لـ iOS)

تشغيل محلي (مبدئي)
1. افتح مجلد `mobile_app`:
   ```bash
   cd mobile_app
   ```
2. ثبّت الحزم:
   ```bash
   flutter pub get
   ```
3. شغّل التطبيق على المحاكي أو جهاز متصل:
   ```bash
   flutter run
   ```

هيكل مقترح
- lib/
  - screens/
  - widgets/
  - services/
  - providers/
  - models/
  - ai/
  - auth/
  - exams/
  - pdf/
  - videos/
  - utils/
- assets/

ملاحظات
- استخدم `riverpod` لإدارة الحالة، `dio` للاتصال بالـ API، `go_router` للتنقّل.
- خزّن مفاتيح API في backend فقط ولا تضعها داخل الكود المصدري.
