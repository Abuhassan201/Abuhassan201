import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import authRouter from './routes/auth';

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.get('/api/health', (_req, res) => {
  res.json({ status: 'ok', env: process.env.NODE_ENV || 'development' });
});

app.use('/api/auth', authRouter);

app.get('/api/subjects', (_req, res) => {
  // placeholder response
  res.json([
    { id: 1, title: 'رياضيات', grade: 'الثالث متوسط' },
    { id: 2, title: 'فيزياء', grade: 'الرابع علمي' }
  ]);
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
