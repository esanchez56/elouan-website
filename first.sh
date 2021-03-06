#!/bin/bash
clear
echo "Assistant Cristalea"
echo "Que voulez-vous faire ?"
echo " "
echo " "
echo "1 - Preview du site en local"
echo "2 - Construire le site et rendre public"
echo "3 - Télécharger la dernière version du site" 
cd elouan-website
read ans

if [ $ans -eq 1 ]; then
clear
echo "Preview ici:  http://localhost:1313 CTRL+C pour quitter"
hugo server -d docs > .temp
elif [ $ans -eq 2 ]; then 
echo "Construction du site en cours"
hugo -d docs > .temp
echo "Construction terminée"
echo "Préparation de l'envoie"
git config pull.rebase false >> .temp
git pull >> .temp
git add -A >> .temp
git commit -m "Modification Article Elouan" 
echo "Envoie en cours"
git push origin master:master >> .temp
clear

echo "Envoyé ! Le site sera mis à jour sur internet dans les 3 prochaines minutes."
read end
elif [ $ans -eq 3 ]; then 
git pull >> .temp
clear
echo "La dernière version est sur ton ordinateur."
read end
fi

