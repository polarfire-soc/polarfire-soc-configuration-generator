##!/usr/bin/bash
@ECHO OFF
ECHO generate header files for Embedded software project
ECHO pfsoc_baremetal_software_cfg_gen.py
set xml_file=ref_xml/pf_soc_hw_description_reference.xml
python3 pfsoc_baremetal_software_cfg_gen.py ref_xml/pf_soc_hw_description_reference.xml