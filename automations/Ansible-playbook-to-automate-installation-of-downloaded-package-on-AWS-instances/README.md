# Ansible-playbook-to-automate-installation-of-downloaded-package-on-AWS-instances

In this playbook, the first task copies the installer file agent_installer.sh to the machine.

The second task makes the installer file executable with the chmod command.

The third task runs the installer command, either agent_installer.sh install_start --token eu:enter-token-123 --attributes "tag1,tag2,tag3" or agent_installer-arm64.sh install_start --token :enter-token-XYZ --attributes "tag1,tag2,tag3", depending on the architecture of the machine.

The fourth task uses the shell module to check the agent process and the final task stores the output in a file named agent_check.log.
