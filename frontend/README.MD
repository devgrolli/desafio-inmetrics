# Configuração automação 

# Instalação e configuração no Ubuntu 
- Abra o terminal 
- Execute os comandos em sequência:
    1) sudo apt update
    2) sudo apt-get update
    3) sudo apt-get install rvm
    4) wget https://launchpad.net/~rael-gc/+archive/ubuntu/rvm/+files/rvm_1.29.12-1_all.deb -O rvm.deb
    5) sudo dpkg -i rvm.deb
    6) sudo apt-get install -f
- Abra o terminal, na aba “Título e commando”, ative a opção “Executar comando como shell de sessão”
- Execute o comando para baixar a versão do ruby 'rvm install 2.7.2' (por exemplo)
- Por fim, execute o comando 'rvm use 2.7.2 -default'

- OBS: Caso esteja ocorrendo erro ao instalar o RUBY por RVM (Ruby Version Manager), como no exemplo abaixo. Execute o comando no terminal: rvm autolibs disable e depois rvm install 2.7.2 (link da resolução https://github.com/rvm/rvm/issues/3411) 

# Chromedriver
- Instale o Google Chrome, caso já esteja instalado, verifique a versão que está instalada para que seja compativel com o chrome driver. 
- Acesse https://chromedriver.chromium.org/, baixe a versão que seja compativel com o Google Chrome que está instalado.
- Extraia o arquivo 
- Abra no terminal o local onde foi extraido o arquivo do chromedriver  
- Mova o arquivo chrome driver para a pasta bin do RVM com o comando 'mv chromedriver ~/.rvm/gems/ruby-2.7.2/bin'

# Excecução dos teste 
- Abra o terminal na pasta respectiva do teste (~/inmetrics-teste/frontend)
- Execute o comando 'cucumber -t @completo'