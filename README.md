# Phantom

**Phantom** is a simple tool for cloning websites and downloading files from the web. It uses `mirrormate` to handle the cloning and downloading processes.

## Features

- Clone entire websites for offline access.
- Download individual files (e.g., HTML, Python scripts, JSON, shell scripts, etc.).
- Option to run in silent mode for minimal output.

## Installation

Clone the repository and run the setup script to install the tool:

```bash
git clone https://github.com/trashz/phantom
```

```bash
cd phantom
```

```bash
bash setup.py
```

## Usage

Once the setup is complete, you can use the tool via the command line.

### Command Line Options

- `--clone <URL>` : Clone the specified website.
- `--file <URL>` : Download the specified file.
- `--help` : Display help message and usage instructions.

### Example Commands

#### 1. Cloning a website:

To clone a website, use the `--clone` option followed by the URL of the website:

```bash
phantom --clone https://example.com
```

This command will clone the entire website from `https://example.com`.

#### 2. Downloading a file:

To download a specific file, use the `--file` option followed by the file's URL:

```bash
phantom --file https://example.com/file.py
```

This command will download the file located at `https://example.com/file.py`.

## Error Handling

- **Both `--clone` and `--file` Provided**: If you specify both `--clone` and `--file` options simultaneously, the tool will raise an error and exit.
- **No URL Provided**: If neither `--clone` nor `--file` is specified, the tool will prompt you to provide at least one option and exit.

