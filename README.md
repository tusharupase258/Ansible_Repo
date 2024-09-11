
---

# ⚙️ Ansible Automation Playbooks

Welcome to **Ansible_Repo**! This repository is designed to help you automate infrastructure and application configurations using Ansible. Here, you'll find a collection of playbooks and resources to streamline your automation tasks.

## 🚀 Getting Started

### Prerequisites

Ensure your environment is ready:

- **Linux (Ubuntu or other distros)**
- **Python 3.x**
- **Ansible** installed

### Installation Guide

1. **Update your package list**:
    ```bash
    sudo apt update
    ```

2. **Install Python and Pip**:
    ```bash
    sudo apt install python3 python3-pip
    ```

3. **Install Ansible**:
    ```bash
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
    ```

4. **Verify Ansible Installation**:
    ```bash
    ansible --version
    ```

## 📁 Repository Structure

The repository is organized as follows:

```bash
Ansible_Repo/
├── playbooks/             # Core playbooks for automation
├── inventory/             # Inventory of hosts
│   └── hosts              # File listing managed nodes
├── roles/                 # Reusable roles for modular tasks
│   ├── webserver/         # Example role: Setting up a web server
│   │   ├── tasks/         # Tasks for the webserver role
│   │   ├── handlers/      # Handlers for the webserver role
│   │   └── templates/     # Templates for configuration files
├── group_vars/            # Group-specific variables
├── host_vars/             # Host-specific variables
├── ansible.cfg            # Ansible configuration file
└── README.md              # This documentation file
```

## 🔧 Key Concepts

### Ansible Modules

Ansible modules are used to perform tasks. Here are some examples:

- **`apt`**: Install packages on Ubuntu/Debian.
    ```yaml
    - name: Install NGINX
      apt:
        name: nginx
        state: present
    ```

- **`service`**: Manage services.
    ```yaml
    - name: Ensure NGINX is running
      service:
        name: nginx
        state: started
    ```

- **`copy`**: Copy files to remote servers.
    ```yaml
    - name: Copy index.html to web server
      copy:
        src: files/index.html
        dest: /var/www/html/index.html
    ```

- **`template`**: Use Jinja2 templates to generate configuration files.
    ```yaml
    - name: Deploy configuration template
      template:
        src: templates/nginx.conf.j2
        dest: /etc/nginx/nginx.conf
    ```

### Inventory Management

Define and manage your hosts in the `inventory/hosts` file:
```ini
[webservers]
web01 ansible_host=10.0.0.1 ansible_user=ubuntu

[dbservers]
db01 ansible_host=10.0.0.2 ansible_user=ubuntu
```

### Variables

Variables make your playbooks flexible. Define them in:

- **Group variables** (`group_vars/`)
- **Host variables** (`host_vars/`)
- **Playbook variables**: Directly in playbooks.

### Roles

Roles help organize playbooks into reusable components. Each role has:
- **`tasks/`**: Define tasks for the role.
- **`handlers/`**: Define handlers for actions like restarting services.
- **`templates/`**: Store templates for configuration files.
- **`defaults/`**: Default variables for the role.
- **`vars/`**: Additional variables.

Example of using a role:
```yaml
- hosts: webservers
  roles:
    - webserver
```

### Handlers

Handlers are triggered by tasks. They are useful for actions that need to occur only if a task makes a change:
```yaml
tasks:
  - name: Deploy nginx configuration
    template:
      src: templates/nginx.conf.j2
      dest: /etc/nginx/nginx.conf
    notify:
      - Restart NGINX

handlers:
  - name: Restart NGINX
    service:
      name: nginx
      state: restarted
```

### Conditions

Implement conditional logic in playbooks to control task execution:
```yaml
- name: Install package if not present
  apt:
    name: nginx
    state: present
  when: ansible_os_family == "Debian"
```

### Loops

Use loops to repeat tasks over a list of items:
```yaml
- name: Install multiple packages
  apt:
    name: "{{ item }}"
    state: present
  loop:
    - nginx
    - vim
    - git
```

## 🚨 Running Your First Playbook

1. **Clone the repository**:
    ```bash
    git clone https://github.com/tusharupase258/Ansible_Repo.git
    cd Ansible_Repo
    ```

2. **Define your target hosts** in `inventory/hosts`:
    ```ini
    [webservers]
    server1 ansible_host=192.168.1.10 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
    ```

3. **Run a playbook**:
    ```bash
    ansible-playbook -i inventory/hosts playbooks/<playbook-name>.yml
    ```

## 🛠️ Contributing

Have suggestions or improvements? Fork the repository, make changes, and submit a pull request. Collaboration is encouraged!

## 📝 License

This repository is licensed under the MIT License. See the `LICENSE` file for more details.

---

> *"Simplify your infrastructure management with Ansible!"* 🌟

---
