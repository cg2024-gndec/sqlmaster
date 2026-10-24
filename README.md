# MySQL Complete Installation Guide (Windows 11)

This guide explains how to download and install MySQL Server, MySQL Workbench, and other available MySQL development tools on Windows.

## Official Download Link

**MySQL Installer for Windows:**  
https://dev.mysql.com/downloads/installer/

### Which file should I download?

On the official page, choose the **full installer**:

- **Filename:** `mysql-installer-community-8.0.46.0.msi`
- **Approximate size:** 566 MB
- **Purpose:** Bundles the MySQL Installer and MySQL product packages, so you can install selected components without downloading each package separately.

Avoid choosing `mysql-installer-web-community-8.0.46.0.msi` if you specifically want the full installer; the web installer is much smaller and downloads selected products during setup.

> **Note:** MySQL Installer 8.0.46 is the final series of the traditional MySQL Installer. MySQL Server versions 8.1 and later use separate product installers and MySQL Configurator. Check the official page for current availability and details.

## 1. Before You Start

1. Use a Windows account with administrator privileges.
2. Keep an internet connection available in case setup needs to install prerequisites.
3. If MySQL is already installed and contains databases you need, back them up before uninstalling or removing old data folders.
4. Keep the root password you create during setup in a secure place.

## 2. Download the Full Installer

1. Open the official page: https://dev.mysql.com/downloads/installer/
2. Find the **Windows (x86, 32-bit), MSI Installer** entries for version **8.0.46**.
3. Download `mysql-installer-community-8.0.46.0.msi` (the approximately 566 MB package).
4. If prompted to sign in to an Oracle account, use the option to continue the download without signing in, if shown.
5. Wait for the download to finish.

The installer itself is 32-bit, but it can install both 32-bit and 64-bit MySQL binaries as applicable.

## 3. Run the Installer

1. Open your **Downloads** folder.
2. Double-click `mysql-installer-community-8.0.46.0.msi`.
3. Approve the Windows permission prompt if it appears and you trust the downloaded file.
4. Follow the setup wizard.

## 4. Choose the Setup Type

For a typical student or developer laptop, select **Developer Default**.

This setup type includes MySQL Server and common development tools such as MySQL Workbench. If you specifically want every component offered by the installer, select **Full** instead, if available. Full installs more components and may use more disk space.

1. Select the desired setup type.
2. Click **Next**.
3. Review the requirements screen.
4. If the installer identifies missing prerequisites, follow its instructions to install them.
5. Continue until the product installation screen appears.
6. Click **Execute** to install the selected products.
7. Wait for all selected installations to complete, then continue to configuration.

## 5. Configure MySQL Server

When the configuration wizard opens, use the following settings for a typical local development setup. The exact screens may differ slightly.

1. **Server configuration type:** Choose the default standalone development option, if offered.
2. **Connectivity:** Keep TCP/IP enabled.
3. **Port:** Use `3306`, unless another service already uses it.
4. **Authentication:** Keep the recommended secure authentication option unless your application specifically requires something else.
5. **Root password:** Create a strong password and store it securely.
6. **Windows service:** Enable MySQL to run as a Windows service and start automatically with Windows, if offered.
7. Apply the configuration and wait for all steps to succeed.

Do not share your root password or place it in a public repository.

## 6. Open MySQL Workbench

1. Open the Windows Start menu.
2. Search for **MySQL Workbench**.
3. Launch the application.
4. Create a new connection if one was not created automatically.

Use these typical local connection settings:

| Setting | Value |
|---|---|
| Connection Name | `Local MySQL` |
| Connection Method | Standard TCP/IP |
| Hostname | `localhost` |
| Port | `3306` |
| Username | `root` |
| Password | The root password created during configuration |

Leave **Default Schema** blank unless you already have a database you want to open.

Click **Test Connection**, enter the password if prompted, and save the connection if the test succeeds.

## 7. Test the Installation

Open the connection in Workbench and run:

```sql
SELECT VERSION();
```

Then create a practice database:

```sql
CREATE DATABASE college;
USE college;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    branch VARCHAR(50),
    semester INT
);

INSERT INTO students (id, name, branch, semester)
VALUES
    (1, 'Aman', 'CSE', 5),
    (2, 'Priya', 'CSE', 5);

SELECT * FROM students;
```

If the queries execute and the records appear in the results grid, the basic installation and connection are working.

## 8. Troubleshooting

### Workbench says the server is offline or unreachable

1. Press `Windows + R`.
2. Enter `services.msc` and press Enter.
3. Find the MySQL service, often named `MySQL80`.
4. If it is stopped, right-click it and choose **Start**.
5. Check that the connection uses the correct hostname and port.

### Access denied for user `root`

- Check the username and password.
- Use the password created during server configuration.
- Do not reinstall immediately; first verify the server account and credentials.

### Port 3306 is already in use

Another MySQL service or application may be using the port. Check the existing service and port configuration before choosing a different port.

### MySQL Server is missing

Workbench is only the graphical client. Make sure **MySQL Server** was selected and installed in the installer.

## Official Documentation

- [MySQL Installer download page](https://dev.mysql.com/downloads/installer/)
- [Installing MySQL on Windows](https://dev.mysql.com/doc/mysql-windows-excerpt/8.0/en/windows-installation.html)

---

**Recommended for most students:** Choose **Developer Default**, configure MySQL Server, and use MySQL Workbench to practise SQL. Choose **Full** only if you want all components offered by the installer and have sufficient disk space.
