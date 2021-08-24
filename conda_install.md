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

get files

download hmm_to* file
chmod it

change perl path
