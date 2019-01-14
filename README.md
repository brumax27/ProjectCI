# project_ci

[![Amber Framework](https://img.shields.io/badge/using-amber_framework-orange.svg)](https://amberframework.org)

This is a project written using [Amber](https://amberframework.org). Enjoy!

## Getting Started

These instructions will get a copy of this project running on your machine for development and testing purposes.

Please see [deployment](https://docs.amberframework.org/amber/deployment) for notes on deploying the project in production.

## Development

Please check [Amber Docker guides](https://docs.amberframework.org/amber/guides/docker).

## Cours de CI

### Problematiques

Monter un environement 2 instances
- Serveur web
- Database

Une seule commande `docker-compose up`

Afficher une page avec les data (Ici Students)

### Pistes de resolutions

Nous avions fait une liste des technologies repondant a la problematique et etant facile de mise en place.

Java spring
Amber crystal
Ruby on Rails
Phoenix Elixir
PHP PDO

Nous avons choisi Amber crystal qui etait le plus simple et le plus leger.

Pour mettre en place les instances, un docker-compose.

### Resolution

En etant en Crystal, voici les commandes a executer

```bash
amber new ProjectCI
```

Ensuite creer le `docker-compose` avec les differentes configurations, ici:
- app
- migrate
- db

App est l'environement code de l'application.
Migrate est une routine qui vas lancer les migrations base de donee.
Db est une base de donnee PostgreSQL.

*Problemes rencontrer*

Il nous a fallu faire un link entre l'app et la db pour pouvoir y acceder.
Il nous a fallu trouver la bonne URL pour se connecter a celle-ci depuis l'app.
Il a fallu attendre que la db soit up pour lancer les migrations.
Pour ce faire, nous executons cette commande ci-dessous
```bash
while ! nc -q 1 db 5432 </dev/null; do sleep 1; done
```
Pour garder une persistance des donnees, nous avons fait un partage de volume entre docker et la machine hote.
