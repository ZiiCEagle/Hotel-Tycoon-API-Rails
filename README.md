# Hotel Tycoon API REST

API RESTful utilisée pour la gestion d'un hôtel.

## Environnement de développement

### Prérequis

* ruby >= 2.2.2
* rails >= 5.0.0.rc1
* bundler < 2.0, >= 1.3.0

### Installation

```
$ git clone https://github.com/ZiiCEagle/Hotel-Tycoon-API-Rails.git
$ cd Hotel-Tycoon-API-Rails
$ bundle
$ rake db:migrate
$ rails server
```

## Environnement de production

L'application est disponible à l'adresse : [http://dry-wildwood-55915.herokuapp.com/](http://dry-wildwood-55915.herokuapp.com/)


### Déploiement

Heroku est utilisé pour héberger l'API.
Le déploiement est automatique depuis Github.
Pour forcer un déploiement :

```
$ git push heroku master
```

## Liens utiles

Aide pour l'installation : [http://installrails.com](http://installrails.com)
