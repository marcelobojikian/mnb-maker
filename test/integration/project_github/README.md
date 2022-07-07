# InSpec Profile [project_github]

Implementação dos teste de todos os projetos que serão descarregados para a máquina pessoal.
Para mais informações, acesse [InSpec profile](../../docs/profiles.md).

## Verifique esse profile

E possivel verificar se a estrutura do profile esta correta.

```bash
$ inspec check test/integration/project_github

Location :   test/integration/project_github
Profile :    project_github
Controls :   1
Timestamp :  2022-07-07T12:48:57+01:00
Valid :      true

No errors, warnings, or offenses
```

## Execute esse profile

Para executar todos os controles **suportados** em uma máquina local, use `inspec exec test/integration/project_github`.

```bash
$ inspec exec test/integration/project_github

Profile:   InSpec Profile (project_github)
Version:   0.1.0
Target:    local://
Target ID: d5c4d301-c635-5fcf-a744-47910b919a36

  ✔  marcelobojikian: Download dos projetos de marcelobojikian
     ✔  File /home/vagrant/workspace/LINUX/mnb-installer is expected to exist
     ✔  File /home/vagrant/workspace/JAVA/Theme-Java is expected to exist


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 2 successful, 0 failures, 0 skipped
```

## Executar um controle específico desse profile

Para executar somente o profile project_github no arquivo marcelobojikian.rb, use `inspec exec test/integration/project_github --controls marcelobojikian`.

```bash
$ inspec exec test/integration/project_github --controls marcelobojikian
..
Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 2 successful, 0 failures, 0 skipped
```

## Executar esse profile a uma máquina remota

Para executar profile remotamente, use `inspec exec test/integration/project_github -t ssh://vagrant@172.17.177.10 -i /home/vagrant/workspace/DEVOPS/mnb-maker/.vagrant/machines/personal_machine/virtualbox/private_key`.

```bash
$ inspec exec test/integration/project_github -t ssh://vagrant@172.17.177.10 -i /home/vagrant/workspace/DEVOPS/mnb-maker/.vagrant/machines/personal_machine/virtualbox/private_key
..
Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 2 successful, 0 failures, 0 skipped
```