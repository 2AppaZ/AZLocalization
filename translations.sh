#!/bin/bash
#Call with "sh translations.sh IOS" or "sh translations.sh ANDROID"

FOLDER_IOS='Resources'
FOLDER_ANDROID='app/src/main/res'

#Google Spreedsheet id
DOCUMENT_ID=""

COLUMN_OFFSET=3
LINE_OFFSET=3

## Start of Script DO NOT CHANGE

START=$(date +%s)
EXPORT=`curl 'https://docs.google.com/spreadsheets/export?format=tsv&id='"$DOCUMENT_ID" 2> /dev/null`
echo "Translations downloaded"

function getAllLanguages() {

    ARG1=${1:-IOS}

    LINE=2
    if [ $ARG1 = "ANDROID" ]
    then
        LINE=3
    fi

IFS=""
    LANGUAGES=`echo $EXPORT | head -n $LINE | tail -1 | tr -s $'\t' "\n"`
IFS="
"
    
    COLUMN=0
    for VALUE in ${LANGUAGES}
    do
        #remove \r from value, specially for the last one
        VALUE=${VALUE//$'\r'/""}
        
        if [ $COLUMN -ge 1 ]
        then
            if [ $ARG1 = "ANDROID" ]
            then
                generateLanguageAndroid $COLUMN $VALUE &
            else
                generateLanguage $COLUMN $VALUE &
            fi
        fi
        
        let "COLUMN = ${COLUMN} + 1"
    done
    
    wait
    
    END=$(date +%s)
    DIFF=$(( $END - $START ))
    
    echo "Done in $DIFF seconds"
}

function generateLanguage() {
    let "TMP_FIELD = $1 + $COLUMN_OFFSET"
    
    FOLDER=$FOLDER_IOS'/'$2'.lproj'
    
    if [ ! -d "$FOLDER" ]; then
        echo "Error : $FOLDER do not exists"
        return
    fi

    FILE=$FOLDER'/Localizable.strings'
    
    echo "Update $FILE"

    echo "// $2" > $FILE

    declare -a TRADS
    
    COUNTER=0
    for LINE in ${EXPORT}
    do
        if [ $COUNTER -ge $LINE_OFFSET ]
        then
            KEY=`echo ${LINE} | cut -d $'\t' -f 1`
            SCREEN=`echo ${LINE} | cut -d $'\t' -f 2`
            COMMENT=`echo ${LINE} | cut -d $'\t' -f 3`
            VALUE=`echo ${LINE} | cut -d $'\t' -f ${TMP_FIELD} | tr -d '\r'`
            
            #Set ID_LINE_NUMBER for all empty strings
            if [ -z "${VALUE-}" ]
            then
                VALUE="ID_$COUNTER"
            fi
            
            #Escape ' with \'
            VALUE=${VALUE//"'"/"\'"}
            
            #Escape quote " with '"'
            echo '"'$KEY'"' = '"'$VALUE'";' >> $FILE
        fi

        let "COUNTER = ${COUNTER} + 1"
    done
}

function generateLanguageAndroid() {
    let "TMP_FIELD = $1 + $COLUMN_OFFSET"
    
    if [ $2 = 'en' ]
    then
        FOLDER_NAME=''
    else
        FOLDER_NAME="-$2"
    fi
    
    FOLDER=$FOLDER_ANDROID'/values'$FOLDER_NAME
    if [ ! -d "$FOLDER" ]; then
        mkdir $FOLDER
        echo "Create $FOLDER"
    fi

    FILE=$FOLDER'/strings.xml'
    
    echo "Update $FILE"

    echo "<resources>" > $FILE

    declare -a TRADS
    
    COUNTER=0
    for LINE in ${EXPORT}
    do
        if [ $COUNTER -ge $LINE_OFFSET ]
        then
   
            KEY=`echo ${LINE} | cut -d $'\t' -f 1`
            SCREEN=`echo ${LINE} | cut -d $'\t' -f 2`
            COMMENT=`echo ${LINE} | cut -d $'\t' -f 3`
            VALUE=`echo ${LINE} | cut -d $'\t' -f ${TMP_FIELD} | tr -d '\r'`
            
            #Set ID_LINE_NUMBER for all empty strings
            if [ -z "${VALUE-}" ]
            then
                VALUE="ID_$COUNTER"
            fi
            
            #Escape ' with \'
            VALUE=${VALUE//"'"/"\'"}
            
            #Convert iOS strings variable to android
            VALUE=${VALUE//'%1$@'/'%1$s'}
            VALUE=${VALUE//'%2$@'/'%2$s'}
            VALUE=${VALUE//'%3$@'/'%3$s'}
            VALUE=${VALUE//'%@'/'%1$s'}
            VALUE=${VALUE//'%@'/'%2$s'}
            VALUE=${VALUE//'%@'/'%3$s'}
            VALUE=${VALUE//'%@'/'%4$s'}
            VALUE=${VALUE//'%@'/'%5$s'}
            VALUE=${VALUE//'%@'/'%6$s'}
            VALUE=${VALUE//'%@'/'%7$s'}
            VALUE=${VALUE//'%@'/'%8$s'}
            VALUE=${VALUE//'%@'/'%9$s'}
            
            #Escape quote " with '"'
            echo $'\t'"<string name="'"'$KEY'"'">$VALUE</string>" >> $FILE
        fi
        
#          if [ $COUNTER -gt 2 ]
#          then
#               break
#          fi

        let "COUNTER = ${COUNTER} + 1"
    done
    
    echo "</resources>" >> $FILE
}

getAllLanguages $1
