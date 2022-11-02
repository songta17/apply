# Test de candidature

Vous souhaitez rejoindre l'équipe de Mon Territoire ?  
Ou vous avez tout simplement envie de vous frotter à un petit exercice ?

Clonez ce repository, lancez les tests et faites les passer en vert !   
Une seule règle : **on ne touche pas au dossier `spec`**, sinon c'est de la triche !

Envoyez-nous votre réponse à [cto@mon-territoire.fr](mailto:cto@mon-territoire.fr) et nous vous recontacterons très vite.  

note:
part 1: environ 1 hour: perte de temps sur le street form au lieu de from
part 2: 23:18
part 4: 0:00 - 0:20 / stop

TOdo
CommunesController
  #create
    is forbidden (FAILED - 14)
  #show
    requires :code_insee to identify resource (FAILED - 15)
    responds with success (FAILED - 16)
  #update
    requires :code_insee to identify resource (FAILED - 17)
    requires attributes to update (FAILED - 18)
    updates the resource and responds with empty response (FAILED - 19)