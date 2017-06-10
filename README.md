# README

# colabore

Um sistema onde entidades sociais podem anunciar vagas para voluntários e pessoas dispostas a se voluntariar podem navegar e fazer buscas para encontrar e se candidatar aos projetos de interesse. O sistema também tem como objetivo servir como uma prova social dos trabalhos voluntários prestado pela pessoa.

O aplicativo pode ser acessado por qualquer dispositvo a partir deste <a href="https://www.colabore.org.br">link</a>. 

https://app.codeship.com/projects/03400d50-2c03-0135-d4a4-7229e0f954fc/status?branch=master


commands: `docker-compose build`
`docker-compose run --rm web rake db:create`
`docker-compose up`

Stack
-----------------------------------------------------------------------------------------------------------------------------------------
Ruby (on Rails)
SCRUM
Materialize Framework


<h1>I want to contribute</h1>
-----------------------------------------------------------------------------------------------------------------------------------------
Everyone is welcome to contribute to the project and improve the way people get information about bus traffic.
To contribute follow the steps below:
1. Fork this repository
2. Clone your fork to a local repository
git clone your-foked-repository
cd your-foked-repository
3. Preparing Ambient
Rename the file of ambient variables from .env.example to .env.
4. Run docker-composer build
docker-compose up --build
5. Run migrations (Os containers terão que estar up para executar o comando abaixo)
docker-compose up
docker-compose run --rm app bundle exec rake db:create db:migrate
6. Run tests
docker-compose exec app bundle exec spring rspec
7. Start the app
docker-compose up --build
8. Add the original repository as a source in your local repository
git remote add upstream https://github.com/andreleoni/noPonto
9. Sync your repository with the original
git fetch upstream
10. Update local repository
git checkout master
git merge upstream/master
11. Create a new branch
git checkout -b my-new-feature
12. Make a pull request
