# DB SCHEMA — مسودة

مخطّط الكيانات الرئيسية (Entities)

users
- id (UUID, PK)
- name
- email (unique)
- password_hash
- grade
- subscription_id
- profile_image_key
- created_at
- updated_at

subjects
- id (PK)
- title
- grade
- icon_key
- description

lessons
- id
- subject_id (FK)
- title
- slug
- content_html
- video_key
- pdf_key
- duration
- order
- created_at

exams
- id
- subject_id
- title
- duration_minutes
- type
- created_by
- created_at

questions
- id
- exam_id
- type (mcq, short, essay)
- question_text
- options_json
- correct_answer_json
- marks

attempts
- id
- user_id
- exam_id
- score
- started_at
- finished_at
- details_json

progress
- id
- user_id
- subject_id
- lesson_id
- completion_percent
- last_accessed_at

ai_chats
- id
- user_id
- messages_json
- created_at

subscriptions
- id
- name
- price
- features_json
- duration_days

payments
- id
- user_id
- subscription_id
- provider
- provider_txn_id
- amount
- status
- created_at

مثال SQL مبدئي لإنشاء جدول users (Postgres + Prisma style)

CREATE TABLE users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text UNIQUE NOT NULL,
  password_hash text NOT NULL,
  grade text,
  subscription_id uuid,
  profile_image_key text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);
