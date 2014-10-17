
if [ $# -eq 2 ]; then
    CONF=/vagrant/gustavus/${2}/configs/vm-mom-config.gradle
elif [ $# -eq 1 ]; then
    CONF=/vagrant/gustavus/configs/vm-mom-config.gradle
else 
    echo "Usage: sh dse.sh URN"
    exit
fi


echo Verifying from configuration in ${CONF}

cd /vagrant/hmt-mom

echo Using MOM clone in `pwd`
echo "Cleaning previous HMT MOM results..."
gradle clean

echo Beginning verification for folio $1 using CONF in $CONF

gradle -Pfolio=$1 -Pconf=${CONF} dse

