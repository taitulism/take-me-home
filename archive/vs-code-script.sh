# Moved out from .bashrc:


# vs-code stuff
vs_code_User_path=~/.config/Code/User
if [ -d "$vs_code_User_path" ] ; then
    logInfo '* Symlink vs-code stuff'

    # keybindings & settings
    ln -sf $PWD/vs-code/keybindings.json $vs_code_User_path/keybindings.json 
    ln -sf $PWD/vs-code/settings.json $vs_code_User_path/settings.json 

    # create vs-code snippets dir if not exists
    if [ ! -d "$vs_code_User_path/snippets" ] ; then
        mkdir $vs_code_User_path/snippets
    fi

    # snippets
    ln -sf $PWD/vs-code/snippets/html.json $vs_code_User_path/snippets/html.json
    ln -sf $PWD/vs-code/snippets/javascript.json $vs_code_User_path/snippets/javascript.json
else
    logWarn 'vs-code directory is not found: $vs_code_User_path'
fi
unset vs_code_User_path