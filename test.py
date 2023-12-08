import os

def afficher_menu_principal():
 print("1. Exécuter des scripts Bash")
 print("2. Install Menu")
 print("3. Quitter")

def afficher_sous_menu_bash():
 print("Sous-menu - Scripts Bash:")
 print("1. Script 1")
 print("2. Script 2")
 print("3. Retour au menu principal")

def executer_script_bash(script):
 os.system(script)

def executer_commande_terminal(commande):
 os.system(commande)

def install_menu():
 print("Sous-menu - Commandes prédéfinies:")
 print("1. install")
 print("2. Commande 2")
 print("3. Retour au menu principal")

def main():
 while True:
  afficher_menu_principal()
  choix_principal = input("Sélectionnez une option : ")

if choix_principal == "1":
 while True:
  afficher_sous_menu_bash()
  choix_bash = input("Sélectionnez un script Bash : ")

if choix_bash == "1":
 executer_script_bash("bash_script_1.sh")

elif choix_bash == "2":
 executer_script_bash("bash_script_2.sh")

elif choix_bash == "3":
 break

else :
 print("Choix invalide. Veuillez sélectionner une option valide.")

elif choix_principal == "2":
 while True:
  install_menu()
  choix_commande = input("Sélectionnez une commande prédéfinie : ")

if choix_commande == "1":
 executer_commande_terminal("sudo apt update && apt upgrade -y && apt install git")

elif choix_commande == "2":
 executer_commande_terminal("commande_2")

elif choix_commande == "3":
 break

else :
 print("Choix invalide. Veuillez sélectionner une option valide.")

elif choix_principal == "3":
 print("bye !")
 break

else :
 print("Choix invalide. Veuillez sélectionner une option valide.")

if __name__ == "__main__":
 main()
 
 