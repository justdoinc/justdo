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


## 🚀 Installation & Usage

The installation options are as follows:

* [Option 1: Quick Start With a Convenient One-Liner](#option-1-quick-start-with-a-convenient-one-liner)
   * [Maintanance Operations for Option 1](#maintanance-operations)
* [Option 2: Customized Docker Compose Setup](#option-2-customized-docker-compose-setup)
   * [Maintanance Operations for Option 2](#maintanance-operations)
* [Option 3: Running Development Environment from Source Code](#option-3-running-development-environment-from-source-code)

### Option 1: Quick Start With a Convenient One-Liner

This is the **recommended option** for quickly evaluating JustDo under `localhost`. You can also explore a demo instance at [justdo.com](https://justdo.com). This setup works well for local testing. For a production-ready configuration see [Option 2](#option-2-customized-docker-compose-setup).

You can copy and paste the following line into your shell for a quick setup:
```bash
curl -Ls https://justdo.com/docker-compose.yml | docker compose -p "justdo" -f - up -d
```
This will start a *JustDo* container and a *MongoDB* container.

**Please allow *2–3 minutes* for everything to fully initialize.**

#### Accessing JustDo:

JustDo consists of two apps:


* Landing Page (Registration/Login) at http://localhost:3150
* Main Web App at http://localhost:3151

Check the [Maintanance Operations](#maintanance-operations) section for details about stopping/starting/removing the JustDo stack & information about the MongoDB container backup/restore.

### Option 2: Customized Docker Compose Setup

**Purpose:** This option offers a **production-ready** or **fully customizable** JustDo environment. Rather than using a quick one-liner, you'll **download** our [docker-compose.yml](https://justdo.com/docker-compose.yml) file. We've included **extensive comments** and example configurations for the most common customizations, so you can adapt the setup to your specific needs.

#### Step 1: Download and Modify `docker-compose.yml`

1. [Download the docker-compose.yml file](https://justdo.com/docker-compose.yml).
2. Open it in a text editor and adjust ports, credentials, or environment variables to match your requirements.

**Notes:**

1. **Use a Secure MongoDB Password**  
   Even though the MongoDB container is bound to `127.0.0.1` and not exposed externally, it's still best practice to set a strong password for the admin user.

2. **Override Any Environment Variable**  
   All environment variables referenced in our [default-config.bash](https://raw.githubusercontent.com/justdoinc/justdo/refs/heads/master/default-config.bash) are supported; simply define or override them under the `environment:` section of the justdo service.

3. **Switching from Option 1**  
   If you already installed the JustDo stack with Option 1 and now want to configure the MongoDB password, you'll need to remove the existing stack first (see [Maintenance Operations](#maintanance-operations)). Doing so clears the data stored in the volumes—assuming it was for evaluation only. If you need to keep that data, **back it up** before switching to Option 2.

#### Step 2: Installing the Docker Compose stack

Run the following command to start the containers in the folder in which you located the `docker-compose.yml` file:

```bash
docker compose -p "justdo" up -d
```

Note that we use `-p "justdo"` to specify the project name for this Docker Compose stack. This ensures container names stay consistent and predictable—so the [maintenance commands](#maintenance-operations) below (e.g., stopping or removing containers) will function as expected.

**Please allow *2–3 minutes* for everything to fully initialize.**

#### Step 3: Access JustDo

If you didn't change the default ports in the `docker-compose.yml` file, you can access JustDo at:


* Landing Page (Registration/Login) at http://localhost:3150
* Main Web App at http://localhost:3151

Check the [Maintanance Operations](#maintanance-operations) section for details about stopping/starting/removing the JustDo stack & information about the MongoDB container backup/restore.

### Option 3: Running Development Environment from Source Code

[The source code of JustDo is available on GitHub](https://github.com/justdoinc/justdo). If you prefer to run JustDo natively or want to customize the codebase, follow these steps:

#### Step 1: Install Prerequisites

##### Install Meteor

JustDo is built on [Meteor.js](https://www.meteor.com/), a powerful full-stack JavaScript framework for building real-time applications.

Install Meteor.js by running the following command in your terminal:
```bash
curl https://install.meteor.com/\?release\=2.16 | sh
```

##### macOS Additional Steps

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

##### Linux Additional Steps

JustDo is fully supported on Linux. No further steps are required.

##### Windows Users

As of now, JustDo is not officially supported on Windows. However, you can run JustDo on Windows using the Windows Subsystem for Linux (WSL) or a virtual machine.

#### Step 2: Clone the Repository

Clone the JustDo repository and its submodules:

```bash
git clone --recursive git@github.com:justdoinc/justdo.git
cd justdo
```

#### Step 3: Run JustDo

Start the JustDo application:

```bash
./justdo run
```

**The initial setup will take 10-15 minutes to complete - please be patient.** Consequitive runs will run much faster.

Once the application is running, you can access it:

* Landing Page (Registration/Login) - [http://localhost:4000/](http://localhost:4000/)
* Main Web App - [http://localhost:3000/app](http://localhost:3000/app)

(Note that the default ports for the development environment are different from the Docker environment.)

## Maintanance Operations

This section is relevant only if you started the JustDo stack using the `docker-compose.yml` file from Option 1 or Option 2 above.

### Stopping JustDo

If you just want to stop running containers (but keep volumes/data intact):

```bash
docker compose -p "justdo" stop
```

This stops the containers without removing volumes or networks.

### Starting JustDo after stopping it

To start the stack:

```bash
docker compose -p "justdo" start
```

### Removing JustDo completely

To remove all containers, networks, and volumes associated with the JustDo stack:

```bash
docker compose -p "justdo" down
```

This cleans up everything created by the Compose file except the data stored in volumes.

If you also want to remove the data stored in volumes, run the following command:

**Be careful with this command, as it will remove all your data!** (you can backup the data before running this command, details under [Backup/Restore](#mongodb-container-backuprestore))

```bash
docker compose -p "justdo" down -v
```

This cleans up everything created by the Compose file, **including any data stored in volumes**. If you plan to reinstall later, note that you'll be starting from a blank slate - *all your data will be removed*.

To also remove the JustDo image:

```bash
docker rmi justdoinc/justdo
```

Note we don't remove the mongo image, as it might be used by other stacks.

### MongoDB Container Backup/Restore

By default, the setup above doesn't include an automated backup process for MongoDB - **backups are your sole responsibility!**

The following is a basic example of how to manually back up or restore your data, see it only as a reference to start building your own backup/restore process, with your particular needs in mind.

**Backup**:

   ```bash
   docker exec justdo-mongodb-1 sh -c 'mongodump --username admin --password password --authenticationDatabase admin --archive' > db.dump
   ```

This creates a db.dump file in your current directory, containing a snapshot of your MongoDB data.

**Restore**:

```bash
cat db.dump | docker exec -i justdo-mongodb-1 mongorestore --username admin --password password --authenticationDatabase admin --archive
```

**Note**  
You must replace `password` in both of the commands above with the actual password.

- **If you used Option 1**  
  The default password is literally `password`. Running the command *as-is* should work. This option is **not** intended for production and is only used when MongoDB is not exposed to external networks.

- **If you used Option 2**  
  Use the password you specified in your `docker-compose.yml` file.

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
