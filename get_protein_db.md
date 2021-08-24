get proteins.faa from phycocosm (bacillariophyta lineage)

combine all .faa into single .faa file
```
cat */.faa > phyco_proteins.faa
```

fix weird characters in header and proteins
```
sed 's/|/_/g' phyco_proteins > phyco_proteins_tmp1.faa
sed 's/*//g' phyco_proteins_tmp1.faa > phyco_proteins_fixed.faa
```
