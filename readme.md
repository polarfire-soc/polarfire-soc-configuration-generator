# PolarFire SoC Bare Metal Software Configuration Generator
Ths is a utility to generate embedded software header files from information supplied
by Libero from the Libero design. Libero supplies the information in the form 
of an xml file.

# Table of contents
1. [ Content ](#content)
2. [ Preparation ](#prep)
3. [ Steps to generate embedded software files ](#initial)
4. [ Integrate <hardware> into Embedded Software Project ](#Int)


## 1. Content <a name="content"></a>
PolarFire SoC Bare Metal Software Configuration Generator content

| File                                          | Description       |       
| :-------------------------------------------- |:------------------| 
| readme.md                                     | This file.        |
| pfsoc_baremetal_software_cfg_gen.py           | Python script. Takes .xml as arument, produces output for embedded software.|   
| gen_hw_headers.bat                            | Batch script for use on windows command line. Edit with the xml file you wish to use.|    
| gen_hw_headers_lin.sh                         | Bash script for use in Linux terminal. Edit with the xml file you wish to use.|    
| ref_xml/pf_soc_hw_description_reference.xml   | Example Libero .xml file. |    

~~~
   +---------+      +-----------+
   | root    +----->| ref_xml   +-->pf_soc_hw_description_reference.xml
   +---------+  |   +-----------+
                | +-----------------------------------------------+
                | | +-----------+         Output                  |
                +-|>| hardware  +-->Created header files          |
                | | +-----------+                                 |
                | +-----------------------------------------------+
                |
           readme.md
           pfsoc_baremetal_software_cfg_gen.py
           gen_hw_headers_lin.sh
           gen_hw_headers.bat
~~~

## 2. Preparation <a name="prep"></a>
Python must be present on the computer to run the PolarFire SoC Bare Metal Software Configuration Generator.
The Python script will run on Python version 2 or 3.
There is an example script for Linux called <gen_hw_headers_lin.sh>. If using or creating your own 
please make sure it is given permission to execute by running the following command 'chmod +x <scriptName.sh>'

## 3. Steps to generate embedded software files <a name="initial"></a>
Please follow the recommended steps
1. Copy the Libero generated or hand crafted xml file
2. Delete or rename the subdirectory <hardware> as it will be overwritten
3. Run the command <python pfsoc_baremetal_software_cfg_gen.py nameofxml.xml>
4. The subdirectory <hardware> will be created. 

#### Example generating from a command line in windows
~~~~
C:\mpfs-bare-metal-sw-config-generator\lib>py -3 pfsoc_baremetal_software_cfg_gen.py ref_xml/pf_soc_hw_description_reference.xml
generate header files for Embedded software project
pfsoc-baremetal-software-cfg-gen.py
python interpreter details: sys.version_info(major=3, minor=7, micro=4, releaselevel='final', serial=0)
python interpreter running is version 3
output header files created in hardware/ directory
C:\mpfs-bare-metal-sw-config-generator\lib>
~~~~

#### Example generating from a command line in Linux
~~~~
vagrant@ubuntu-xenial:/home/mpfs-bare-metal-sw-config-generator/lib$ python3 pfsoc_baremetal_software_cfg_gen.py ref_xml/pf_soc_hw_description_reference.xml
generate header files for Embedded software project
pfsoc_baremetal_software_cfg_gen.py
python interpreter details: sys.version_info(major=3, minor=5, micro=2, releaselevel='final', serial=0)
python interpreter running is version 3
output header files created in hardware/ directory
vagrant@ubuntu-xenial:/home/mpfs-bare-metal-sw-config-generator/lib$ 
~~~~

## 4. Integrate <hardware> folder into Embedded Software Project <a name="Int"></a>

Thsi sections describes how to integrate the <hardware> folder.

##### Example Project directory structure, showing where hardware folder sits.
~~~
   +---------+      +-----------+                      +---------+
   | src     +----->|application|                  +-->|hardware |
   +---------+  |   +-----------+                  |   +---------+
                |                                  |
                |   +-----------+                  |   +---------+
                +-->|modules    |                  +-->|linker   |
                |   +-----------+                  |   +---------+
                |                                  |
                |   +-----------+     +---------+  |   +---------+
                +-->|platform   +---->|config   +--+-->|software |
                    +-----------+  |  +---------+      +---------+
                                   |
                                   |  +---------+
                                   +->|drivers  |
                                   |  +---------+
                                   |
                                   |  +---------+      +----------+
                                   +->|hal      +----->|mss_uart  |
                                   |  +---------+      +----------+              
                                   |
                                   |  +---------+      +----------+
                                   +->|mpfs_hal +----->|nwc       |
                                      +---------+      +----------+
~~~


Please follow the recommended steps
1. Delete the <platform/config/hardware> folder in the Embedded Software project.
2. Copy the generated subdirectory <hardware> into the project <platform/config/> folder


