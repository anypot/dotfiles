#!/bin/zsh

usage () {

	printf "\nchangeTheme.sh\n"
	printf "\t-c colorscheme\n"
	printf "\t-b background : light ou dark (par défaut)\n"
	printf "\t-f font\n"
	printf "\t-h to show help\n"

}

changeXresources () {

	printf "\nModification du fichier ~/.Xresources\n"

	BASE16XR="$HOME/.colors/base16-xresources/xresources/base16-${1}-${2}.Xresources"

	if [ -f $BASE16XR ]
	then
		printf "\tLe fichier $BASE16XR existe\n"

		sed -i 's/^#include.*/#include "'$(echo $BASE16XR | sed -e 's/[\/&]/\\&/g')'"/' ~/.Xresources

		if [ $? -eq 0 ]
		then
			printf "\t#include modifié\n"
		else
			printf "\tEchec du #include\n"
			exit 1
		fi

		printf "\nMise à jour de la base des ressources Xorg\n"

		xrdb -merge ~/.Xresources

		if [ $? -eq 0 ]
		then
			printf "\tRéussite\n"
		else
			printf "\tEchec\n"
			exit 1
		fi
	else
		printf "\tLe fichier $BASE16XR n'existe pas !\n"
		exit 1
	fi

}

changeZshrc () {

	printf "\nModification du fichier ~/.zshrc\n"

	if [ ${2} = "light" ]
	then
		BASE16SHELL=".colors/base16-shell/scripts/base16-${1}.sh"
	else
		BASE16SHELL=".colors/base16-shell/scripts/base16-${1}-${2}.sh"
	fi

	if [ -f $HOME/$BASE16SHELL ]
	then
		printf "\tLe fichier $HOME/$BASE16SHELL existe\n"

		sed -i 's/^BASE16_SHELL=.*/BASE16_SHELL="$HOME\/'$(echo $BASE16SHELL | sed -e 's/[\/&]/\\&/g')'"/' ~/.zshrc

		if [ $? -eq 0 ]
		then
			printf "\tVariable BASE16_SHELL modifiée\n"
		else
			printf "\tEchec de la modification de la variable BASE16_SHELL\n"
			exit 1
		fi

		printf "\nRechargement des options zsh\n"

		source ~/.zshrc

		if [ $? -eq 0 ]
		then
			printf "\tRéussite\n"
		else
			printf "\tEchec\n"
			exit 1
		fi
	else
		printf "\tLe fichier $HOME/$BASE16SHELL n'existe pas !\n"
		exit 1
	fi

}

changeVim () {

	printf "\nModification du fichier ~/.vimrc\n"

	sed -i 's/^set background=.*/set background='${2}'/' ~/.vimrc

	if [ $? -eq 0 ]
	then
		printf "\tBackground modifié\n"
	else
		printf "\tEchec de la modification du background\n"
		exit 1
	fi

	sed -i 's/^colorscheme.*/colorscheme base16-'${1}'/' ~/.vimrc
	
	if [ $? -eq 0 ]
	then
		printf "\tColorscheme modifié\n"
	else
		printf "\tEchec de la modification du colorscheme\n"
		exit 1
	fi

}

while getopts ":c:b:f:h" OPTION
do
	case $OPTION in
		c)
			COLOR=$OPTARG
			;;
		b)
			BACKGROUND=$OPTARG
			;;
		f)
			FONT=$OPTARG
			;;
		h)
			usage
			exit $?
			;;
		:)
			printf "\nL'option -$OPTARG requiert un argument\n"
			usage
			exit 1
			;;
		\?)
			printf "\n$OPTARG : option invalide\n"
			usage
			exit 1
			;;
	esac
done

if [[ -z "$BACKGROUND" ]]
then
	printf "\nBackground forcé à dark par défaut\n"
	BACKGROUND="dark"
else
	if [ $BACKGROUND != "dark" ] && [ $BACKGROUND != "light" ]
	then
		printf "\nL'option -b ne prend pas en compte $BACKGROUND comme argument\n"
		usage
		exit 1
	fi
fi

changeXresources $COLOR $BACKGROUND

changeZshrc $COLOR $BACKGROUND

changeVim $COLOR $BACKGROUND

exit 0
