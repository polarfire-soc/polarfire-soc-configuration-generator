@ECHO OFF
ECHO generate header files for Embedded software project
ECHO pfsoc-baremetal-software-cfg-gen.py
set xml_file=ref_xml/pf_soc_hw_description_reference.xml
py -3 pfsoc_baremetal_software_cfg_gen.py %xml_file%