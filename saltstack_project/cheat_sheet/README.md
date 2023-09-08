## SaltStack Basic Cheat Sheet

SaltStack is a powerful configuration management and orchestration tool. This cheat sheet provides a quick reference to common state configuration tasks.

### Basic Salt State Components:

1. **State ID**: A unique identifier for a block of state declarations.
2. **State Type (or Module)**: The type of management task, such as `pkg`, `file`, `service`.
3. **Function**: A specific operation within the state type/module, like `installed`, `managed`, `running`.

### Common State Modules & Functions:

#### 1. Package Management (`pkg`):
- **installed**: Ensures a package is installed.
- **removed**: Ensures a package is not installed.
- **latest**: Ensures the latest version of a package is installed.

#### 2. File Management (`file`):
- **managed**: Ensures a file is present with the specified contents.
- **recurse**: Ensures a directory structure is recursively managed.
- **directory**: Ensures a directory exists with specified attributes.
- **absent**: Ensures a file or directory is not present.

#### 3. Service Management (`service`):
- **running**: Ensures a service is running.
- **enabled**: Ensures a service starts on boot.
- **dead**: Ensures a service is not running.
- **disabled**: Ensures a service does not start on boot.

### State Declaration Examples:

#### Install a Package:
```yaml
install_nginx:
  pkg.installed:
    - name: nginx
```

#### Ensure a Service is Running:
```yaml
start_nginx:
  service.running:
    - name: nginx
```

#### Manage a File's Contents:
```yaml
configure_nginx:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://path/to/nginx.conf
```

#### Ensure a Directory Exists:
```yaml
create_directory:
  file.directory:
    - name: /path/to/directory
    - user: username
    - group: groupname
    - mode: 755
```

#### Recursively Manage a Directory:
```yaml
manage_website_files:
  file.recurse:
    - name: /var/www/html
    - source: salt://path/to/web/files
```

### Other Useful Features:

#### Requisites:
- `require`: Specify other states that must be successfully applied before the current one.
- `watch`: Like `require`, but also restarts services if a referenced state changes a file.

#### Template Rendering:
- You can utilize the Jinja templating engine to generate dynamic configurations using the `template` argument, typically set to `jinja`.

#### State Inheritance:
- The `extend` keyword allows you to modify previously defined states.

---

For a comprehensive guide, always refer to the [official SaltStack documentation](https://docs.saltproject.io/en/latest/).
