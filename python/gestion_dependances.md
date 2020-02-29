# La gestion des dépendances en python


## Article
- distutils, setuptools, tox and pyproject : https://www.bernat.tech/pep-517-518/


## Liste des outils :
Génération du fichier requirements à partir des sources :
Necessite pipreqs (`pip install pipreqs`)
`pipreqs --use-local --savepath pipreq_out.txt $folder`

Compilation des requirement pour freeze toutes les dépendances :
Nécessite pip-tools (`pip install pip-tools`)
`pip-compile --output-file=requirements.txt requirements.in`

Installation des dépendances d'un fichier requirements :
`pip install -r requirements.txt`

Installation des dépendances, avec suppression de celles en trop :
`pip-sync requirements.txt`


## Syncronisation des dépendances entre plusieurs projets
Supprosons que nous avons 4 projets :
- Lib A
- Projet B qui utilise Lib A
- Projet C qui utilise aussi Lib A
- Projet D qui utilise Projet C comme lib

L'objectif est de pouvoir avoir des versions différentes des packages python dans Projet B et Projet C, tout en restant compatible avec les requirements de Lib A.
Lib A doit dont définir des dépendances larges sous la forme Library>=0.2
Projet B doit définir des dépendances strictes, sous la forme Framework==0.9.4
Projet C doit avoir les 2, des dépendances larges lorsqu'il est utilisé comme lib, et des dépendances strictes lorsqu'il est utilisé comme projet seul.

Il n'existe pas encore de norme "universelle" en python pour gérer ce problème, mais plusieurs outils.
Nous allons utiliser le `setup.py` pour définir les dépendances larges, un fichier requirements.in comme intermediaire vers le fichier requirements.txt pour les dépendances fixes.
Pour installer un projet, il faudra installer les dépendances de requirements.txt. Pour l'utiliser comme lib, les dépendances du setup.py seront suffisantes.
