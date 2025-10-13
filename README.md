# 🧭 UHA–Hubble Tension SSOT

**Version:** 1.0 (Canonical)
**Purpose:** Encode, analyze, and verify the Hubble tension in UHA space.
**Primary Language:** Python 3.11+

## Overview

This is the Single Source of Truth (SSOT) implementation for analyzing the Hubble tension using Universal Horizon Address (UHA) coordinates. The framework provides cosmology-portable encoding and frame-agnostic tension analysis.

## Directory Structure

```
uha-hubble-ssot/
│
├── data_raw/                     # Unaltered source data (immutable)
│   ├── planck.csv
│   ├── sh0es.csv
│   ├── trgb.csv
│   └── tdcosmo.csv
│
├── data_encoded/                 # UHA outputs
│   ├── uha_records.json
│   ├── uha_binary_records.uha
│   └── uha_metadata.json
│
├── analysis/                     # Results and derived products
│   ├── tension_geometry.csv
│   ├── cross_cosmo_invariance.csv
│   ├── systematic_targets.json
│   └── diagnostics/
│       ├── uha_tension_map.png
│       ├── residual_histogram.png
│       └── vector_field.vtk
│
├── src/                          # Source code
│   ├── __init__.py
│   ├── constants.py              # c, f21, unit definitions
│   ├── cosmology.py              # H(a) and R_H(a) integrators
│   ├── morton.py                 # 3D→1D Morton encoder/decoder
│   ├── encode_uha.py             # core UHA constructor
│   ├── decode_uha.py             # binary parser / CRC checks
│   ├── tension_geometry.py       # ΔA computation & mean vector
│   ├── invariance_test.py        # cross-cosmology ξ validation
│   ├── systematic_localization.py# residual localization
│   └── visualization.py          # mapping, plotting, and exports
│
├── notebooks/                    # Jupyter analysis
│   ├── 01_encode_probes.ipynb
│   ├── 02_compute_tension.ipynb
│   ├── 03_validate_invariance.ipynb
│   ├── 04_systematic_localization.ipynb
│   └── 05_visualization.ipynb
│
├── tests/                        # Unit & regression tests
│   ├── test_morton.py
│   ├── test_cosmology.py
│   ├── test_encode_decode.py
│   └── test_invariance.py
│
├── manifests/
│   ├── uha_ssot_manifest.json    # Metadata + checksums
│   └── changelog.md
│
├── SAID/                         # Scientific Academic Integrity Disclosure
│   ├── README.md
│   ├── Scientific_Academic_Integrity_Disclosure.md
│   ├── edm.guardrails_live.json
│   └── sync_said_to_all_repos.sh
│
├── scripts/
│   ├── run_all.sh                # End-to-end pipeline executor
│   ├── verify_crc.py
│   ├── regenerate_checksums.py
│   └── export_summary.py
│
├── LICENSE
├── README.md
└── requirements.txt
```

## Quick Start

### Installation

```bash
# Clone or navigate to repository
cd /run/media/root/OP01/got/uha_hubble

# Install dependencies
pip install -r requirements.txt
```

### Running the Pipeline

```bash
# Execute complete pipeline
./scripts/run_all.sh

# Expected runtime: ~5-10 minutes
```

## Core Components

### 1. UHA Encoding
Converts H₀ measurements to Universal Horizon Address format:
```
A = (a, ξ, û, CosmoID; anchors)
```

### 2. Tension Geometry
Computes geometric separation in UHA space:
```
ΔA = ||A_early - A_late||
```

### 3. Invariance Testing
Validates that horizon-normalized position ξ is cosmology-portable:
```
|Δξ| < 1×10⁻⁸ across different priors
```

### 4. Systematic Localization
Identifies spatial regions (in Mpc) where systematics may be localized.

## Governance Rules

1. **Raw data:** Never edited after ingestion
2. **All code:** Version-controlled with hash validation
3. **Every result:** Traceable back to manifest and checksum
4. **Rebuilds:** Must regenerate CRCs and SHA-256 before archiving
5. **SAID Compliance:** All AI-assisted work follows Scientific Academic Integrity Disclosure protocols (see `SAID/` directory)

## Success Criteria

- ✅ All probes encoded → `uha_records.json`
- ✅ `cross_cosmo_invariance.csv`: |Δξ| < 1×10⁻⁸
- ✅ `systematic_targets.json`: identifies 503 ± 50 kpc radius
- ✅ `uha_tension_map.png`: shows 7.64% horizon-scale feature
- ✅ Manifest checksum verification passes

## Data Sources

- **Planck 2018:** CMB-based H₀ measurement
- **SH0ES 2022:** Distance ladder calibration
- **TRGB:** Tip of the Red Giant Branch measurements
- **TDCOSMO:** Time-delay cosmography

## Output Products

### 1. UHA Records (JSON)
```json
{
  "probe_id": "Planck2018",
  "a": 1.0,
  "xi": 0.000421,
  "direction": [1.0, 0.0, 0.0],
  "CosmoID": {...},
  "anchors": {"c": 299792.458, "f21": 1420.405751768}
}
```

### 2. Tension Geometry (CSV)
```
probe_pair,delta_a,delta_xi,delta_theta,geometric_separation
Planck-SH0ES,0.0,4.21e-4,0.0,7.64%
```

### 3. Systematic Targets (JSON)
```json
{
  "localization_radius_kpc": 503,
  "confidence_interval": [450, 550],
  "candidate_regions": [...]
}
```

## Testing

```bash
# Run unit tests
pytest tests/

# Run specific test
pytest tests/test_morton.py -v
```

## Scientific Integrity

This project follows the **SAID** (Scientific Academic Integrity Disclosure) framework. All AI-assisted contributions are documented with:
- Explicit guardrails preventing fabrication
- Reproducible, deterministic outputs
- Verifiable sources and provenance
- Transparent methodology

See `SAID/Scientific_Academic_Integrity_Disclosure.md` for full details.

## Contributing

This is a canonical SSOT implementation. Changes must:
1. Update manifest version
2. Pass all existing tests
3. Regenerate checksums
4. Update changelog
5. Comply with SAID protocols (if AI-assisted)

## License

[To be determined]

## Authors

- Eric (Principal Investigator)

## Version History

See `manifests/changelog.md`

---

**Status:** Initial setup complete
**Last Updated:** October 13, 2025
