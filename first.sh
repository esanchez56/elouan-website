#!/bin/bash
clear
echo "Assistant Cristalea"
echo "Que voulez-vous faire ?"
echo " "
echo " "
echo "1 - Preview du site en local"
echo "2 - Construire le site et rendre public"
cd elouan-website
read ans

if [ $ans -eq 1 ]; then
echo " "
echo "Preview ici:  http://localhost:1313 CTRL+C pour quitter"
hugo server -d docs > .temp
elif [ $ans -eq 2 ]; then 
echo "Construction du site en cours"
hugo -d docs > .temp
echo "Construction terminée"
echo "Préparation de l'envoie"
git pull
git add -A
git commit -m "Modification Article Elouan" 
read a
echo "Envoie en cours"
git push master --all
echo "Envoyé ! Le site sera mis à jours sur internet dans les 3 prochaines minutes."
fi

