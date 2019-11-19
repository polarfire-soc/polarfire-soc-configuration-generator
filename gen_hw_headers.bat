@ECHO OFF
ECHO generate header files for Embedded software project
ECHO mpfs-baremetal-software-cfg-gen.py
set xml_file=ref_xml/mpfs_hw_description_reference.xml
py -3 mpfs_baremetal_software_cfg_gen.py %xml_file%
