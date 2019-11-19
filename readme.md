# PolarFire SoC Software Configuration Generator
Utility to generate embedded software header files from information supplied
by Libero from the Libero design. Libero supplies the information in the form 
of an xml file. The expected structure of this file is described below.

# Table of contents
1. [ xml format of hardware description. ](#desc)


## 1. xml format of hardware description <a name="desc"></a>
The following describes the xml tags expected from Libero
Note 1: Values of registers and fields will be in hexadecimal format. 
Note 2: The field offsets are in decimal
#### top level tags
~~~~
<mss>
    <version_info>
        contains version infor related to Libero and design file
        plus version of agreed xml format
    </version_info>
    <memory>
        <map>
           .... verbose memory map for documentation purposes
        </map>
        <cache>
           ... generic register values, will be modified by software flow as requied
        </cache>
        <pmp>
           ... generic register values, will be modified by software flow as requied
        </pmp>
        <mpu>
           ... generic register values, will be modified by software flow as requied
        </mpu>
    </memory>
    <mss_clocks>
        Register settings of two CFM's and PLLs in the MSS
    </mss_clocks>
    <ddr>
        mode register settings
        TIP options
        I/O settings 
        DDRC settings
    </ddr>
    <io>
       IO mux and I/O settings - register values
    </io>
    <sgmii>
       TIP register settings
    </sgmii>
</mss>
~~~~
#### Libero design information, tags used
~~~~
<mss>
    <design_information>
        <design_name>
             ... name of design from Libero
        </design_name>
        <libero_version>
             ... Libero version which generated this design
        </libero_version>
        <mpfs_part_no>
            ... mpfs part number used in the design
        </mpfs_part_no>
        <creation_date_time>
           ... date and time design was created
        </creation_date_timeo>
        <xml_format_version>
           ... This is the version of the xml definition
        </xml_format_version>
    </design_information>
</mss>
~~~~

#### Memory map information, tags used
~~~~
<mss>
    <mss_mem>
        <map>
            <mem_elements>
                <mem>
                    base address in hex, attributes ccontains name, description, size
                </mem>
                <mem>
                    as mamy mem elements as required
                </mem>
            </mem_elements>
        </map>
        <cache>
            <registers>
                ...
            </registers>
        </cache>
         <pmp>
            <registers>
                ...
            </registers>
        </pmp>
         <mpu>
            <registers>
                ...
            </registers>
        </mpu>
    </mss_mem>
</mss>
~~~~

#### DDR information, tags used
~~~~
<mss>
    <ddr>
        <mode>
            ... This contains the mode register and fields only
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </mode>
        <tip_options>
            ... TIP options chossen during Libero flow are here
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </tip_options>
       <io_bank>
            ... These are settings from Libero, related to DDR IO setup
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </io_bank>
        <ddrc>
            .. the full list of DDRC register values are here
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </ddrc>
    </ddr>
</mss>
~~~~

##### DDR TIP options

1. Referenced receivers in the CA bus are turned on for CA training. Option here allows them to be turned off when training is finished.
2. TRAINING_MASK. Pick what trainings we want performed by the TIP.
3. TIP_CFG_PARAMS  
   

##### DDR Mode register
Mode register set by Libero as per description


#### SGMii tip tags used
~~~~
<mss>
    <sgmii>
        <tip>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </tip>
    </sgmii>
</mss>
~~~~

#### MSSIO tags used
~~~~
<mss>
    <mssio>
        <iomux>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </iomux>
        <mss_system>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </iomux>
    </mssio>
</mss>
~~~~

#### Clocks tags used
~~~~
<mss>
    <clocks>
        <cfm0>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </cfm0>
        <cfm1>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </cfm1>
        <mss_pll>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </mss_pll>
        <sgmii_pll>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </sgmii_pll>
        <ddr_pll>
            <registers>
                <register>
                    <field>
                    </field>                
                </register>
            </registers>
        </ddr_pll>
    </mssio>
</mss>
~~~~


#### field detail
~~~~
<mss>
    <clocks>
        <cfm0>
            <registers>
                <register>
                    <field Type="RW" name="REG_RFDIV_EN" description-"This is relevant info" offset="1" width="1" address="0x80000000">
                    0
                    </field>               
                </register>
            </registers>
        </cfm0>
    </mssio>
</mss>
~~~~






## When to use - case one
When Libero produces xml harware description output, run to generate 
header file input for ESS software flow.

## When to use - case two
generate xml descriptions and files from .csv input
(or SPIRIT 1685-2009 xml descriptions)
Useful when testing without using Libero, or generating example xml descriptions for the 
Libero development to work from.

##Source folder
### location of mpfs_config_utility
https://bitbucket.microchip.com/users/m31869/repos/mpfs_config_utility/browse

### Source Register Descriptions for XML protoype creation
Register descriptions of IP blocks are available and are in a number of formats.
They can be found in the following location:
svn://owl/G5/G5_data/design/chip/regmap/trunk/mss
These are used as source by bitwise to produce a c type header file, .html and uvm register map 
of the complete MSS.
I will meet Ajit Kulkarni to document in brief the full flow and verify my understyanding is 
correct.
The formats used are:
##### SPIRIT 1685-2009
www.spiritconsortium.org/XMLSchema/SPIRIT/1685-2009
##### Microsemi excel format
There is a standard fomat microsem have used for describing registers and bitfields in excel.
These files have been hand crafted.


svn://owl/G5/G5_data/design/chip/regmap/trunk/mss/MSS_regmap_tracker.xlsx
#### full reg map
svn://owl/G5/G5_data/design/chip/regmap/trunk/mss/output/default_cmsis/g5soc_mss_regmap.h
#### ddr phy apb (tip)
http://owl/wsvn/G5.G5_data/design/source/g5_mss_ddrphy_apb/tags/2.6.116/?#a4345f50ca9a0a3fb12cebbc8a0a12f69

##todo feedback from last review
Items todo before next review
##### general
* refactor folder names- do not use abbreviations
##### SoftConsole
* pmp folder in config in SoftConsole
##### xml
* get rid of off values -> done
* refactor tag names
* hw_dir_options.h -> option.h
* Libero design name etc - move from properties - done
##### header
* add Libero generated time and date to header file - Done
* add libero generated design name - Done
* change name to design information- Done

## changes
* general_info  tag changed to libero_design_info done
