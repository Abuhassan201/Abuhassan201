# PRD — منصة الدراسة العراقية الذكية (IQ Study AI)

ملخص المشروع

- اسم التطبيق: IQ Study AI أو منصة الدراسة العراقية الذكية
- الهدف: بناء منصة دراسية متكاملة مخصّصة لطلاب المراحل: الثالث متوسط، الرابع/الخامس/السادس العلمي، مع ذكاء اصطناعي قوي يشرح باللهجة العراقية، يحلل مستوى الطالب، ويولّد امتحانات ومخططات دراسة مخصصة.
- المنصات: Android و iOS (باستخدام Flutter). Web App مستقبلاً.

نطاق المنتج (Scope)

- المراحل المدعومة: الثالث متوسط، الرابع العلمي، الخامس العلمي، السادس العلمي.
- المواد: كما هو محدّد لكل صف في متطلباتك (رياضيات، فيزياء، كيمياء، أحياء، عربي، إنكليزي، إسلامية، اجتماعات، علوم، إلخ).
- الميزات الأساسية: دروس نصية وفيديو وملفات PDF، اختبارات متنوعة، مساعد AI نصي وصوري (OCR) وصوتي (TTS)، تتبّع تقدم الطالب، لوحات إدارة للمدرّسين/المشرفين، نظام اشتراكات ودفع.

المستخدمون المستهدفون

- الطالب (Primary user)
- المدرّس (يضيف محتوى ويتابع نتائج)
- المشرف/المدير (Admin)
- وليّ الأمر (عرض تقارير الطالب إن لزم)

القيمة المقترحة (Value Proposition)

- محتوى منسّق ومخصّص للمنهج العراقي فقط.
- شرح باللهجة العراقية عند الطلب لمزيد من الوضوح.
- حل مسائل عبر تصوير السؤال (OCR + تفسير).
- خطة دراسة ذكية مخصصة وتقارير أداء واضحة.

المتطلبات الوظيفية (Functional Requirements)

1) الصفحة الرئيسية
- عرض المواد، آخر الدروس، اقتراحات AI، الخطة اليومية، إشعارات، مستوى وتقدم الطالب.

2) نظام المواد
- فصول/دروس/ملفات/فيديو وخرائط ذهنية وأسئلة وزارية وواجبات.

3) نظام الاختبارات
- أنواع: يومية، أسبوعية، شهرية، وزارية، اختبار سرعة، اختبار مراجعة.
- مؤقّت، تصحيح تلقائي، تحليل الأخطاء، احتساب النسبة والترتيب.

4) الذكاء الاصطناعي
- AI Chat: شرح، تبسيط، توليد أسئلة، تحليل مستوى.
- AI Camera Solver: OCR → تحليل → حل خطوة بخطوة.
- AI Study Planner: خطة دراسة مخصصة.
- AI Exam Generator: بنوك أسئلة مع درجات صعوبة.
- AI Voice Teacher: TTS بالعربية واللهجة العراقية.

5) الفيديوهات والملازم
- مشغل فيديو مدعوم CDN، تحميل آمن، متعددة الجودة.
- PDF viewer داخلي + تحميل + بحث داخل الـ PDF.

6) إدارة المستخدمين والاشتراكات
- اشتراكات: مجاني/مدفوع مع حدود الوصول.
- طرق دفع: زين كاش، آسيا حوالة، Visa، MasterCard.

7) لوحة الإدارة ولوحة المدرس
- إدارة المحتوى، المستخدمين، الاشتراكات، رفع الفيديو، إرسال إشعارات، إحصاءات.

المتطلبات غير الوظيفية (Non-functional Requirements)

- أداء عالي، وقت استجابة منخفض.
- قابلية التوسع لتحمّل آلاف/ملايين المستخدمين مستقبلًا.
- حماية وخصوصية بيانات الطلاب (تشفير، سياسات خصوصية).
- نسخ احتياطي يومي واسترجاع سريع.
- قياسات وتحليلات دقيقة.

التقنيات المقترحة (Tech Stack)

- Mobile Frontend: Flutter (Dart)
  - Packages مقترحة: Riverpod, Dio, go_router, Hive, cached_network_image, flutter_secure_storage
- Backend: Node.js + Express.js (TypeScript)
  - ORM: Prisma
  - Auth: JWT + OTP flow
  - AI integrations: OpenAI SDK (أو مزود بديل)، TTS provider، OCR (Google Vision / Tesseract)
  - Realtime/notifications: Socket.io + FCM
  - File uploads: S3-compatible storage
- Database: PostgreSQL (أساسي). بديل/جزئي: Firebase لبعض الخدمات إن رغبت.
- Vector DB/Embeddings: Pinecone / Weaviate / Milvus
- Caching/Search: Redis + ElasticSearch / Meili / Typesense
- Infra: Docker, Nginx, PM2, Ubuntu VPS, إمكانية التوسع إلى Kubernetes
- Monitoring: Sentry, Prometheus + Grafana
- CI/CD: GitHub Actions

البنية العالية المستوى (High-level Architecture)

- Mobile App (Flutter) ↔ Backend API (REST + WebSocket) ↔ PostgreSQL + Redis
- AI Engine (خدمة منفصلة) ↔ OpenAI / Vector DB / OCR / TTS
- Storage (S3) + CDN للفيديوهات والـ assets
- Admin Panel (React/Next.js) ↔ نفس الـ API
- Workers (BullMQ/Redis) لمعالجة الفيديو وعمليات AI الطويلة

تصميم قاعدة البيانات (نماذج أساسية)

- users (id, name, email, password_hash, grade, subscription_id, profile_image, created_at, updated_at)
- subjects (id, title, grade, icon, description)
- lessons (id, subject_id, title, slug, content_html, video_key, pdf_key, duration, order, created_at)
- exams (id, subject_id, title, duration_minutes, type, created_by, created_at)
- questions (id, exam_id, type, question_text, options_json, correct_answer_json, marks)
- attempts (id, user_id, exam_id, score, started_at, finished_at, details_json)
- progress (id, user_id, subject_id, lesson_id, completion_percent, last_accessed_at)
- ai_chats (id, user_id, messages_json, created_at)
- subscriptions (id, name, price, features_json, duration_days)
- payments (id, user_id, subscription_id, provider, provider_txn_id, amount, status, created_at)

مخطط API (نماذج endpoints رئيسية)

- Auth
  - POST /api/auth/register
  - POST /api/auth/login
  - POST /api/auth/logout
  - POST /api/auth/forgot-password
  - POST /api/auth/verify-otp
- Subjects & Lessons
  - GET /api/subjects
  - GET /api/subjects/:id
  - GET /api/subjects/:id/lessons
  - GET /api/lessons/:id
- Exams
  - GET /api/exams?subject=
  - POST /api/exams/:id/start
  - POST /api/exams/:id/submit
  - GET /api/exams/:id/result
- AI
  - POST /api/ai/chat
  - POST /api/ai/solve-image
  - POST /api/ai/generate-exam
  - POST /api/ai/analyze-student
- Admin
  - POST /api/admin/videos
  - POST /api/admin/lessons
  - POST /api/admin/notifications
  - GET /api/admin/stats

تفاصيل التكامل مع AI

- محرك المحادثة: سياق لكل طالب (history + progress + curriculum embeddings).
- Camera Solver: OCR → تصنيف → حل خطوة بخطوة باستخدام LLM.
- Exam Generator: توليد بنوك أسئلة قابلة للتعديل.
- Voice Teacher: TTS بالعربية ودعم لهجة عراقية عبر prompt tuning أو تحويل الناتج.

الأمن والحماية (Security)

- Auth: JWT + Refresh Tokens + OTP.
- Passwords: bcrypt/argon2.
- Rate limiting لجميع endpoints الحساسة.
- حفظ API Keys في backend secrets / secret manager.
- ملفات الفيديو/PDF تُقدّم عبر signed URLs.
- كشف Root/Jailbreak وعدّ التحذيرات.
- تشفير بيانات حسّاسة، WAF، Cloudflare، TLS.

تحسين الأداء (Performance)

- CDN للفيديو والـ assets.
- HLS + multiple bitrate.
- Caching (Redis) للـ API responses.
- Lazy loading و pagination.
- ضغط الصور و thumbnail generation.

حماية المحتوى (DRM)

- HLS + signed tokens + DRM إذا تطلّب.
- Watermarking dynamic.
- مراقبة نشاط التنزيلات.

نسخ احتياطي واسترجاع (Backup & Recovery)

- Snapshots يومية لقاعدة البيانات.
- S3 replication و lifecycle.
- اختبار استرجاع شهري.

التحليلات (Analytics & KPIs)

- للطالب: ساعات دراسة، نسب إنجاز، المواد الضعيفة، أداء الاختبارات.
- للإدارة: عدد المستخدمين النشطين، الاشتراكات، churn rate، أعلى المواد.
- أدوات: Mixpanel / Firebase Analytics / Custom BI.

تصميم واجهات (Wireframes - موجز)

- Flow أساسي: Splash → Onboarding → Login/Register → Home → Subject → Lesson (text/video/pdf) → AI Chat / Camera Solver → Exam → Results.
- تصميم بسيط وواضح للأعمار الصغيرة، دعم RTL.

مخطط التنفيذ والـ Milestones (خطة مبدئية زمنية)

- MVP — 10–12 أسبوع
  - 2 أسبوع: تخطيط تفصيلي + DB design + wireframes
  - 4–6 أسابيع: Mobile core (auth, home, subjects, lessons, video/pdf)
  - 2 أسابيع: Backend core (auth, subjects API, file uploads)
  - 1–2 أسابيع: Staging deploy + basic QA
- المرحلة الثانية (AI) — 6–8 أسابيع إضافية
- المرحلة الثالثة (Admin + Monetization) — 4–6 أسابيع
- اختبار عام و إطلاق — 2–4 أسابيع

تقدير التكاليف (نطاق تقريبي)

- تطوير MVP: ~8k–30k USD
- تشغيل وبنية تحتية: مئات إلى آلاف USD شهريًا
- تراخيص ومكلّفات AI: تعتمد على استهلاك API

فريق العمل المطلوب

- 1–2 Flutter Developers
- 1 Backend Developer (Node.js/TypeScript)
- 1 AI Engineer
- 1 UI/UX Designer
- 1 DevOps Engineer
- 1 Database Engineer (اختياري)
- QA Engineer
- Content Manager / Curriculum Specialist

معايير الجودة والالتزامات على المطورين

- Clean Code
- Tests (unit/integration)
- توثيق API
- فصل concerns
- حماية مفاتيح API

هيكل المشروع المقترح

project/
├── mobile_app/
├── backend/
├── admin_panel/
└── docs/

قائمة ملفات أولية يمكن إنشاؤها الآن

- README.md
- docs/PRD.md (هذا الملف)
- docs/API_SPEC.md (مسودة لاحقة)
- docs/DB_SCHEMA.md
- infra/docker-compose.yml
- mobile_app/README.md
- backend/README.md

قائمة مهام أولية (Backlog)

- Epic: Auth & Onboarding
- Epic: Content Delivery
- Epic: AI Basics
- Epic: Exams
- Epic: Admin
- Epic: Payments
- Epic: Security & Hardening

مخاطر وملاحظات

- حقوق نشر المحتوى المدرسي
- تكلفة تشغيل AI
- توفير حماية فعالة للفيديوهات

المرفقات المطلوبة من العميل للبدء

1. عيّنة PDF لكتاب واحد لكل مادة/صف لبدء عملية تحويل المحتوى.
2. تأكيد استخدام المستودع Abuhassan201/Abuhassan201 لرفع الملفات الأولية.
3. تأكيد مزود AI مبدئي (OpenAI أو آخر).
4. ميزانية مبدئية أو توقيت نهائي.

الخطوات التالية (ماذا سأفعل الآن)

- إن رغبت، أستطيع مباشرةً: إنشاء الملفات الأساسية الأخرى (README، docs/API_SPEC.md، infra/docker-compose.yml) وإنشاء scaffold أولي لتطبيق Flutter.
- أستطيع فتح issues و milestones في المستودع لتنظيم العمل.

---

*وثيقة PRD مُنشأة بواسطة المساعد — راجعها وأخبرني بأي تعديل أو إضافة تودُّها.*
