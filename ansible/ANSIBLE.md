# Ansible report

Check docker version before run ansible (docker is not installed):

![](.github/img1.png)

50 last lines of the output of the my deployment command (`ansible-playbook playbooks/dev/main.yml --diff`):

![](.github/img2.png)

Output of the `ansible-inventory` command:

![](.github/img3.png)

Check docker version after running ansible:

![](.github/img4.png)

## Bonus task

Recreate Yandex virtual machine.

Check docker version before run ansible (docker is not installed):

![](.github/img5.png)

50 last lines of the output of the my deployment command (`ansible-playbook playbooks/dev_with_plugin/main.yml --ask-vault-pass --diff`):

![](.github/img6.png)

Output of the `ansible-inventory` command:

![](.github/img7.png)

Check docker version after running ansible:

![](.github/img8.png)



## Lab6

Check the site before running ansible:

![](.github/img9.png)

Output of the your deployment command:

![](.github/img10.png)

Check the site after running ansible:

![](.github/img11.png)