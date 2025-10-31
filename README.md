<div align="center">

# 💡 TransXacto Keyboard Control

**Enterprise-grade keyboard backlight automation for macOS**

[![macOS](https://img.shields.io/badge/macOS-13.0+-orange?style=for-the-badge&logo=apple)](https://www.apple.com/macos/)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Hammerspoon](https://img.shields.io/badge/Powered%20by-Hammerspoon-red?style=for-the-badge)](https://www.hammerspoon.org/)

![Demo](https://img.shields.io/badge/Status-Production%20Ready-success?style=for-the-badge)

---

### 🚀 One-Click Keyboard Brightness Control from Your Menu Bar

*No more digging through System Settings. Control your MacBook's keyboard backlight instantly.*

[📥 Download Latest Release](../../releases/latest) • [📖 Documentation](#-documentation) • [🐛 Report Bug](../../issues) • [✨ Request Feature](../../issues)

</div>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 💡 **Instant Control**
One-click brightness adjustment from your menu bar. No navigation required.

### 🎯 **Multiple Presets**
Quick access to Off, 50%, and 100% brightness levels with more customization available.

### ⚡ **Lightning Fast**
Sub-second response times for immediate brightness adjustments.

</td>
<td width="50%">

### 🔒 **Privacy First**
All processing happens locally. No network connections, no data collection.

### 🎨 **Native Integration**
Seamless macOS menu bar experience with system-native controls.

### 🪶 **Lightweight**
Minimal system resource usage. Runs silently in the background.

</td>
</tr>
</table>

---

## 🚀 Quick Start

### One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/transxacto-keyboard-control/main/install.sh | bash
```

### Manual Installation

```bash
# Download the latest release
curl -L https://github.com/YOUR_USERNAME/transxacto-keyboard-control/releases/latest/download/transxacto-keyboard-control.tar.gz -o transxacto-keyboard-control.tar.gz

# Extract
tar -xzf transxacto-keyboard-control.tar.gz

# Install
cd transxacto-keyboard-control
chmod +x install.sh
./install.sh
```

---

## 📖 Documentation

### Requirements

- macOS 13.0 (Ventura) or later
- MacBook with backlit keyboard
- Administrator access

### Usage

Once installed, look for the 💡 icon in your menu bar:

1. **Click the icon** to open the brightness menu
2. **Select a preset:**
   - 🌙 **Off** - Turn backlight completely off
   - 💡 **50%** - Medium brightness
   - ☀️ **100%** - Maximum brightness

### Accessibility Permissions

Grant Hammerspoon accessibility permissions:

1. **System Settings** → **Privacy & Security** → **Accessibility**
2. Enable **Hammerspoon**
3. **Reload Config** in Hammerspoon menu

---

## 🎨 Customization

### Custom Brightness Levels

Edit `~/.hammerspoon/init.lua`:

```lua
menubar:setMenu({
    { title = "🌙 Keyboard 25%", fn = function() setKeyboardBright(0.25) end },
    { title = "💡 Keyboard 50%", fn = function() setKeyboardBright(0.5) end },
    { title = "🔆 Keyboard 75%", fn = function() setKeyboardBright(0.75) end },
    { title = "☀️ Keyboard 100%", fn = function() setKeyboardBright(1.0) end },
})
```

### Keyboard Shortcuts

Add hotkeys for instant control:

```lua
-- Toggle brightness with Ctrl+Cmd+K
hs.hotkey.bind({"ctrl", "cmd"}, "K", function()
    setKeyboardBright(0.5)
end)

-- Quick off with Ctrl+Cmd+0
hs.hotkey.bind({"ctrl", "cmd"}, "0", function()
    setKeyboardBright(0)
end)
```

---

## 🔧 How It Works

TransXacto Keyboard Control uses macOS's accessibility framework to programmatically control keyboard brightness:

```
┌─────────────────┐
│  Menu Bar Icon  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Hammerspoon    │
│   Automation    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Accessibility  │
│   Framework     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│System Settings  │
│Keyboard Controls│
└─────────────────┘
```

All operations happen locally with no network connectivity required.

---

## 🐛 Troubleshooting

<details>
<summary><b>Brightness doesn't change when I click the menu</b></summary>

**Solution:** Ensure Hammerspoon has accessibility permissions:
- System Settings → Privacy & Security → Accessibility → Enable Hammerspoon
- Restart Hammerspoon after granting permissions

</details>

<details>
<summary><b>Hammerspoon won't launch</b></summary>

**Solution:** Reinstall Hammerspoon:
```bash
brew reinstall --cask hammerspoon
```

</details>

<details>
<summary><b>Install script fails with "command not found"</b></summary>

**Solution:** Add Homebrew to your PATH (Apple Silicon Macs):
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

</details>

---

## 🗑️ Uninstallation

```bash
# Remove configuration
rm ~/.hammerspoon/init.lua

# (Optional) Uninstall Hammerspoon
brew uninstall --cask hammerspoon
```

---

## 🏢 About TransXacto Networks

TransXacto Networks builds enterprise-grade automation and security solutions that combine powerful functionality with intuitive design.

### Our Products

- **[XactoSign](https://xs.transxacto.net)** - Enterprise digital signature platform with REST API
- **TransXacto Auth** - Zero-trust authentication and access management  
- **Keyboard Control** - macOS keyboard brightness automation

Visit **[transxacto.net](https://transxacto.net)** to explore our full suite of enterprise tools.

---

## 🔒 Security & Privacy

- ✅ Runs entirely on your local machine
- ✅ Makes no network connections
- ✅ Stores no user data
- ✅ Requires no registration or API keys
- ✅ Open source and fully auditable

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📞 Support

- **Documentation:** [Full docs](README.md)
- **Issues:** [GitHub Issues](../../issues)
- **Email:** support@transxacto.net
- **Website:** [transxacto.net](https://transxacto.net)

---

## 🙏 Acknowledgments

Built with [Hammerspoon](https://www.hammerspoon.org/) - Staggeringly powerful macOS automation

---

<div align="center">

**⭐ Star this repo if you find it useful! ⭐**

Made with ❤️ by [TransXacto Networks](https://transxacto.net)

</div>
