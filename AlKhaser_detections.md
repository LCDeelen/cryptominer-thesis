| Al-Khaser test                                                                   | VM, no mitigation | Only driver | Driver & script, base VM | Driver & script, linked clone |
|----------------------------------------------------------------------------------|-------------------|-------------|--------------------------|-------------------------------|
| Checking Software Breakpoints                                                    |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking NtYieldExecution                                                        |         ✔         |      ✘      |             ✘            |               ✔               |
| Checking Number of processors in machine                                         |         ✔         |      ✘      |             ✘            |               ✘               |
| Checking Local Descriptor Table location                                         |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Number of cores in machine using WMI                                    |         ✔         |      ✘      |             ✘            |               ✘               |
| Checking hard disk size using WMI                                                |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking hard disk size using DeviceIoControl                                    |         ✔         |      ✘      |             ✘            |               ✘               |
| Checking mouse movement                                                          |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking SetupDi_diskdrive                                                       |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking disk size using GetDiskFreeSpaceEx                                      |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking if CPU hypervisor field is set using cpuid(0x1)                         |         ✔         |      ✘      |             ✘            |               ✘               |
| Checking hypervisor vendor using cpuid(0x40000000)                               |         ✔         |      ✘      |             ✘            |               ✘               |
| Checking SerialNumber from BIOS using WMI                                        |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking Manufacturer from ComputerSystem using WMI                              |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking Current Temperature using WMI                                           |         ✔         |      ✔      |             ✘            |               ✔               |
| Checking power capabilities                                                      |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CPU fan using WMI                                                       |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking NtQueryLicenseValue with Kernel-VMDetection-Private                     |         ✔         |      ✘      |             ✘            |               ✘               |
| Checking Win32_CacheMemory with WMI                                              |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Win32_PhysicalMemory with WMI                                           |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Win32_MemoryDevice with WMI                                             |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Win32_MemoryArray with WMI                                              |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Win32_VoltageProbe with WMI                                             |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Win32_PortConnector with WMI                                            |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Win32_SMBIOSMemory with WMI                                             |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking ThermalZoneInfo performance counters with WMI                           |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CIM_Memory with WMI                                                     |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CIM_Sensor with WMI                                                     |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CIM_NumericSensor with WMI                                              |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CIM_TemperatureSensor with WMI                                          |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CIM_VoltageSensor with WMI                                              |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CIM_PhysicalConnector with WMI                                          |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking CIM_Slot with WMI                                                       |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking reg key HARDWARE\Description\System - SystemBiosVersion is set to VBOX  |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking reg key HARDWARE\Description\System - SystemBiosDate is set to 06/23/99 |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking reg key HARDWARE\ACPI\DSDT\VBOX__                                       |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking reg key HARDWARE\ACPI\FADT\VBOX__                                       |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking reg key HARDWARE\ACPI\RSDT\VBOX__                                       |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking Mac Address start with 08:00:27                                         |         ✔         |      ✔      |             ✘            |               ✔               |
| Checking Win32_PnPDevice Name from WMI for VBox controller hardware              |         ✔         |      ✔      |             ✔            |               ✔               |
| Checking Win32_BaseBoard from WMI                                                |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking MAC address from WMI                                                    |         ✔         |      ✔      |             ✘            |               ✔               |
| Checking SMBIOS firmware                                                         |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking ACPI tables                                                             |         ✔         |      ✔      |             ✘            |               ✘               |
| Checking RDTSC Locky trick                                                       |         ✘         |      ✔      |             ✔            |               ✔               |
| Checking RDTSC which force a VM Exit (cpuid)                                     |         ✔         |      ✔      |             ✔            |               ✔               |