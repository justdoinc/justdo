# JustDo

[JustDo](https://justdo.com) is an all-purpose, enterprise-grade project management platform designed for maximum flexibility and customization.

This repository contains the community edition, source-available version of JustDo, which allows for deep customization and integration possibilities.

![JustDo](https://justdo-media-files.s3.us-west-2.amazonaws.com/github-media/Github_min.png)

## 🌟 **Why Choose JustDo?**

- **🎯 Perfect for Distributors**: We feature a simple *Flat Monthly Fee* pricing model with No Revenue Sharing! Unlock multiple revenue streams by offering licenses and various services to your customers, including: hosting, customization, training, business consulting, and more.
- **🚀 Enterprise-Grade Performance**: Handle massive projects with over **200,000 tasks** and thousands of users without breaking a sweat.
- **🧩 Fully Customizable**: Modify and extend JustDo to fit any client's unique requirements.
- **🤖 AI-Powered Features**: Leverage cutting-edge AI to automate tasks, generate project structures from prompts, and enhance productivity.
- **🔒 Top-Notch Security**: We offer on-premises and intranet deployment options for clients with strict security needs. The source code is available and fully auditable by you. We provide end-to-end encryption and SSO integration.
- **🌐 Global Reach**: Support for **60+ languages**, including full **Right-to-Left (RTL)** support for languages such as Arabic and Hebrew - the best of its kind in the Project Management world.
- **🎨 White-Label Ready**: Customize the platform with your own branding to offer a seamless experience for your clients. Load any Bootstrap theme or create your own.
- **🔌 Extensive Plugin Ecosystem**: Choose from **150+ plugins** or create your own to extend functionality.

[Check our full features list](https://justdo.com/pricing)

## 🚀 **Getting Started**

### Step 1: Install Prerequisites

#### Install Meteor

JustDo is built on [Meteor.js](https://www.meteor.com/), a powerful full-stack JavaScript framework for building real-time applications.

Install Meteor.js by running the following command in your terminal:
```bash
curl https://install.meteor.com/\?release\=2.16 | sh
```

#### macOS Additional Steps

We have minimized external dependencies as much as possible. However, on macOS, you'll need to ensure that **Python 2.7** is installed, as it is required for the compilation processes of some of our packages. Additionally, you'll need to install the **Xcode Command Line Tools**.

1. **Install Python 2.7 using Homebrew & pyenv:**

Note: The following steps are optional and only required if you don't have Python 2.7 installed on your system. Further they are one of many ways to install Python 2.7 on macOS.

```bash
brew install pyenv
pyenv init # Follow the steps presented in the output
```

*Close your shell and start a new one* to ensure that pyenv is initialized.

```bash
pyenv install 2.7
```

2. **Install Xcode Command Line Tools:**

Run the following command to install the Xcode Command Line Tools:

```bash
xcode-select --install
```

#### Linux Additional Steps

JustDo is fully supported on Linux. No further steps are required.

#### Windows Users

As of now, JustDo is not officially supported on Windows. However, you can run JustDo on Windows using the Windows Subsystem for Linux (WSL) or a virtual machine.

### Step 2: Clone the Repository

Clone the JustDo repository and its submodules:

```bash
git clone --recursive git@github.com:justdoinc/justdo.git
cd justdo
```

### Step 3: Run JustDo

Start the JustDo application:

```bash
./justdo run
```

Once the application is running, you can access it at [http://localhost:4000/](http://localhost:4000/).

## 🔗 Related Repositories

- [JustDo Main Repository](https://github.com/justdoinc/justdo)
- [JustDo Web App](https://github.com/justdoinc/justdo-web-app-ce)
- [JustDo Landing App](https://github.com/justdoinc/justdo-landing-app-ce)
- [JustDo Packages](https://github.com/justdoinc/justdo-packages)

## 🛠️ **Developer-Friendly**

### **For Developers and Consultants**

JustDo is designed with developers and consultants in mind:

- **Easy Customization**: Modify the platform to suit any industry or client need.
- **Plugin Development**: Create custom plugins with our robust SDK.
- **Scalable Architecture**: Build solutions that grow with your clients - JustDo was designed to be horizontally scalable.

### **Multiple Revenue Streams**

As a JustDo distributor or consultant, you can unlock various revenue opportunities:

- **Software Licensing**: Earn recurring revenue from user subscriptions.
- **Hosting Services**: Offer cloud or on-premise solutions.
- **Customization**: Provide tailored solutions for specific client needs.
- **Training & Support**: Offer ongoing services to enhance client engagement.
- **Business Consulting**: Leverage JustDo to expand your service offerings.

## 🌍 **Join Our Community**

- **Website**: [https://justdo.com](https://justdo.com)
- **Twitter**: [@justdo_com](https://twitter.com/justdo_com)
- **Contact**: [info@justdo.com](mailto:info@justdo.com)

## 🤝 **Contributing**

We welcome contributions to enhance JustDo. Whether it's reporting bugs, suggesting new features, or improving documentation, your input is valuable.

- **Issue Tracker**: Report issues or request features on our [GitHub Issues](https://github.com/justdoinc/justdo/issues).
- **Pull Requests**: Submit improvements or fixes via [pull requests](https://github.com/justdoinc/justdo/pulls).

---

*Note: For licensing information, please refer to the [LICENSE](LICENSE) file.*