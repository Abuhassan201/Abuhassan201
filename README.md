# IQ Study AI — منصة الدراسة العراقية الذكية

هذا المستودع يحتوي على ملفات الإعداد والوثائق الأولية لمشروع "IQ Study AI" (منصة الدراسة العراقية الذكية).

الروابط المهمة
- PRD (وثيقة المتطلبات): docs/PRD.md

الهيكل المقترح للمشروع
- mobile_app/ — تطبيق Flutter
- backend/ — خادم API (Node.js + TypeScript)
- admin_panel/ — لوحة إدارة (React/Next.js)
- infra/ — ملفات البنية التحتية (docker-compose, manifests)
- docs/ — مستندات المشروع (PRD, API spec, DB schema)

تشغيل محلي (مبدئي)
1. تأكد من تثبيت Docker و docker-compose.
2. انسخ متغيرات البيئة في backend/.env
3. شغل الخدمات:

```bash
cd project/infra
docker-compose up -d
```

4. اتبع خطوات التشغيل لكل مشروع فرعي داخل مجلده (mobile_app/README.md و backend/README.md).

ماذا أفعل بعد ذلك
- إنشاء scaffold لتطبيق Flutter
- إنشاء scaffold للـ backend (Express + TypeScript)
- فتح issues و milestones لتنظيم العمل حسب خطة الـ MVP

إذا رغبت أبدأ فورًا بإنشاء scaffold للكود (mobile + backend + admin) وأفتح issues وmilestones في المستودع. اكتب "ابدأ scaffold" أو "ابدأ بالـ issues" للموافقة.