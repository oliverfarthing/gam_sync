cd "c:\gamadv-xtd3"
del /s "c:\gamsync\*syncvalidation.csv"
gam print group-members group "everyone@domain.com" > c:\gamsync\(domain)syncvalidation.csv
