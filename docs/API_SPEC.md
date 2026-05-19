# API SPEC — مسودة سريعة

ملاحظة: هذه مسودة أولية لواجهات الـ API تُستخدم لتطوير الـ backend وواجهات الـ frontend.

Auth
- POST /api/auth/register
  - body: { name, email, password, grade }
  - response: { user, token }

- POST /api/auth/login
  - body: { email, password }
  - response: { user, token }

- POST /api/auth/logout

- POST /api/auth/forgot-password
  - body: { email }

- POST /api/auth/verify-otp
  - body: { email, otp }

Subjects & Lessons
- GET /api/subjects
- GET /api/subjects/:id
- GET /api/subjects/:id/lessons
- GET /api/lessons/:id

Exams
- GET /api/exams?subject=
- POST /api/exams/:id/start
- POST /api/exams/:id/submit
- GET /api/exams/:id/result

AI
- POST /api/ai/chat
  - body: { user_id, prompt, context }

- POST /api/ai/solve-image
  - multipart: image

- POST /api/ai/generate-exam
  - body: { subject, grade, difficulty, count }

- POST /api/ai/analyze-student
  - body: { user_id }

Admin
- POST /api/admin/videos (multipart)
- POST /api/admin/lessons
- POST /api/admin/notifications
- GET /api/admin/stats

Errors & Auth
- تستخدم معظم المسارات مصادقة JWT (Authorization: Bearer <token>)
- ترجع الأخطاء بصيغة JSON قياسية: { error: message, code }
