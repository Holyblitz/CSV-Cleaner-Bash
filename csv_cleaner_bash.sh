#!/usr/bin/bash
set -euo pipefail

usage () {
	cat << EOF
Usage: $0 FICHIER.csv [OPTIONS]

Options :
  --UNBLANK        Supprime les lignes vides
  --DEDUP          Supprime les lignes dupliquées (hors en-tête)
  --TRIM           Supprime les espaces en début et en fin de champ
  --NORMALIZE      Normalise le texte (ex: minuscules)
  --SEP ';'        Définit le séparateur de champs (ex: "," ou ";")
  --STAT           Afficher les changements avant->Après
  --INPLACE        Ecrase le fichier de départ, sinon un fichier_clean est créé
  -o, --output F   Sortie (sinon suffixe nom_du_fichier+_clean.csv)
  -h, --help       Affiche cette aide

Exemples :
  $0 data.csv --UNBLANK --TRIM
  $0 data.csv --UNBLANK --DEDUP --TRIM --NORMALIZE --SEP --STAT --INPLACE
  $0 data.csv --UNBLANK --DEDUP --INPLACE
  $0 data.csv --SEP "," 
EOF
}

UNBLANK=false
DEDUP=false
TRIM=false
NORMALIZE=false
STAT=false
INPLACE=false
SEP=","
OUTPUT=""

INPUT="$1"
shift

while [[ $# -gt 0 ]]; do
  case "$1" in
    --UNBLANK)   UNBLANK=TRUE; SHIFT ;;
    --DEDUP)     DEDUP=true; shift ;;
    --TRIM)      TRIM=true; shift ;;
    --NORMALIZE) NORMALIZE=true; shift ;;
    --SEP)       
      SEP="$2"
      shift 2
      ;;
    --STAT)      STAT=true; shift ;;
    --INPLACE)   INPLACE=true; shift ;;
    -o|+-output)
      OUTPUT="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Option inconnue: $1" >&2
      usage
      exit 1
      ;;
  esac
done
