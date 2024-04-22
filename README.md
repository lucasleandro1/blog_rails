# README
Blog Rails
Blog desenvolvido para processo seletivo.

⚙️ Requisitos
Antes de começar, certifique-se de ter instalado em sua máquina:

Ruby 3.2.2
redis 7.0

🚀 Instrução
Use o seguinte comando para clonar o repositório:
* cd ~
* git clone https://github.com/lucasleandro1/blog_rails.git

Instruções para instalar versão 7.0 redis que é necessario para o uso do sidekiq:
* cd ~
* wget https://download.redis.io/redis-stable.tar.gz
* tar xzf redis-stable.tar.gz
* cd redis-stable
* make
* sudo make install

Rode os comandos:
* cd ~
* cd blog_rails
* bundle install
* mailcatcher (Para trocar a senha de usuario se preciso)
* acesse http://127.0.0.1:1080 caso queira acessar o mailcatcher
* bundle exec rake start_services:all
* Acesse o projeto em http://localhost:3000.
