#!/bin/bash

function header() {
    echo '{
    "group": {
        "hosts": [
'
}

function dynamicContent() {
    result=`docker ps --filter "label=vm" --format "\"{{.Names}}\","`
    echo ${result::-1}
}

function staticContent() {
    echo '"vm1","vm2"'
}

function footer() {
    echo '
        ],
        "vars": {
            "ansible_ssh_user": "root",
            "ansible_ssh_private_key_file": "~/.ssh/id_rsa",
            "ansible_ssh_common_args": "-o StrictHostKeyChecking=no"
        }
    }
    }'    
}

header
dynamicContent
#staticContent
footer