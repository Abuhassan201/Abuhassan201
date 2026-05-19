# backend

دليل تشغيل وتهيئة للخادم (Node.js + TypeScript)

المتطلبات
- Node.js >= 18
- pnpm أو npm
- Docker (لقاعدة البيانات والاعتماديات)

تشغيل محلي (مبدئي)
1. انسخ المتغيّرات البيئية:
   - أنشئ ملف `.env` في مجلد `backend/` واملأ المتغيّرات (DATABASE_URL, JWT_SECRET, OPENAI_KEY، إلخ).
2. ثبّت الحزم:
   ```bash
   cd backend
   pnpm install
   ```
3. شغّل الخادم في وضع التطوير:
   ```bash
   pnpm dev
   ```

هيكل مقترح
- src/
  - api/
  - auth/
  - database/
  - ai-engine/
  - uploads/
  - analytics/
  - exams/
  - notifications/
  - workers/
- prisma/
- scripts/

ملاحظات
- استخدم Prisma ORM مع PostgreSQL.
- خزن مفاتيح OpenAI وبيانات الدفع في Secret Manager أو متغيرات بيئية مشفّرة.
- استخدم BullMQ + Redis للمعالجات الخلفية (video processing, AI jobs).
