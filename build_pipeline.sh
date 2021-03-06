if [[ ! -f src/alphafamimpute/tinyhouse/Pedigree.py ]] ; then
    echo Pedigree.py file not found. Check that the tinyhouse submodule is up to date
    exit 
fi

# Create python wheel.
rm -r build
rm -r dist
python setup.py bdist_wheel

#Compile manual
 ( cd docs; make latexpdf )


target=AlphaFamImpute
rm -rf $target
mkdir $target

# Moves the wheel over
cp dist/* $target 

# Moves the manual over
cp docs/build/latex/AlphaFamImpute.pdf $target 

# Move the examples over
cp -r example/* $target 
chmod 770 $target/run_examples.sh

cp MIT_License.txt $target


rm AlphaFamImpute.zip
zip -r $target.zip AlphaFamImpute

