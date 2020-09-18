
# make sure to add the libaffy binaries to your path before hand

# download the "raw" data
#
# ArrayExpress has evidently corrupted the raw files through reading/writing
#  them through some internal database, so they aren't a valid Agilent raw
#  file format anymore.
#
# Not to worry, the latest version of my agilent_to_spreadsheet.pl
#  script can deal with this.
#
wget https://www.ebi.ac.uk/arrayexpress/files/E-TABM-337/E-TABM-337.raw.1.zip
wget https://www.ebi.ac.uk/arrayexpress/files/E-TABM-337/E-TABM-337.raw.2.zip

# decompress the "raw" data from the zip archives
#
mkdir raw_arrayexpress
cd raw_arrayexpress
unzip ../E-TABM-337.raw.1.zip
unzip ../E-TABM-337.raw.2.zip
cd ..

# extract local background subtracted signal intensities
# output a row=probe col=sample 2D spreadsheet
# up-shift entire array so that no bg-subtracted abundances are <=0
# automatically detect bad spots (caused by flecks of dust) and set to zero
#
# there are no bad spots that can be automatically detected in this dataset
# however, there are a few outliers that are obvious in scatterplots that
#  just missed the very leniant automatic bad spot cutoff
# these outlier almost-bad spots will be bg-corrected to near-zero later
#
agilent_to_spreadsheet.pl raw_arrayexpress/US*.txt > agilent_abundances.txt

# strip out the long bits of the file names that I know to be unchanging
# this will cause them to not align with metadata identifiers, but you can
#  always strip the metadata identifiers in a similar fashion later
#
# if we didn't, then it would be difficult to read them when plotting, etc.
#
sed -i 's/US22502547_//g' agilent_abundances.txt
sed -i 's/_S01_GE2-SSPE_85_2x11k_1//g' agilent_abundances.txt

# only do background subtraction, so you can make plots to see how
# background subtraction affected the signals
iron_generic --norm-none agilent_abundances.txt -o iron_agilent_bg-only.txt

# find median sample
findmedian --spreadsheet agilent_abundances.txt > findmedian_agilent.txt

# parse the median sample (251382210054_2_cy3) from the findmedian output
MEDIAN=$(tail -2 findmedian_agilent.txt | head -1 | cut -f 4)

# normalize against the median sample using microarray defaults (default)
iron_generic --norm-iron="$MEDIAN" agilent_abundances.txt -o iron_agilent_normalized.txt

# use quantile normalization for comparision to IRON
iron_generic --norm-quantile agilent_abundances.txt -o iron_agilent_quantile.txt
