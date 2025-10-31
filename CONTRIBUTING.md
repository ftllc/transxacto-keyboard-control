# Contributing to TransXacto Keyboard Control

First off, thank you for considering contributing to TransXacto Keyboard Control! 🎉

## 🤝 Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for everyone.

## 🚀 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When creating a bug report, include:

- **Clear title and description**
- **Steps to reproduce**
- **Expected vs actual behavior**
- **Screenshots** (if applicable)
- **System information** (macOS version, Mac model, Hammerspoon version)
- **Console output** from Hammerspoon

### Suggesting Features

Feature requests are welcome! Please provide:

- **Clear description** of the feature
- **Problem it solves**
- **Proposed solution**
- **Alternative approaches** considered

### Pull Requests

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Make your changes**
4. **Test thoroughly** on your local machine
5. **Commit with clear messages** (`git commit -m 'Add some AmazingFeature'`)
6. **Push to your branch** (`git push origin feature/AmazingFeature`)
7. **Open a Pull Request**

## 💻 Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/transxacto-keyboard-control.git

# Navigate to directory
cd transxacto-keyboard-control

# Install to test locally
./install.sh
```

## 📝 Coding Standards

- Use clear, descriptive variable names
- Comment complex logic
- Follow existing code style
- Test on multiple macOS versions if possible
- Keep functions focused and modular

## 🧪 Testing

Before submitting a PR:

1. Test on your local Mac
2. Verify all brightness levels work (0%, 50%, 100%)
3. Check accessibility permissions handling
4. Ensure no Hammerspoon console errors
5. Test the installer script on a clean system (if modified)

## 📖 Documentation

Update documentation for:

- New features
- Changed behavior
- New configuration options
- Installation changes

## 🎯 Project Structure

```
transxacto-keyboard-control/
├── hammerspoon/
│   └── init.lua          # Main Hammerspoon configuration
├── .github/
│   ├── ISSUE_TEMPLATE/   # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
├── install.sh            # Automated installer
├── README.md             # Main documentation
├── LICENSE               # MIT License
└── CONTRIBUTING.md       # This file
```

## ❓ Questions?

Feel free to open an issue for questions or reach out to support@transxacto.net

## 🙏 Thank You!

Your contributions make TransXacto Keyboard Control better for everyone. We appreciate your time and effort!

---

<div align="center">

Made with ❤️ by [TransXacto Networks](https://transxacto.net)

</div>
