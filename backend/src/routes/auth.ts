import express from 'express';
import bcrypt from 'bcrypt';

const router = express.Router();

// NOTE: This is a placeholder implementation. Replace with DB integration (Prisma) and proper validation.

router.post('/register', async (req, res) => {
  const { name, email, password, grade } = req.body;
  if (!email || !password) return res.status(400).json({ error: 'email and password required' });
  const hashed = await bcrypt.hash(password, 10);
  // TODO: save user to DB
  return res.json({ message: 'registered (placeholder)', user: { name, email, grade } });
});

router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) return res.status(400).json({ error: 'email and password required' });
  // TODO: fetch user and compare password
  // placeholder: always succeed
  return res.json({ message: 'logged in (placeholder)', token: 'fake-jwt-token' });
});

export default router;
