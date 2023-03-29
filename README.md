# SICREDI API
## RESUMO
API utilizada para o projeto da SICREDI no qual contempla funcionalidades a respeito do gerenciamento de patrimônios das agências, contatos e dispositivos, englobando aspectos como contagem de imobilizados, geração de ocorrências e relatórios, cadastro automático de dispositivos, transferência de contatos, entre outras funcionalidades básicas como cadastro, listagem, atualização e exclusão de dados.

####  Instale, configure e execute esse projeto:
```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```
----
#### Instale e execute os testes:
Usando rspec:
```
bundle install
rails db:create
rails db:migrate
rspec
```
Usando parallel gem:
```
bundle install
rake parallel:create
rake parallel:migrate
rake parallel:spec
```
----
#### Este projeto necessita do redis para executar tarefas assíncronas com o sidekiq:

Instale e execute o redis:
```
sudo apt install redis-server
sudo service redis-server start
```
Execute o sidekiq:
```
bundle exec sidekiq -q default
```

# FLUXOS ESPECÍFICOS
#### **Usuários**
- Cadastro: são cadastrados por um administrador, informando um código e um e-mail para enviar as instruções para a definição de senha, pois, os usuários não possuem e-mail;
- Redefinição de senha: o administrador informa o usuário e o e-mail para qual deve ser enviado as instruções para redefinição da senha.

#### **Patrimônios**
- Cadastro: são cadastrados por meio do upload dos arquivos CSV, que varre as linhas e cria os imobilizados;
- Atualização: só é possível alterar a descrição e o ano.

#### **Imobilizados**
- Cadastro: são cadastrados no upload do arquivo CSV do patrimônio.
#### **Agências**
- Cadastro: são cadastrados no upload do arquivo CSV do patrimônio.
#### **Contagens**
- Cadastro: no cadastro de uma contagem, são criadas pendências de contagem para os imobilizados das agências associadas à contagem;
- Contar um imobilizado: deve-se enviar o número do inventário e os sub números dos imobilizados a serem contabilizados.
#### **Ocorrências**
- Cadastro: é possível enviar o ID do imobilizado caso seja um item que exista na contagem, ou também é possível enviar as informações do item e gerar uma ocorrência manualmente com as informações inseridas.
#### **Dispositivos**
- Cadastro: são cadastrados no momento do login de um gerente de contas;
- Atualização: caso o dispositivo for atualizado com uma agência ele passa a ter o status autorizado, caso contrário estará desautorizado, se não estiver bloqueado;
- Transferência de contatos: informa-se o dispositivo que irá receber os contatos através do body na requisição e o dispositivo que irá enviar os contatos através do ID na URL.

# AUTENTICAÇÃO
#### **Login**
- Deve-se utilizar o código do usuário e a sua senha;
- Se o usuário for um administrador de contas, deve-se passar um identificador do dispositivo nos parâmetros da requisição.

#### **Headers**
- Deve-se adicionar o header **jwd-aud**: com o valor de *web_app_client* para acessar as funcionalidades como um usuário Web;
- Deve-se adicionar o header **jwd-aud** com o valor de *mobile_app_client* para acessar as funcionalidades como um usuário Mobile;

**Obs: Deve-se enviar este header em toda requisição.**

# GLOSSÁRIO
- Property: Patrimônio;
- Fixed Asset: Imobilizado;
- Count: Contagem;
- Agency: Agência;
- Occurrence: Ocorrência;
- Contacts: Contatos;
- Devices: Dispositivos.
