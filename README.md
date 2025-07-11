# sua-app-node-ts

A simple Node.js + TypeScript + Express application.

## Features
- Express server (TypeScript)
- Docker & Docker Compose support
- Jest for testing

---

## Prerequisites
- [Node.js](https://nodejs.org/) (v18 or v20 recommended)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [Docker](https://www.docker.com/) & [Docker Compose](https://docs.docker.com/compose/) (optional, for containerized setup)

---

## Getting Started

### 1. Clone the repository
```bash
git clone <repo-url>
cd deploy-vps
```

### 2. Install dependencies
```bash
npm install
```

### 3. Build the project
```bash
npm run build
```

### 4. Start the server
```bash
npm start
```

The server will run at [http://localhost:3000](http://localhost:3000)

---

## Development

For development with hot-reloading:
```bash
npm run dev
```

---

## Testing

Run tests with:
```bash
npm test
```

---

## Docker Usage

### Build and run with Docker
```bash
docker build -t sua-app-node-ts .
docker run -p 3000:3000 sua-app-node-ts
```

### Or use Docker Compose
```bash
docker-compose up --build
```

---

## Project Structure
```
├── src/            # Source code (TypeScript)
│   └── server.ts   # Main server entry point
├── dist/           # Compiled JavaScript output
├── package.json    # Project metadata and scripts
├── Dockerfile      # Docker build instructions
├── docker-compose.yml # Docker Compose setup
├── tsconfig.json   # TypeScript configuration
```

---

## Environment Variables
- By default, the server runs on port 3000.
- You can add environment variables in `docker-compose.yml` as needed (e.g., `DATABASE_URL`).

---

## Notes
- `node_modules` and `dist` are excluded from git and Docker builds.
- No environment variables are required for basic usage.
- For production, use Docker or build and run with `npm start`.

---

## License
MIT 