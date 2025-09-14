#	██╗   ██╗ █████╗ ██████╗ ██╗ █████╗ ██████╗ ██╗     ███████╗███████╗
#	██║   ██║██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝
#	██║   ██║███████║██████╔╝██║███████║██████╔╝██║     █████╗  ███████╗
#	╚██╗ ██╔╝██╔══██║██╔══██╗██║██╔══██║██╔══██╗██║     ██╔══╝  ╚════██║
#	 ╚████╔╝ ██║  ██║██║  ██║██║██║  ██║██████╔╝███████╗███████╗███████║
#	  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚══════╝


#============================
#                           |
#    <<LOCAL VARIABLES>>    |
#                           |
#============================

#	<<RUNTIME VARIABLES>>
#===================================
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

#	<<FLAGS>>
# !! Do not change those varriables !!
startup_flag=$((startup_flag+1))
silent_update=$((silent_update+0))

#	<<USER VARIABLES>>
#================================
user=${USER}
username="Claudiu Ghit"
email="ghit.claudiu96@gmail.com"

#	<<FILE VARIABLES>>
#================================
current_file=${BASH_SOURCE}

#	<<FOLDER VARIABLES>>
#==================================
home="/home/$user"
repos="$home/REPOS"

#	<<INFO NOTE>>
# !! Use variables to change colors in functions !!

#color codes:
# 30m -- black  34m -- blue
# 31m -- red    35m -- magenta
# 32m -- green  36m -- light-blue
# 33m -- yellow 37m -- white

#	<<COLOR VARIABLES>>
#=================================
black=`		tput setaf 0`
red=`		tput setaf 1`
green=`		tput setaf 2`
yellow=`	tput setaf 3`
blue=`		tput setaf 4`
magenta=`	tput setaf 5`
lblue=`		tput setaf 6`
white=`		tput setaf 7`
reset=`		tput sgr0`



# 	 █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
#	██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
#	███████║██║     ██║███████║███████╗█████╗  ███████╗
#	██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
#	██║  ██║███████╗██║██║  ██║███████║███████╗███████║
#	╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝


#========================
#                       |
#   <<BASIC ALIASES>>   |
#                       |
#========================

#	<<COLOR ALIASES>>
#================================
alias black="	tput setaf 0"
alias red="		tput setaf 1"
alias green="	tput setaf 2"
alias yellow="	tput setaf 3"
alias blue="	tput setaf 4"
alias lblue="	tput setaf 6"
alias white="	tput setaf 7"
alias reset="	tput sgr0"

#	<<BASHRC ALIASES>>
#================================
alias bashrc="echo -e '\nContents of Bashrc:\n'&&sed -n '1,$ p' ~/.bashrc&&echo -e '\nEnd of bashrc. Scroll up to view contents\n'"   # print bashrc
alias bashrc_edit="nano ~/.bashrc"                                                                                                    # edit bashrc
alias bashrc_run="source ~/.bashrc&&echo '${green}Bashrc run command successful! No syntax errors.${reset}'&&echo "                   # run bashrc
alias bashrc_run_silent="source ~/.bashrc"                                                                                            # run bashrc without no prints
alias bashrc_save="sed -n '1,$ p' ~/.bashrc > /home/$user/bashrc.txt&&echo '${green}Basrch backup saved at /home/$user${reset}'"      # save a copy of the file in the home directory

#	<<FOLDER ALIASES>>
#================================

#	<<REPOSITORY FOLDER ALIASES>>
#===========================================


#========================
#                       |
#    <<GIT ALIASES>>    |
#                       |
#========================

#	<<GIT>>
#================================
alias git_set="git config --global user.name '$username'&&git config --global user.email '$email'"      # sets git username and email
alias git_info="git config --global user.name&&git config --global user.email"                          # check git username and email

#	<<GIT CLI>>
#================================
alias glist="gh repo list"
alias gclone="gh repo clone"
alias greate="gh repo create"



#	███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
#	██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
#	█████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
#	██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
#	██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
#	╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


#============================
#                           |
#    <<BASIC FUNCTIONS>>    |
#                           |
#============================

#	<<COPY FUNCTIONS>>
#================================
cptohome(){ cp -rf "$1" /home/$user&&echo copied \""$1"\" succesfully into home folder!;}                   # copy a file to home directory; $1 - file/folder
cpfromhome(){ cp -rf "/home/$user/$1" .&&echo copied \""$1"\" from home into current folder!;}              # copy a file from home diretory; $1 - file/folder
mvtohome(){ mv "$1" /home/$user&&echo moved succesfully \""$1"\" into home folder!;}                        # move a file to home directory; $1 - file/folder
mvfromhome(){ mv "/home/$user/$1" .&&echo moved \""$1"\" from home into current folder!;}                   # move a file from home directory; $1 - file/folder

#	<<GIT>>
#================================
parse_git_branch() {        # returns the git branch of the current folder
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#	<<PROMPT>>
#================================
change_prompt_color(){      # changes the color of the bash prompt
	export PS1="\[\e[$1\][\[\e[m\]\[\e[$1\]\u\[\e[m\]\[\e[$1\]@\[\e[m\]\[\e[$1\]\h\[\e[m\] \[\e[$1\]\W\[\e[m\] \[\e[$1\]\$(parse_git_branch)\[\e[m\]\[\e[$1\]]\[\e[m\]\[\e[$1\]\\$\[\e[m\]"
}


#===============================
#                              |
#   <<REPOSITORY FUNCTIONS>>   |
#                              |
#===============================

set_repo_about(){           # sets a text note in the repository
if(($1));
then
	cd "$1"&&echo $2>about.txt&&echo "Repository ${green}[[ ${PWD##*/} ]]${reset} about set to: \"${yellow}$2${reset}\""&&cd ..;
fi
}

repos(){                    # lists all repositories owned by the user
	echo ${green}"[Local repositories of user '$user']:"${white}
	for x in `ls -1 $repos`; do printf "\t%-40s %-40s\n" "Name: $x" "About: `cat $repos/$x/about.txt 2>/dev/null`"; done;
	echo ;
}


#	███████╗████████╗ █████╗ ██████╗ ████████╗██╗   ██╗██████╗      █████╗ ███╗   ██╗██████╗     ██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗
#	██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║   ██║██╔══██╗    ██╔══██╗████╗  ██║██╔══██╗    ██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
#	███████╗   ██║   ███████║██████╔╝   ██║   ██║   ██║██████╔╝    ███████║██╔██╗ ██║██║  ██║    ██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗
#	╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██║   ██║██╔═══╝     ██╔══██║██║╚██╗██║██║  ██║    ██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝
#	███████║   ██║   ██║  ██║██║  ██║   ██║   ╚██████╔╝██║         ██║  ██║██║ ╚████║██████╔╝    ╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗
#	╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝         ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝


#================================================
#      <<EXECUTED ON STARTUP AND UPDATE>>       |
#                                               |
#    !!!! should be kept here to avoid errors   |
#================================================

#	<<FUNCTIONS>>
#================================

Startup()    # EXECUTED ON STARTUP
{
	echo -e "${green}[Bashrc startup completed for host ${blue}`hostname`${green}]${reset}"&&repos;
	export PS1="[\u@\h \W \[\e[32m\]\$(parse_git_branch)\[\e[m\]]\\$ ";
}

Update()     # EXECUTED ON UPDATE
{
	if(($silent_update==1));
	then
		silent_update=0;
	else
		clear;
		echo -e "${green}[Bashrc update completed for host ${blue}`hostname`${green}]${reset}";
		export PS1="[\u@\h \W \[\e[32m\]\$(parse_git_branch)\[\e[m\]]\\$ ";
	fi
}

SilentUpdate(){
	silent_update=1
}

#	<<EXECUTED LINES>>
#================================
if(($startup_flag==1));     # RUNS EACH TIME BASHRC IS EXECUTED
then
	Startup;
else
	Update;
fi
