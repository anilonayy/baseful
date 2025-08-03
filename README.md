# Baseful Admin Panel

Modern and secure admin panel - built with TypeScript, Next.js, PostgreSQL, Drizzle, and BetterAuth.

## 🚀 Technologies

- **Language**: TypeScript
- **Framework**: Next.js 15
- **Database**: PostgreSQL
- **ORM**: Drizzle
- **Authentication**: BetterAuth
- **UI Framework**: Shadcn/ui + Tailwind CSS
- **Icons**: Lucide React
- **Query Framework**: TanStack Query
- **Form Framework**: React Hook Form
- **Validation**: Zod
- **Logger**: Pino
- **Testing**: Jest

## 🐳 Docker

### Quick Start with Makefile

The easiest way to manage the project with Docker:

```bash
# Show all available commands
make help

# Start development environment
make start-dev

# Start production environment
make start-prod

# Stop all services
make down

# View logs
make logs
```

### Production Deployment

Build and run the application with PostgreSQL:

```bash
# Build and start all services
make up

# Run in background
docker-compose up -d --build

# Stop services
make down
```

### Development with Docker

For development with hot reloading:

```bash
# Start development environment
make dev

# Stop development environment
make dev-down

# View development logs
make dev-logs
```

### Manual Docker Commands

```bash
# Build production image
docker build -t baseful .

# Run production container
docker run -p 3000:3000 --env-file .env.local baseful

# Build development image
docker build -f Dockerfile.dev -t baseful:dev .

# Run development container
docker run -p 3000:3000 -v $(pwd):/app baseful:dev
```

### Makefile Commands

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make build` | Build production images |
| `make up` | Start production services |
| `make down` | Stop all services |
| `make restart` | Restart all services |
| `make logs` | Show logs from all services |
| `make clean` | Remove all containers, networks, and volumes |
| `make dev` | Start development environment |
| `make dev-down` | Stop development environment |
| `make dev-logs` | Show development logs |
| `make migrate` | Run database migrations |
| `make shell` | Access app container shell |
| `make db-shell` | Access database container shell |
| `make start-dev` | Quick start development environment |
| `make start-prod` | Quick start production environment |
| `make status` | Check service status |
| `make dev-status` | Check development service status |

### Environment Variables

Create a `.env.local` file for Docker:

```env
DATABASE_URL="postgresql://postgres:password@db:5432/baseful"
AUTH_SECRET="your-secret-key-here"
LOG_LEVEL="info"
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-nextauth-secret-here"
```

## 📦 Installation

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Set up environment variables:**
   ```bash
   cp .env.example .env.local
   ```
   
   Edit `.env.local`:
   ```env
   DATABASE_URL="postgresql://username:password@localhost:5432/baseful"
   AUTH_SECRET="your-secret-key-here"
   LOG_LEVEL="info"
   NEXTAUTH_URL="http://localhost:3000"
   NEXTAUTH_SECRET="your-nextauth-secret-here"
   ```

3. **Set up database:**
   ```bash
   npm run db:generate
   npm run db:migrate
   ```

4. **Start development server:**
   ```bash
   npm run dev
   ```

## 🛠️ Available Scripts

- `npm run dev` - Development server
- `npm run build` - Production build
- `npm run start` - Production server
- `npm run lint` - Linting
- `npm run db:generate` - Generate Drizzle migration
- `npm run db:migrate` - Run database migrations
- `npm run db:studio` - Start Drizzle Studio
- `npm run test` - Run tests
- `npm run test:watch` - Run tests in watch mode

## 📁 Project Structure

```
src/
├── app/                    # Next.js App Router
│   ├── admin/             # Admin dashboard
│   ├── login/             # Login page
│   └── layout.tsx         # Root layout
├── components/            # UI Components
│   └── ui/               # Shadcn/ui components
├── db/                   # Database
│   ├── schema.ts         # Drizzle schema
│   └── index.ts          # Database connection
├── lib/                  # Utilities
│   ├── auth.ts           # BetterAuth configuration
│   ├── logger.ts         # Pino logger
│   ├── providers.tsx     # TanStack Query provider
│   └── utils.ts          # Utility functions
```

## 🔐 Features

- **Modern Authentication**: Secure authentication with BetterAuth
- **Responsive Design**: Mobile-friendly design
- **Form Validation**: Type-safe form validation with Zod
- **Data Fetching**: Optimized data fetching with TanStack Query
- **Type Safety**: Full TypeScript support
- **Testing**: Jest testing infrastructure
- **Logging**: Configurable logging with Pino

## 🎨 UI Components

Modern UI components built with Shadcn/ui:

- Button
- Input
- Label
- Toast
- (More components can be added)

## 🧪 Testing

```bash
# Run all tests
npm run test

# Run tests in watch mode
npm run test:watch
```

## 📊 Database

PostgreSQL database managed with Drizzle ORM:

```bash
# Generate migration
npm run db:generate

# Run migrations
npm run db:migrate

# Start Drizzle Studio
npm run db:studio
```

## 🔧 Development

1. Write tests before adding new features
2. Maintain TypeScript type safety
3. Fix linter errors
4. Write descriptive commit messages

## 📝 License

MIT
