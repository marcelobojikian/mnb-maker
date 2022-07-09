
title "Instalando os repositórios do github"

control "marcelobojikian" do
  impact "none"
  title "Download dos projetos de marcelobojikian"
  desc "Descarregar e enviar para projeto para sua pasta correspondente"
  
  describe file("/home/marcelo/workspace/LINUX/mnb-installer") do
    it { should exist }
  end
  
  describe file('/home/marcelo/workspace/JAVA/Theme-Java') do
    it { should exist }
  end
  
end
