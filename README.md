<h1 align="center">
    MNB Maker v1.0
</h1>

<h4 align="center">
  Automatizar a configuração de diversas máquinas
</h4>

<p align="center">
  <img alt="License" src="https://img.shields.io/static/v1?label=license&message=MIT">
</p>

<p align="center">

  <a href="https://github.com/marcelobojikian" target="_blank">
    <img alt="Feito por Marcelo Nogueira" src="https://img.shields.io/badge/Feito%20por-Marcelo_Nogueira-informational">
  </a>
  <a href="https://github.com/marcelobojikian" target="_blank" >
    <img alt="Github - Marcelo Nogueira" src="https://img.shields.io/badge/Github--%23F8952D?style=social&logo=github">
  </a>
  <a href="https://www.linkedin.com/in/marcelobojikian/" target="_blank" >
    <img alt="Linkedin - Marcelo Nogueira" src="https://img.shields.io/badge/Linkedin--%23F8952D?style=social&logo=linkedin">
  </a>

</p>

<p align="center">
  <a href="#-projeto">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-pre-requisitos">Pré-requisitos</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-como-usar">Como usar</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#memo-licença">Licença</a>
</p>

<br>

## 💻 Projeto

Projeto feito para automatizar a configuração de diversas máquinas como notebook, raspberry, servidores, entre outros, também será utilizado para aplicar os conhecimentos que estou estudando de DevOps.

## 🔖 Pre-requisitos

Instalar os programas abaixo:

<ol>
  <li>SSH</li>
  <li>Ansable</li>
</ol>

E para o desenvolvimento:

<ol>
  <li>Vagrant</li>
  <li>VirtualBox</li>
  <li>InSpec</li>
</ol>

## 🤔 Como usar

Primeiro, configure no arquivo de hosts a máquina que deseja configurar.

Para testar, configure a máquina que está no Vagrant.

```bash
172.17.177.10 ansible_user=vagrant ansible_ssh_private_key_file="/home/marcelo/workspace/DEVOPS/mnb-maker/.vagrant/machines/personal_machine/virtualbox/private_key"
```

Execute o Vagrante para criar/iniciar a máquina de teste na VirtualBox.

```bash
$ vagrant up personal_machine
```

Aplique a configuração no playbook.

```bash
$ ansible-playbook -i hosts main.yml
```

Para verificar se está tudo corretamente instalado, use os testes.

```bash
$ inspec exec test/integration/project_github -t ssh://vagrant@172.17.177.10 -i /home/marcelo/workspace/DEVOPS/mnb-maker/.vagrant/machines/personal_machine/virtualbox/private_key
```

## :memo: Licença

Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
