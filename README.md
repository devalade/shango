# 🚀 Shango

Shango is a CLI tool that simplifies the deployment configuration process for modern web applications. It automatically generates deployment configurations for popular frameworks using [Kamal](https://kamal-deploy.org).

## 🌟 Features

- 📦 Supports multiple frameworks:
  - NextJS
  - Remix
  - Tanstack Start Framework
  - Svelte
  - AdonisJS
  - NestJS
  - Astro
  - Laravel
  - Django

- 🛠 Database support:
  - MySQL
  - PostgreSQL
  - SQLite
  - No Database option

- 🚀 Caching solutions:
  - Redis
  - Memcached
  - KeyDB
  - No Cache option

- 📝 Package manager flexibility:
  - npm
  - yarn
  - pnpm

## 🚀 Quick Start

### Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/devalade/shango/main/install.sh)"
```

### Usage

Simply run:
```bash
shango
```

Follow the interactive prompts to configure your deployment.

## 🛠 Prerequisites

- Bash 4.0 or later
- [Kamal](https://kamal-deploy.org)
- Docker
- Git

## 🤝 Contributing

We love your input! We want to make contributing to Shango as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

### Development Process

1. Fork the repo
2. Clone your fork and create a new branch
```bash
git clone https://github.com/your-username/shango.git
cd shango
git checkout -b feature/amazing-feature
```

3. Make your changes
4. Test your changes
5. Push to your fork and submit a pull request

### Project Structure

```
~/.local/share/shango/
├── ascii.sh                # ASCII art and styling
├── stubs/                  # Template files for each framework
│   ├── nextjs/
│   │   ├── base/
│   │   │   ├── deploy.yml.stub
│   │   │   └── Dockerfile.stub
│   │   ├── databases/
│   │   │   ├── mysql.yml.stub
│   │   │   ├── postgres.yml.stub
│   │   │   └── sqlite.yml.stub
│   │   └── cache/
│   │       ├── redis.yml.stub
│   │       └── memcached.yml.stub
│   └── [other-frameworks]/
└── utils/                  # Utility functions
    ├── global-variables.sh
    └── replace-variables.sh
```

### Adding Support for a New Framework

1. Create a new directory in `stubs/` for your framework
2. Add the necessary template files:
   - `base/deploy.yml.stub`
   - `base/Dockerfile.stub`
   - Database configurations in `databases/`
   - Cache configurations in `cache/`
3. Update `global-variables.sh` to include the new framework
4. Test the configuration generation
5. Submit a pull request

### Guidelines

- Write clear, descriptive commit messages
- Add tests for new features
- Update documentation when needed
- Follow the existing code style
- One feature per pull request

## 🔍 Testing

To run tests:
```bash
./local-test.sh
```

## 📝 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Kamal](https://kamal-deploy.org) for the amazing deployment tool
- All our contributors who help make Shango better

## 💬 Questions?

Feel free to [open an issue](https://github.com/devalade/shango/issues/new) or reach out to the maintainers.

---

⭐ Star this repo if you find it helpful!

Made with ❤️ by the [Kamal](https://github.com/devalade)
