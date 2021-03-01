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

- obs: Caso esteja ocorrendo erro ao instalar o RUBY por RVM (Ruby Version Manager). Execute o comando no terminal: 
- 'rvm autolibs disable' e depois 'rvm install 2.7.2' (link da resolução apt-get update returns 100 error because of 404 Not Found for some repos · Issue #3411 · rvm/rvm ) 

# Excecução dos teste 
- Abra o terminal na pasta respectiva do teste (~/inmetrics-teste/api)
- Execute o comando 'cucumber -t @empregados'