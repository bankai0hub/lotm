# Sefirah Castle LotM Wiki

A premium, interactive web application exploring the mysteries of the 5th Epoch.

## ⚡ Quick Start
To start both the backend and frontend with a single command:
```bash
npm run dev
```

## 🚀 Important Commands

### 1. Database Setup
Ensure MySQL is running and the `lord_of_the_mysteries` database is created.

- **Import Core Data**:
  ```bash
  mysql -u root -p lord_of_the_mysteries < lord_of_the_mysteries.sql
  ```
- **Apply Lore Migration (Detailed sequences & members)**:
  ```bash
  mysql -u root -p lord_of_the_mysteries < lore_migration.sql
  ```

### 2. Backend (Java API)
The backend is located in the `backend` directory.

- **Compile**:
  ```bash
  cd backend
  javac -cp ".;lib/*" src/com/lotm/*.java -d bin
  ```
- **Run**:
  ```bash
  cd backend
  java -cp "bin;lib/*" com.lotm.AppServer
  ```
- **Test Connection**:
  ```bash
  cd backend
  java -cp "bin;lib/*" com.lotm.DatabaseManager
  ```

### 3. Frontend (React)
The frontend is located in the `frontend` directory.

- **Install Dependencies**:
  ```bash
  cd frontend
  npm install
  ```
- **Start Development Server**:
  ```bash
  cd frontend
  npm run dev
  ```

---

## 🏛️ Sefirah Castle Aesthetics
- **Background**: Drift animated grey fog overlay.
- **Glassmorphism**: Translucent cards with gold glowing borders.
- **Typography**: Cinzel (Serif) for mystical headers, Inter for readable data.
- **Admin Section**: Password-protected (`SefirahPassword123`) for MySQL data insertion.

## 🛠️ Tech Stack
- **Frontend**: Vite + React + Framer Motion + TailwindCSS/Vanilla CSS.
- **Backend**: Java (HttpServer) + JDBC.
- **Database**: MySQL.
