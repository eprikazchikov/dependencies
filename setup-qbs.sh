if [ "$CXX" == "" ]
then
    CXX=g++
fi

git clone --depth 1 -b v1.12.2 git://code.qt.io/qbs/qbs.git qbs-build
pushd qbs-build
qmake -r qbs.pro QMAKE_CXX=$CXX QMAKE_LINK=$CXX \
                 "CONFIG+=qbs_no_dev_install qbs_no_man_install" \
                 && make
make install INSTALL_ROOT=../qbs
export PATH=$PATH:$PWD/bin
popd
