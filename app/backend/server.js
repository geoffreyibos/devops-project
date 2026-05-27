const express = require("express");
const { Pool } = require("pg");

const app = express();
app.use(express.json());

const pool = new Pool({
  host: process.env.DB_HOST,
  port: 5432,
  database: process.env.DB_NAME || "appdb",
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD
});

app.get("/api/votes", async (req, res) => {
  const result = await pool.query("SELECT COUNT(*)::int AS count FROM votes");
  res.json({ votes: result.rows[0].count });
});

app.post("/api/vote", async (req, res) => {
  await pool.query("INSERT INTO votes DEFAULT VALUES");
  const result = await pool.query("SELECT COUNT(*)::int AS count FROM votes");
  res.json({ votes: result.rows[0].count });
});

app.get("/health", (req, res) => res.send("ok"));

app.listen(3000, () => console.log("Backend running on port 3000"));

