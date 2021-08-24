## instructions for conda install
this conda environment is remote (not in $HOME), is the env to use once you've gather your repeat-masked genome (via repeat_annotation env) and relevant protein database (edited bacillariophyta proteins.faa from phycocosm)

## create env
in base, install mamba
```
conda install -c conda-forge mamba
```

now create env
```
mamba create --prefix /gpfs/home/ibishop/data/ibishop/condas/braker2
```

next, install packages via yml file
```
mamba env update --prefix /gpfs/home/ibishop/data/ibishop/condas/braker2 --file my_braker2_environment.yml
```

check if braker2.pl is working, you should see help options
```
conda activate /gpfs/home/ibishop/data/ibishop/condas/braker2
braker.pl -h
```



## install genemark

find a good place for it
```
cd ~/data/software
mkdir genemark
cd genemark
```

get files from http://exon.gatech.edu/GeneMark/license_download.cgi
```
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_f4y2e/gm_key_64.gz
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_f4y2e/gmes_linux_64.tar.gz
```

decompress and move key to $HOME
```
gunzip gm_key_64.gz
mv gm_key_64 ~/.gm_key
```

decompress and fix perl path
```
gunzip gmes_linux_64.tar.gz
tar -xvf gmes_linux_64.tar

cd gmes_linux_64

#get missing script from: https://gitlab.univ-lille.fr/mathieu.genete/ngsgenotyp/-/tree/master/TOOLS/quast-4.5/quast_libs/genemark-es/linux_64
wget https://gitlab.cs.washington.edu/chenfs/CSE_428/-/raw/4d3eb11b4e5560b502669c4d51ca91d55a4b5b29/lib/quast-4.0/libs/genemark-es/linux_64/hmm_to_gtf.pl?inline=false
mv hmm_to_gtf.pl?inline=false hmm_to_gtf.pl
chmod u+x hmm_to_gtf.pl
perl change_path_in_perl_scripts.pl "/gpfs/home/ibishop/data/ibishop/condas/braker2/bin/perl"
```
