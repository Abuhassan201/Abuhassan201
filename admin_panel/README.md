# admin_panel

لوحة الإدارة (مقترح React/Next.js)

المتطلبات
- Node.js >= 18
- pnpm أو npm

تشغيل محلي (مبدئي)
1. انتقل للمجلد:
   ```bash
   cd admin_panel
   ```
2. ثبّت الحزم:
   ```bash
   pnpm install
   ```
3. شغّل التطبيق في وضع التطوير:
   ```bash
   pnpm dev
   ```

هيكل مقترح
- src/
  - pages/
  - components/
  - services/
  - hooks/
  - styles/

ملاحظات
- احرص على حماية لوحة الإدارة بمستوى وصول خاص (Admin roles + Audit logs).
