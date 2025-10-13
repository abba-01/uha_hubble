#!/bin/bash
set -e

echo "=== UHA–Hubble Tension SSOT Pipeline ==="

python3 src/encode_uha.py
python3 src/tension_geometry.py
python3 src/invariance_test.py
python3 src/systematic_localization.py
python3 src/visualization.py

python3 scripts/regenerate_checksums.py
echo "Pipeline completed successfully."
