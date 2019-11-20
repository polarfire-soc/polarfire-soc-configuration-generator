@ECHO OFF
ECHO generate header files for Embedded software project
ECHO mpfs_configuration_generator.py
set xml_file=ref_xml/mpfs_hw_description_reference.xml
py -3 mpfs_configuration_generator.py %xml_file%
