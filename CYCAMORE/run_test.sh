set -x
set -e
export DYLD_LIBRARY_PATH=`pwd`/install/lib:$DYLD_LIBRARY_PATH



if  [[ "${_NMI_TASKNAME}" == CYCAMORE* ]]
then
    if [ -e install/cyclus/bin/CycamoreUnitTestDriver ]
    then
    install/cycamore/bin/CycamoreUnitTestDriver --gtest_filter=`echo ${_NMI_TASKNAME} | sed -e 's/__/\//g' | sed -e 's/CYCAMORE.//g'`
    else
    install/bin/CycamoreUnitTestDriver --gtest_filter=`echo ${_NMI_TASKNAME} | sed -e 's/__/\//g' | sed -e 's/CYCAMORE.//g'`
    fi
else
    if [ -e install/cyclus/bin/CyclusUnitTestDriver ]
    then
    install/cyclus/bin/CyclusUnitTestDriver --gtest_filter=`echo ${_NMI_TASKNAME} | sed -e 's/__/\//g' | sed -e 's/CYCLUS.//g'`
    else
    install/bin/CyclusUnitTestDriver --gtest_filter=`echo ${_NMI_TASKNAME} | sed -e 's/__/\//g' | sed -e 's/CYCLUS.//g'`
    fi
fi



exit $?
