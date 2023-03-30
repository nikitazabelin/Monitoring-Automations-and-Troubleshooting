---
- name: Automate Agent Installation
  hosts: localhost
  gather_facts: false
  tasks:
  - name: Copy installer to the machine
    copy:
      src: "{{ agent_installer }}"
      dest: "/tmp"
    delegate_to: localhost
    vars:
      agent_installer: "agent_installer.sh"

  - name: Run chmod u+x agent_installer.sh
    become: yes
    command: chmod u+x /tmp/{{ agent_installer }}

  - name: Install the agent
    become: yes
    command: sh -c "{{ command }}"
    vars:
      command: "sudo /tmp/{{ agent_installer }} install_start --token {{ token }} --attributes {{ tags }}"
      token: "eu:enter-token-123"
      tags: "tag1,tag2,tag3"

  - name: Check agent process
    shell: ps -ef | grep -i agent_rapid
    register: agent_check

  - name: Store output in file
    copy:
      content: "{{ agent_check.stdout_lines }}"
      dest: "/tmp/agent_check.log"
    delegate_to: localhost
