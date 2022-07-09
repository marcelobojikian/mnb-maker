title "Teste do servidor Vault"

control "Vault bin" do
  impact "high"
  title "Vault binary"
  desc "Verifica se foi feito corretamente a instalação do binário Vault"
  describe file("/usr/bin/vault") do
    it { should exist }
    it { should be_file }
  end
  describe command("vault") do
    it { should exist } 
  end
  describe command("vault --version") do
    its("stdout") { should cmp > "Vault v1" }
  end 
end

control "Mysql service" do 
  impact "critical"
  title "Mysql service"
  desc "Verifica se as configurações do banco de dados estão corretas e se os serviços estão funcionando"
  describe service("mysqld") do
    it { should be_enabled }
    it { should be_running }
  end
  describe package("mariadb-server") do
    it { should be_installed }
    its("version") { should cmp > "1:10" }
  end
  describe port("3306") do
    it { should be_listening }
  end 
end

control "Vault server" do
  impact "critical"
  title "Vault server"
  desc "Verifica se o servidor está funcionando com as configurações esperadas"
  describe service("vault") do
    it { should be_enabled }
    it { should be_running }
  end
  describe port("8200") do
    it { should be_listening }
  end
  describe file("/etc/vault.d/config.hcl") do 
    it { should be_file }
    its("content") { should include 'storage "mysql"' }
    its("content") { should include 'username = "vaultuser"' }
    its("content") { should include 'database = "vault"' }
    its("content") { should include 'listener "tcp"' }
    its("content") { should include '172.17.177.20:8200' }
  end
end