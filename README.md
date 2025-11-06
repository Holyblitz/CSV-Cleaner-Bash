# CSV-Cleaner-Bash

Un script Bash modulaire pour nettoyer vos fichiers CSV rapidement :
- Suppression des doublons et lignes vides
- Normalisation des espaces, minuscules et séparateurs
- Mode `--INPLACE` pour écraser le fichier original
- Option `--STAT` pour afficher les changements avant/après

## 🚀 Exemple d’utilisation

```bash
bash clean_csv.sh data/exemple.csv --UNBLANK --DEDUP --TRIM --NORMALIZE --SEP "," --STAT
```

Auteur : Romain — 2025
Licence : MIT
