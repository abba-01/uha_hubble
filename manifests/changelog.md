# Changelog - UHA Hubble Tension SSOT

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.0.0] - 2025-10-13

### Added
- Initial directory structure for UHA-Hubble tension SSOT
- Core manifest file with project metadata
- README with comprehensive documentation
- requirements.txt with minimal dependencies
- run_all.sh pipeline automation script
- **SAID/ directory** - Scientific Academic Integrity Disclosure protocols
  - Scientific_Academic_Integrity_Disclosure.md (full framework documentation)
  - edm.guardrails_live.json (active guardrails)
  - guardrails_v1_2025.json (version-specific guardrails)
  - sync_said_to_all_repos.sh (auto-sync from master repository)
- Directory structure:
  - data_raw/ (immutable source data)
  - data_encoded/ (UHA outputs)
  - analysis/ (results and diagnostics)
  - src/ (source code)
  - notebooks/ (Jupyter analysis)
  - tests/ (unit tests)
  - manifests/ (metadata and checksums)
  - scripts/ (automation tools)
  - **SAID/** (integrity protocols)

### Governance
- Established immutability rule for raw data
- Required checksum validation before releases
- Traceability requirement for all results
- **SAID compliance** - All AI-assisted work follows Scientific Academic Integrity Disclosure protocols

### Success Criteria
- Defined |Δξ| < 1×10⁻⁸ for invariance validation
- Target: 503 ± 50 kpc systematic localization radius
- Expected: 7.64% horizon-scale tension feature

---

## Upcoming Work

### [1.1.0] - Planned
- [ ] Implement src/constants.py
- [ ] Implement src/cosmology.py (H(a) and R_H(a))
- [ ] Implement src/morton.py (3D Morton encoding)
- [ ] Implement src/encode_uha.py
- [ ] Create data_raw/ CSV templates

### [1.2.0] - Planned
- [ ] Implement src/decode_uha.py with CRC validation
- [ ] Implement src/tension_geometry.py
- [ ] Implement src/invariance_test.py
- [ ] Create test suite for core functions

### [1.3.0] - Planned
- [ ] Implement src/systematic_localization.py
- [ ] Implement src/visualization.py
- [ ] Create Jupyter notebooks
- [ ] Add scripts/verify_crc.py
- [ ] Add scripts/regenerate_checksums.py
- [ ] Add scripts/export_summary.py

### [2.0.0] - Future
- [ ] Full pipeline validation with real data
- [ ] Performance optimization
- [ ] Extended visualization suite
- [ ] Documentation expansion
- [ ] Publication-ready outputs
