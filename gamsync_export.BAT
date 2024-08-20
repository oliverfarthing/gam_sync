REM Change directory to gamadv-xtd3
cd "C:\gamadv-xtd3"

REM Define the CSV file paths
set domain_add=C:\gamsync\domain_additionsync.csv
set domain_subtract=C:\gamsync\domain_subtractionsync.csv

REM Update group memberships
gam csv %domain_add% gam update group "everyone@domain.com" add member "~primaryEmail"
gam csv %domain_subtract% gam update group "everyone@domain.com" remove member "~primaryEmail"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
