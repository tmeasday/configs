# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If running interactively, then:
if [ "$PS1" ]; then
    # enable color support of ls and also add handy aliases
    alias ls='ls -G'

    alias vi='vim'

    # set a fancy prompt
    #PS1='\u@\h:\w\$ '

    # 30 - grey, 31 - red, 32 - green, 33 - yellow, 34 - blue,
    # 35 - magenta (pink), 36 - cyan
    HOST=`hostname -s`
    case ${HOST} in
      kofi|idi|javier|indira)
        HOST_COLOUR='1;34m' # green
        ;;
      boutros|adlai)
        HOST_COLOUR='1;31m' # red
        ;;
      mungee|murree|queeg|holly|rimmer|toaster|charikar|cat|elara)
        HOST_COLOUR='1;30m' # grey
        ;;
      *)
        HOST_COLOUR='1;35m' # pink
        ;;
    esac
    
    HOST_PART='\[\033['${HOST_COLOUR}'\]\h'
    
    case ${HOST} in
      simba|nala)
      HOST_PART='🐆 '
    esac
    
    USER_COLOUR='1;34m' # blue
    if [ ${USER} == 'root' ]; then
      USER_COLOUR='1;31m' # red
    fi
    USER_PART='\[\033['${USER_COLOUR}'\]\u'
      
    # Show lots of info in the __git_ps1 output.
    # Thanks for the info @mathie.
    export GIT_PS1_SHOWDIRTYSTATE="true"
    export GIT_PS1_SHOWSTASHSTATE="true"
    export GIT_PS1_SHOWUNTRACKEDFILES="true"
    . /usr/local/etc/bash_completion.d/git-completion.bash 
    . /usr/local/etc/bash_completion.d/git-prompt.sh 
  
  
  
    case ${TERM} in
      vt100)
        export PS1="[\u@\h \W] \T \\$ "
        ;;
      *)
        export PS1=$USER_PART'@'$HOST_PART' \
\[\033[01;34m\]\W\[\033[00m\] $(__git_ps1 "\[\033[01;33m\](%s)\[\033[00m\]") \$ '
        ;;
    esac

	if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
	fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

complete -C aws_completer aws

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export GREP_OPTIONS="$GREP_OPTIONS --color"

export EDITOR="mate --wait"

PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH:/usr/local/mysql/bin:/usr/texbin:/usr/local/share/npm/bin
NODE_PATH=/usr/local/lib/node_modules
#eval "$(rbenv init -)"

# for aws
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

#ANDROID
# export ANT_HOME=$HOME/Documents/dev/java/apache-ant-1.9.4
# export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_SDK_HOME=/Applications/adt-bundle/sdk
export PATH="$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/build-tools/21.0.0:$ANDROID_SDK_HOME/platform-tools:$PATH"
 #:$ANT_HOME/bin" # Add Android tools to the path
#-ANDROID

#METEOR
export USE_GLOBAL_ADK=t
#-METEOR

alias 'format_json=python -mjson.tool'
alias 'http_server=python -mSimpleHTTPServer'
alias meteor0=$HOME/.meteor0/meteor
eval "$(hub alias -s)"

ssh-add 2> /dev/null

fi
