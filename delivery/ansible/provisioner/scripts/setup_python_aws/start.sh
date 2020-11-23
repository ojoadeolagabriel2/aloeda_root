############################################################
# Author  : adeola ojo
# The Why : simple script to fetch ansible ec2 instance facts
############################################################

export ANSIBLE_HOST_KEY_CHECKING=False

# ansible-galaxy collection install amazon.aws
FILES_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd ../../files && pwd )"
chmod 600 ${FILES_DIRECTORY}/default.pem

function _readRow() {
    echo $1 | base64 --decode
}

sample=`cat ./config.yml`
for row in $(echo "${sample}" | jq -r '.[] | @base64'); do
    _jq() {
         echo ${row} | base64 --decode | jq -r ${1}
        }
    ansible-playbook -vvv ./main.yml -i ./hosts -e "AWS_DOMAIN_PATH=$(_jq '.domain_path')"
done