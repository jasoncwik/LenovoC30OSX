/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130725-64 [Jul 30 2013]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of iASLAC34Rd.aml, Mon Jun  2 16:52:14 2014
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000D96C (55660)
 *     Revision         0x02
 *     Checksum         0x6A
 *     OEM ID           "Apple "
 *     OEM Table ID     "TC-A3   "
 *     OEM Revision     0x00000130 (304)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("iASLAC34Rd.aml", "DSDT", 2, "Apple ", "TC-A3   ", 0x00000130)
{
    Name (SP1O, 0x2E)
    Name (IO1B, 0x0A00)
    Name (IO1L, 0x20)
    Name (IO2B, 0x0A20)
    Name (IO2L, 0x20)
    Name (IOES, Zero)
    Name (TCBR, 0xFED08000)
    Name (TCLT, 0x1000)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (SMIP, 0xB2)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x00100000)
    Name (PM30, 0x0430)
    Name (SMBS, 0x1180)
    Name (SMBL, 0x20)
    Name (HPTB, 0xFED00000)
    Name (HPTC, 0xFED1F404)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x80)
    Name (PEBS, 0x80000000)
    Name (LAPB, 0xFEE00000)
    Name (VTD0, 0xFFFFFFFF)
    Name (VTD1, 0xFFFFFFFF)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (HIDK, 0x0303D041)
    Name (HIDM, 0x030FD041)
    Name (CIDK, 0x0B03D041)
    Name (CIDM, 0x130FD041)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PEPM, Zero)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (MBEC, 0xFFFF)
    Name (SRSI, 0xB2)
    Name (CSMI, 0x61)
    Name (SMIT, 0xB2)
    Name (OFST, 0x35)
    Name (TRST, 0x02)
    Name (TPMF, Zero)
    Name (TCMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (WHEA, One)
    Name (PEER, One)
    Name (WVAL, 0xE5)
    Name (VDFG, Zero)
    Name (SMIB, 0xB2)
    Name (WMSZ, 0x0280)
    Name (DSSP, Zero)
    Name (FHPP, Zero)
    Name (HPMN, 0xEA)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        If (LEqual (PICM, Zero))
        {
            Store (0xAC, DBG8)
        }

        Store (0x03, OSVR)
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Windows 2001"))
            {
                Store (0x04, OSVR)
            }

            If (_OSI ("Windows 2001.1"))
            {
                Store (0x05, OSVR)
            }

            If (_OSI ("FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (_OSI ("HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (_OSI ("OpenVMS"))
            {
                Store (0x08, OSVR)
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                Store (0x09, OSVR)
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                Store (0x0A, OSVR)
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                Store (0x0B, OSVR)
            }

            If (_OSI ("Windows 2006"))
            {
                Store (0x0C, OSVR)
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                Store (0x0D, OSVR)
            }

            If (_OSI ("Windows 2009"))
            {
                Store (0x0E, OSVR)
            }

            If (_OSI ("Windows 2012"))
            {
                Store (0x0F, OSVR)
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (Zero, OSVR)
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                Store (One, OSVR)
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                Store (0x02, OSVR)
            }

            If (MCTH (_OS, "Linux"))
            {
                Store (0x03, OSVR)
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (MCTH (_OS, "HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                Store (0x08, OSVR)
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, Zero)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, 0x0001)
    Name (TOPM, 0x00000000)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    Scope (_SB)
    {
        Name (PR00, Package (0x26)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                LNKE, 
                Zero
            }
        })
        Name (AR00, Package (0x26)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x18
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x1A
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x1C
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x1D
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x1E
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x21
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x25
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x26
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x24
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x28
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x2E
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x1F
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x27
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                Zero, 
                0x1F
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                Zero, 
                0x27
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                Zero, 
                0x14
            }
        })
        Name (PR09, Package (0x0C)
        {
            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                0x03, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR09, Package (0x0C)
        {
            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR0A, Package (0x02)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }
        })
        Name (AR0A, Package (0x02)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }
        })
        Name (PR11, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR11, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR1B, Package (0x04)
        {
            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR1B, Package (0x04)
        {
            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR1C, Package (0x03)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR1C, Package (0x03)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR20, Package (0x14)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR20, Package (0x14)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x30
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x31
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x31
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x31
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x32
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x34
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x35
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x36
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x38
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x3C
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x3D
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x3E
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x40
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x44
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x45
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x46
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x37
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x3F
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                Zero, 
                0x37
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                Zero, 
                0x3F
            }
        })
        Name (PR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x28
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x2E
            }
        })
        Name (PR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x20
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x24
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x25
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x26
            }
        })
        Name (PR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x1B
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x1E
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x1C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x1D
            }
        })
        Name (PR97, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR97, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x40
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x44
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x45
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x46
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Name (PRSC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,10,11,12,14,15}
        })
        Alias (PRSC, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Name (CPRB, One)
            Name (LVGA, 0x01)
            Name (STAV, 0x0F)
            Name (BRB, 0x0000)
            Name (BRL, 0x003F)
            Name (IOB, 0x1000)
            Name (IOL, 0xF000)
            Name (MBB, 0x80000000)
            Name (MBL, 0x7C000000)
            Name (MABL, 0x00000000)
            Name (MABH, 0x00000000)
            Name (MALL, 0x00000000)
            Name (MALH, 0x00000000)
            Name (MAML, 0x00000000)
            Name (MAMH, 0x00000000)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y00)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x03AF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x03B0,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y02, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y01, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDE00000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y06)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y08, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y07, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (STAV)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._LEN, LEN0)  // _LEN: Length
                    Store (BRB, MIN0)
                    Store (BRL, LEN0)
                    Store (LEN0, Local0)
                    Add (MIN0, Decrement (Local0), MAX0)
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._LEN, LEN1)  // _LEN: Length
                    If (LEqual (IOB, 0x1000))
                    {
                        Store (IOL, Local0)
                        Add (IOB, Decrement (Local0), MAX1)
                        Subtract (MAX1, MIN1, Local0)
                        Add (Local0, One, LEN1)
                    }
                    Else
                    {
                        Store (IOB, MIN1)
                        Store (IOL, LEN1)
                        Store (LEN1, Local0)
                        Add (MIN1, Decrement (Local0), MAX1)
                    }

                    If (LOr (LEqual (LVGA, One), LEqual (LVGA, 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, ILN1)  // _LEN: Length
                            Store (0x03B0, IMN1)
                            Store (0x03DF, IMX1)
                            Store (0x30, ILN1)
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._LEN, VLN1)  // _LEN: Length
                            Store (0x000A0000, VMN1)
                            Store (0x000BFFFF, VMX1)
                            Store (0x00020000, VLN1)
                            Store (Zero, VGAF)
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)  // _LEN: Length
                    Store (MBB, MIN3)
                    Store (MBL, LEN3)
                    Store (LEN3, Local0)
                    Add (MIN3, Decrement (Local0), MAX3)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)  // _MIN: Minimum Base Address
                        Add (0xB4, 0x04, Local0)
                        CreateDWordField (CRS1, Local0, MN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)  // _MAX: Maximum Base Address
                        Add (0xBC, 0x04, Local1)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)  // _LEN: Length
                        Add (0xCC, 0x04, Local2)
                        CreateDWordField (CRS1, Local2, LN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        Store (MALL, LN8L)
                        Store (MALH, LN8H)
                        Store (MAML, MX8L)
                        Store (MAMH, MX8H)
                    }

                    Return (CRS1)
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)  // _LEN: Length
                    Store (BRB, MIN2)
                    Store (BRL, LEN2)
                    Store (LEN2, Local1)
                    Add (MIN2, Decrement (Local1), MAX2)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)  // _LEN: Length
                    Store (IOB, MIN4)
                    Store (IOL, LEN4)
                    Store (LEN4, Local1)
                    Add (MIN4, Decrement (Local1), MAX4)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._LEN, ILN2)  // _LEN: Length
                        Store (0x03B0, IMN2)
                        Store (0x03DF, IMX2)
                        Store (0x30, ILN2)
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, VLN2)  // _LEN: Length
                        Store (0x000A0000, VMN2)
                        Store (0x000BFFFF, VMX2)
                        Store (0x00020000, VLN2)
                    }

                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._LEN, LEN5)  // _LEN: Length
                    Store (MBB, MIN5)
                    Store (MBL, LEN5)
                    Store (LEN5, Local1)
                    Add (MIN5, Decrement (Local1), MAX5)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MIN, MN9L)  // _MIN: Minimum Base Address
                        Add (0x72, 0x04, Local0)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MAX, MX9L)  // _MAX: Maximum Base Address
                        Add (0x7A, 0x04, Local1)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._LEN, LN9L)  // _LEN: Length
                        Add (0x8A, 0x04, Local2)
                        CreateDWordField (CRS2, Local2, LN9H)
                        Store (MABL, MN9L)
                        Store (MABH, MN9H)
                        Store (MALL, LN9L)
                        Store (MALH, LN9H)
                        Store (MAML, MX9L)
                        Store (MAMH, MX9H)
                    }

                    Return (CRS2)
                }
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                            /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (PEHP))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (SHPC))
                    {
                        And (CTRL, 0x1D, CTRL)
                    }

                    If (LNot (PEPM))
                    {
                        And (CTRL, 0x1B, CTRL)
                    }

                    If (LNot (PEER))
                    {
                        And (CTRL, 0x15, CTRL)
                    }

                    If (LNot (PECS))
                    {
                        And (CTRL, 0x0F, CTRL)
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }

            Name (_PXM, Zero)  // _PXM: Device Proximity
            Device (IOH)
            {
                Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Memory32Fixed (ReadWrite,
                        0xFC000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFD000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFE000000,         // Address Base
                        0x00B00000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEB00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED00400,         // Address Base
                        0x0003FC00,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x000BB000,         // Address Length
                        )
                })
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (^UNC0)
            {
                Name (_HID, EisaId ("PNP0A03"))  // _HID: Hardware ID
                Method (_UID, 0, NotSerialized)  // _UID: Unique ID
                {
                    Add (^^PCI0.BRB, ^^PCI0.BRL, Local0)
                    Return (Local0)
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Add (^^PCI0.BRB, ^^PCI0.BRL, Local0)
                    Return (Local0)
                }

                Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
                {
                    Return (Arg3)
                }

                Name (_ADR, Zero)  // _ADR: Address
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Name (CRS1, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x00FF,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0001,             // Length
                        ,, _Y0C)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Add (^^PCI0.BRB, ^^PCI0.BRL, Local0)
                    CreateDWordField (CRS1, \_SB.UNC0._Y0C._MIN, UMIN)  // _MIN: Minimum Base Address
                    Store (Local0, UMIN)
                    CreateDWordField (CRS1, \_SB.UNC0._Y0C._MAX, UMAX)  // _MAX: Maximum Base Address
                    Store (Local0, UMAX)
                    Return (CRS1)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (^^PCI0.STAV)
                }
            }

            Device (VTDR)
            {
                Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly,
                        0x00000000,         // Address Base
                        0x00002000,         // Address Length
                        _Y0D)
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (VTD0, 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (BUF0, \_SB.PCI0.VTDR._Y0D._BAS, VBR0)  // _BAS: Base Address
                    CreateDWordField (BUF0, \_SB.PCI0.VTDR._Y0D._LEN, VLT0)  // _LEN: Length
                    Store (VTD0, VBR0)
                    If (LEqual (VTD0, 0xFFFFFFFF))
                    {
                        Store (Zero, VLT0)
                    }

                    Return (BUF0)
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Method (SPTS, 1, NotSerialized)
                {
                    Store (One, PS1S)
                    Store (One, PS1E)
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (One, BG27)
                    }

                    Store (One, SLPS)
                }

                Method (SWAK, 1, NotSerialized)
                {
                    Store (Zero, SLPS)
                    Store (Zero, PS1E)
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Zero, BG27)
                        Store (One, GL27)
                    }

                    If (GL25) {}
                    Else
                    {
                        Notify (PWRB, 0x02)
                    }
                }

                OperationRegion (SMIE, SystemIO, PM30, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    PS1E,   1, 
                        ,   31, 
                    PS1S,   1, 
                    Offset (0x08)
                }

                OperationRegion (BLNK, SystemIO, 0x0518, 0x04)
                Field (BLNK, ByteAcc, NoLock, Preserve)
                {
                        ,   27, 
                    BG27,   1
                }

                OperationRegion (GPOL, SystemIO, 0x050F, 0x04)
                Field (GPOL, ByteAcc, NoLock, Preserve)
                {
                        ,   1, 
                    GL25,   1, 
                        ,   1, 
                    GL27,   1
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                    OperationRegion (PMS0, SystemIO, PMBS, 0x04)
                    Field (PMS0, ByteAcc, NoLock, Preserve)
                    {
                            ,   10, 
                        RTCS,   1, 
                            ,   3, 
                        PEXS,   1, 
                        WAKS,   1, 
                        Offset (0x03), 
                        PWBT,   1, 
                        Offset (0x04)
                    }

                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (LNotEqual (SUSW, 0xFF))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                        {
                            If (LNotEqual (SUSW, 0xFF))
                            {
                                Return (Package (0x02)
                                {
                                    SUSW, 
                                    0x04
                                })
                            }
                            Else
                            {
                                Return (Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (PCH)
                        {
                            Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                            Name (_UID, 0x01C7)  // _UID: Unique ID
                            Name (_STA, 0x0F)  // _STA: Status
                            Name (ICHR, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0E)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0F)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y10)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y11)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y13)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y12)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y14)
                                Memory32Fixed (ReadWrite,
                                    0xFF000000,         // Address Base
                                    0x01000000,         // Address Length
                                    )
                            })
                            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0E._MIN, PBB)  // _MIN: Minimum Base Address
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0E._MAX, PBH)  // _MAX: Maximum Base Address
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y0E._LEN, PML)  // _LEN: Length
                                Store (PMBS, PBB)
                                Store (PMBS, PBH)
                                Store (0x54, PML)
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0F._MIN, P2B)  // _MIN: Minimum Base Address
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0F._MAX, P2H)  // _MAX: Maximum Base Address
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y0F._LEN, P2L)  // _LEN: Length
                                Add (PMBS, 0x58, P2B)
                                Add (PMBS, 0x58, P2H)
                                Store (0x28, P2L)
                                If (SMBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y10._MIN, SMB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y10._MAX, SMH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y10._LEN, SML)  // _LEN: Length
                                    Store (SMBS, SMB)
                                    Store (SMBS, SMH)
                                    Store (SMBL, SML)
                                }

                                If (GPBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y11._MIN, IGB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y11._MAX, IGH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y11._LEN, IGL)  // _LEN: Length
                                    Store (GPBS, IGB)
                                    Store (GPBS, IGH)
                                    Store (GPLN, IGL)
                                }

                                If (APCB)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y12._BAS, APB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y12._LEN, APL)  // _LEN: Length
                                    Store (APCB, APB)
                                    Store (APCL, APL)
                                }

                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y13._BAS, RCB)  // _BAS: Base Address
                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y13._LEN, RCL)  // _LEN: Length
                                Store (SRCB, RCB)
                                Store (SRCL, RCL)
                                If (TCBR)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y14._BAS, TCB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y14._LEN, TCL)  // _LEN: Length
                                    Store (TCBR, TCB)
                                    Store (TCLT, TCL)
                                }

                                Return (ICHR)
                            }
                        }

                        Device (CWDT)
                        {
                            Name (_HID, EisaId ("INT3F0D"))  // _HID: Hardware ID
                            Name (_CID, EisaId ("PNP0C02"))  // _CID: Compatible ID
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0454,             // Range Minimum
                                    0x0454,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    _Y15)
                            })
                            Method (_STA, 0, Serialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y15._MIN, WDB)  // _MIN: Minimum Base Address
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y15._MAX, WDH)  // _MAX: Maximum Base Address
                                Add (PMBS, 0x54, WDB)
                                Add (PMBS, 0x54, WDH)
                                Return (BUF0)
                            }
                        }
                    }
                }

                Device (SIO1)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x0111)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y16)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y17)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (LAnd (LLess (SP1O, 0x03F0), LGreater (SP1O, 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MIN, GPI0)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MAX, GPI1)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._LEN, GPIL)  // _LEN: Length
                            Store (SP1O, GPI0)
                            Store (SP1O, GPI1)
                            Store (0x02, GPIL)
                        }

                        If (IO1B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MIN, GP10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MAX, GP11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._LEN, GPL1)  // _LEN: Length
                            Store (IO1B, GP10)
                            Store (IO1B, GP11)
                            Add (IO1L, IO2L, Local0)
                            Store (Local0, GPL1)
                        }

                        Return (CRS)
                    }

                    Name (DCAT, Package (0x15)
                    {
                        0x02, 
                        0x03, 
                        One, 
                        Zero, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x06, 
                        0xFF, 
                        0xFF
                    })
                    Mutex (MUT0, 0x00)
                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (MUT0, 0x0FFF)
                        Store (0x87, INDX)
                        Store (0x87, INDX)
                        Store (Arg0, LDN)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                        Release (MUT0)
                    }

                    Method (LPTM, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        And (OPT0, 0x02, Local0)
                        EXFG ()
                        Return (Local0)
                    }

                    Method (UHID, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        And (OPT1, 0x38, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            Return (0x1005D041)
                        }
                        Else
                        {
                            Return (0x0105D041)
                        }
                    }

                    OperationRegion (IOID, SystemIO, SP1O, 0x02)
                    Field (IOID, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x21), 
                        SCF1,   8, 
                        SCF2,   8, 
                        SCF3,   8, 
                        SCF4,   8, 
                        SCF5,   8, 
                        SCF6,   8, 
                        Offset (0x29), 
                        CKCF,   8, 
                        Offset (0x30), 
                        ACTR,   8, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IOH2,   8, 
                        IOL2,   8, 
                        Offset (0x70), 
                        INTR,   8, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xE0), 
                        RGE0,   8, 
                        RGE1,   8, 
                        RGE2,   8, 
                        RGE3,   8, 
                        RGE4,   8, 
                        RGE5,   8, 
                        RGE6,   8, 
                        RGE7,   8, 
                        RGE8,   8, 
                        RGE9,   8, 
                        Offset (0xF0), 
                        OPT0,   8, 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8, 
                        OPT5,   8, 
                        OPT6,   8, 
                        OPT7,   8, 
                        OPT8,   8, 
                        OPT9,   8
                    }

                    Method (CGLD, 1, NotSerialized)
                    {
                        Return (DerefOf (Index (DCAT, Arg0)))
                    }

                    Method (DSTA, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Store (ACTR, Local0)
                        EXFG ()
                        If (LEqual (Local0, 0xFF))
                        {
                            Return (Zero)
                        }

                        And (Local0, One, Local0)
                        If (LGreaterEqual (Arg0, 0x10))
                        {
                            Or (IOES, ShiftLeft (Local0, And (Arg0, 0x0F)), IOES)
                        }
                        Else
                        {
                            Or (IOST, ShiftLeft (Local0, Arg0), IOST)
                        }

                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LGreaterEqual (Arg0, 0x10))
                            {
                                Store (IOES, Local0)
                            }
                            Else
                            {
                                Store (IOST, Local0)
                            }

                            And (Arg0, 0x0F, Local1)
                            If (And (ShiftLeft (One, Local1), Local0))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Method (DCNT, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        If (LAnd (LLess (DMCH, 0x04), LNotEqual (And (DMCH, 0x03, 
                            Local1), Zero)))
                        {
                            RDMA (Arg0, Arg1, Increment (Local1))
                        }

                        Store (Arg1, ACTR)
                        ShiftLeft (IOAH, 0x08, Local1)
                        Or (IOAL, Local1, Local1)
                        RRIO (Arg0, Arg1, Local1, 0x08)
                        EXFG ()
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1A)
                        IRQNoFlags (_Y18)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y19)
                            {}
                    })
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y18._INT, IRQM)  // _INT: Interrupts
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y19._DMA, DMAM)  // _DMA: Direct Memory Access
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MIN, IO11)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MAX, IO12)  // _MAX: Maximum Base Address
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._LEN, LEN1)  // _LEN: Length
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1D)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1E)
                        IRQNoFlags (_Y1B)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1C)
                            {2}
                    })
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1B._INT, IRQE)  // _INT: Interrupts
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1C._DMA, DMAE)  // _DMA: Direct Memory Access
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MIN, IO21)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MAX, IO22)  // _MAX: Maximum Base Address
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._LEN, LEN2)  // _LEN: Length
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MIN, IO31)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MAX, IO32)  // _MAX: Maximum Base Address
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._LEN, LEN3)  // _LEN: Length
                    Name (CRS4, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y20)
                        IRQ (Edge, ActiveLow, Shared, _Y1F)
                            {}
                    })
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y1F._INT, IRQL)  // _INT: Interrupts
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MIN, IOHL)  // _MIN: Minimum Base Address
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MAX, IORL)  // _MAX: Maximum Base Address
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._ALN, ALMN)  // _ALN: Alignment
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._LEN, LENG)  // _LEN: Length
                    Method (DCRS, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IO11)
                        Or (IOAL, IO11, IO11)
                        Store (IO11, IO12)
                        Store (0x08, LEN1)
                        If (INTR)
                        {
                            ShiftLeft (One, INTR, IRQM)
                        }
                        Else
                        {
                            Store (Zero, IRQM)
                        }

                        If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                        {
                            Store (Zero, DMAM)
                        }
                        Else
                        {
                            And (DMCH, 0x03, Local1)
                            ShiftLeft (One, Local1, DMAM)
                        }

                        EXFG ()
                        Return (CRS1)
                    }

                    Method (DCR2, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IO21)
                        Or (IOAL, IO21, IO21)
                        Store (IO21, IO22)
                        Store (0x08, LEN2)
                        ShiftLeft (IOH2, 0x08, IO31)
                        Or (IOL2, IO31, IO31)
                        Store (IO21, IO32)
                        Store (0x08, LEN3)
                        If (INTR)
                        {
                            ShiftLeft (One, INTR, IRQE)
                        }
                        Else
                        {
                            Store (Zero, IRQE)
                        }

                        If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                        {
                            Store (Zero, DMAE)
                        }
                        Else
                        {
                            And (DMCH, 0x03, Local1)
                            ShiftLeft (One, Local1, DMAE)
                        }

                        EXFG ()
                        Return (CRS2)
                    }

                    Method (DCR4, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IOHL)
                        Or (IOAL, IOHL, IOHL)
                        Store (IOHL, IORL)
                        Store (0x08, LENG)
                        If (INTR)
                        {
                            And (INTR, 0x0F, INTR)
                            ShiftLeft (One, INTR, IRQL)
                        }
                        Else
                        {
                            Store (Zero, IRQL)
                        }

                        EXFG ()
                        Return (CRS4)
                    }

                    Method (DSRS, 2, NotSerialized)
                    {
                        If (LEqual (Arg1, 0x02))
                        {
                            If (LPTM (CGLD (Arg1)))
                            {
                                DSR2 (Arg0, Arg1)
                            }
                        }
                        Else
                        {
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateByteField (Arg0, 0x0C, DMAM)
                            CreateWordField (Arg0, 0x02, IO11)
                            ENFG (CGLD (Arg1))
                            And (IO11, 0xFF, IOAL)
                            ShiftRight (IO11, 0x08, IOAH)
                            If (IRQM)
                            {
                                FindSetRightBit (IRQM, Local0)
                                Subtract (Local0, One, INTR)
                            }
                            Else
                            {
                                Store (Zero, INTR)
                            }

                            If (DMAM)
                            {
                                FindSetRightBit (DMAM, Local0)
                                Subtract (Local0, One, DMCH)
                            }
                            Else
                            {
                                Store (0x04, DMCH)
                            }

                            EXFG ()
                            DCNT (Arg1, One)
                            Store (Arg1, Local2)
                            If (LGreater (Local2, Zero))
                            {
                                Subtract (Local2, One, Local2)
                            }
                        }
                    }

                    Method (DSR2, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x11, IRQT)
                        CreateByteField (Arg0, 0x14, DMAT)
                        CreateWordField (Arg0, 0x02, IOT1)
                        CreateWordField (Arg0, 0x0A, IOT2)
                        ENFG (CGLD (Arg1))
                        And (IOT1, 0xFF, IOAL)
                        ShiftRight (IOT1, 0x08, IOAH)
                        And (IOT2, 0xFF, IOL2)
                        ShiftRight (IOT2, 0x08, IOH2)
                        If (IRQT)
                        {
                            FindSetRightBit (IRQT, Local0)
                            Subtract (Local0, One, INTR)
                        }
                        Else
                        {
                            Store (Zero, INTR)
                        }

                        If (DMAT)
                        {
                            FindSetRightBit (DMAT, Local0)
                            Subtract (Local0, One, DMCH)
                        }
                        Else
                        {
                            Store (0x04, DMCH)
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Store (Arg1, Local2)
                        If (LGreater (Local2, Zero))
                        {
                            Subtract (Local2, One, Local2)
                        }
                    }

                    Method (DSR4, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x02, IOHL)
                        CreateWordField (Arg0, 0x09, IRQL)
                        ENFG (CGLD (Arg1))
                        And (IOHL, 0xFF, IOAL)
                        ShiftRight (IOHL, 0x08, IOAH)
                        If (IRQL)
                        {
                            FindSetRightBit (IRQL, Local0)
                            Subtract (Local0, One, INTR)
                        }
                        Else
                        {
                            Store (Zero, INTR)
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Store (Arg1, Local2)
                        If (LGreater (Local2, Zero))
                        {
                            Subtract (Local2, One, Local2)
                        }
                    }
                }

                Name (PMFG, Zero)
                OperationRegion (KBPT, SystemIO, 0x60, 0x05)
                Field (KBPT, ByteAcc, NoLock, Preserve)
                {
                    DAPT,   8, 
                    Offset (0x04), 
                    CMDP,   8
                }

                OperationRegion (IOEC, SystemIO, IO1B, 0x04)
                Field (IOEC, ByteAcc, NoLock, Preserve)
                {
                    PAGE,   8, 
                    INDP,   8, 
                    DATP,   8
                }

                OperationRegion (IOAC, SystemIO, IO2B, 0x08)
                Field (IOAC, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    GPS2,   8, 
                    GPS3,   8, 
                    Offset (0x06), 
                    GPE2,   8, 
                    GPE3,   8
                }

                Method (SIOS, 1, NotSerialized)
                {
                    Store ("SIOS", Debug)
                    If (LNotEqual (CMDP, 0xFF))
                    {
                        And (CMDP, 0x02, Local0)
                        While (LNotEqual (Local0, Zero))
                        {
                            Stall (One)
                            And (CMDP, 0x02, Local0)
                        }

                        Store (0xED, DAPT)
                        And (CMDP, 0x02, Local0)
                        While (LNotEqual (Local0, Zero))
                        {
                            Stall (One)
                            And (CMDP, 0x02, Local0)
                        }

                        Store (Zero, DAPT)
                    }

                    If (LNotEqual (Arg0, One))
                    {
                        ^SIO1.ENFG (0x0A)
                        Or (^SIO1.RGE0, 0x03, ^SIO1.RGE0)
                        Or (^SIO1.RGE6, 0x80, ^SIO1.RGE6)
                        And (^SIO1.OPT3, 0xBF, ^SIO1.OPT3)
                        ^SIO1.EXFG ()
                        Store (Zero, GPE2)
                        Store (0xFF, GPS2)
                        Store (0xFF, GPS3)
                        Store (0xFF, PAGE)
                        Store (0x04, PAGE)
                        Store (0xFF, INDP)
                        Store (0x66, INDP)
                        Store (Zero, DATP)
                        If (KBFG)
                        {
                            Store (0xFF, INDP)
                            Store (0x64, INDP)
                            Store (DATP, Local0)
                            Or (Local0, 0x80, Local0)
                            Store (Local0, DATP)
                        }
                        Else
                        {
                            Store (0xFF, INDP)
                            Store (0x64, INDP)
                            Store (DATP, Local0)
                            And (Local0, 0x7F, Local0)
                            Store (Local0, DATP)
                        }

                        If (MSFG)
                        {
                            Store (0xFF, INDP)
                            Store (0x64, INDP)
                            Store (DATP, Local0)
                            Or (Local0, 0x40, Local0)
                            Store (Local0, DATP)
                        }
                        Else
                        {
                            Store (0xFF, INDP)
                            Store (0x64, INDP)
                            Store (DATP, Local0)
                            And (Local0, 0xBF, Local0)
                            Store (Local0, DATP)
                        }

                        Store (0xFF, PAGE)
                        Store (0xFF, INDP)
                    }
                    Else
                    {
                        And (^SIO1.OPT2, 0xCF, ^SIO1.OPT2)
                        Store (0x30, GPE2)
                        Store (Zero, GPE3)
                        Store (0xFF, GPS2)
                        Store (0xFF, GPS3)
                    }
                }

                Method (SIOW, 1, NotSerialized)
                {
                    Store ("SIOW", Debug)
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP030B"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        Store (Arg0, KBFG)
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Method (PS2K._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x03))
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (IOST, 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        Store (Arg0, MSFG)
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Method (PS2M._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x03))
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (^^SIO1.DSTA (Zero))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ^^SIO1.DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (^^SIO1.DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        ^^SIO1.DSRS (Arg0, Zero)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Method (UAR1._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x08, 0x04))
                }

                Device (UAR2)
                {
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        Return (^^SIO1.UHID (One))
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (^^SIO1.DSTA (One))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ^^SIO1.DCNT (One, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (^^SIO1.DCRS (One, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        ^^SIO1.DSRS (Arg0, One)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Method (UAR2._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x08, 0x04))
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y21)
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y22)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (LNot (TPMF))
                        {
                            CreateDWordField (CRS1, \_SB.PCI0.SBRG.RMSC._Y21._BAS, TB01)  // _BAS: Base Address
                            CreateDWordField (CRS1, \_SB.PCI0.SBRG.RMSC._Y21._LEN, TL01)  // _LEN: Length
                            Store (0xFED40000, TB01)
                            Store (0x5000, TL01)
                        }

                        If (LNot (TPMF))
                        {
                            CreateDWordField (CRS2, \_SB.PCI0.SBRG.RMSC._Y22._BAS, TB00)  // _BAS: Base Address
                            CreateDWordField (CRS2, \_SB.PCI0.SBRG.RMSC._Y22._LEN, TL00)  // _LEN: Length
                            Store (0xFED40000, TB00)
                            Store (0x5000, TL00)
                        }

                        If (And (MBEC, 0xFFFF))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR09)
                    }

                    Return (PR09)
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (^NATA, Package (0x01)
                {
                    0x001F0002
                })
                Name (\FZTF, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5
                })
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, REGF)
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        ShiftLeft (PSCR, One, Local1)
                        Or (PMCR, Local1, Local0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local1)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local2)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local0)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local1)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (PMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (PMUT, GMUT)
                        Store (PMCR, GMCR)
                        Store (PSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (PSUT, GSUT)
                        Store (PSCR, GSCR)
                        STM ()
                        Store (GMPT, PMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, PMUT)
                        Store (GMCR, PMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, PSUT)
                        Store (GSCR, PSCR)
                        If (And (Local0, One))
                        {
                            Store (One, PM3E)
                        }
                        Else
                        {
                            Store (Zero, PM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, PM6E)
                        }
                        Else
                        {
                            Store (Zero, PM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, PMAE)
                        }
                        Else
                        {
                            Store (Zero, PMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, PS3E)
                        }
                        Else
                        {
                            Store (Zero, PS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, PS6E)
                        }
                        Else
                        {
                            Store (Zero, PS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, PSAE)
                        }
                        Else
                        {
                            Store (Zero, PSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA0)
                        Store (GTF (One, Arg2), ATA1)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        ShiftLeft (SSCR, One, Local1)
                        Or (SMCR, Local1, Local0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local1)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local2)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local0)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local1)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (SMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (SMUT, GMUT)
                        Store (SMCR, GMCR)
                        Store (SSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (SSUT, GSUT)
                        Store (SSCR, GSCR)
                        STM ()
                        Store (GMPT, SMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, SMUT)
                        Store (GMCR, SMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, SSUT)
                        Store (GSCR, SSCR)
                        If (And (Local0, One))
                        {
                            Store (One, SM3E)
                        }
                        Else
                        {
                            Store (Zero, SM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, SM6E)
                        }
                        Else
                        {
                            Store (Zero, SM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, SMAE)
                        }
                        Else
                        {
                            Store (Zero, SMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, SS3E)
                        }
                        Else
                        {
                            Store (Zero, SS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, SS6E)
                        }
                        Else
                        {
                            Store (Zero, SS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, SSAE)
                        }
                        Else
                        {
                            Store (Zero, SSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA2)
                        Store (GTF (One, Arg2), ATA3)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    Store (Ones, PIO0)
                    Store (Ones, PIO1)
                    Store (Ones, DMA0)
                    Store (Ones, DMA1)
                    Store (0x10, CHNF)
                    If (REGF) {}
                    Else
                    {
                        Return (TMD0)
                    }

                    If (And (Arg1, 0x20))
                    {
                        Or (CHNF, 0x02, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, One)), MEQ, Arg0, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA0)
                    Store (Local7, PIO0)
                    If (And (Arg4, 0x20))
                    {
                        Or (CHNF, 0x08, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, 0x02)), MEQ, Arg3, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA1)
                    Store (Local7, PIO1)
                    If (And (Arg1, 0x07))
                    {
                        Store (Arg2, Local5)
                        If (And (Arg1, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg1, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA0)
                        Or (CHNF, One, CHNF)
                    }

                    If (And (Arg4, 0x07))
                    {
                        Store (Arg5, Local5)
                        If (And (Arg4, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg4, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA1)
                        Or (CHNF, 0x04, CHNF)
                    }

                    Store (TMD0, Debug)
                    Return (TMD0)
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        Store (Zero, GMUE)
                        Store (Zero, GMUT)
                        Store (Zero, GSUE)
                        Store (Zero, GSUT)
                        If (And (CHNF, One))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GMUT)
                            Or (GMUE, One, GMUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GMUE, 0x02, GMUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GMUE, 0xFD, GMUE)
                                Or (GMUE, 0x04, GMUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO0, Ones), LEqual (PIO0, Zero)))
                            {
                                If (And (LLess (DMA0, Ones), LGreater (DMA0, Zero)))
                                {
                                    Store (DMA0, PIO0)
                                    Or (GMUE, 0x80, GMUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x04))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA1, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GSUT)
                            Or (GSUE, One, GSUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GSUE, 0x02, GSUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GSUE, 0xFD, GSUE)
                                Or (GSUE, 0x04, GSUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO1, Ones), LEqual (PIO1, Zero)))
                            {
                                If (And (LLess (DMA1, Ones), LGreater (DMA1, Zero)))
                                {
                                    Store (DMA1, PIO1)
                                    Or (GSUE, 0x80, GSUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x02))
                        {
                            Or (GMUE, 0x20, GMUE)
                        }

                        If (And (CHNF, 0x08))
                        {
                            Or (GSUE, 0x20, GSUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, One)), Local0)), 
                            Local1)
                        Store (Local1, GMPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GMUE, 0x50, GMUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO1, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0)), 
                            Local1)
                        Store (Local1, GSPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GSUE, 0x50, GSUE)
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x1D) {})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Multiply (CMDC, 0x38, Local0)
                    Add (Local0, 0x08, Local1)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Multiply (CMDC, 0x07, Local0)
                    CreateByteField (ATAB, Add (Local0, 0x02), A001)
                    CreateByteField (ATAB, Add (Local0, 0x06), A005)
                    Store (Arg0, CMDX)
                    Store (Arg1, A001)
                    Store (Arg2, A005)
                    Increment (CMDC)
                }

                Method (GTF, 2, Serialized)
                {
                    Store (Arg1, Debug)
                    Store (Zero, CMDC)
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        Store (IW49, ID49)
                        CreateWordField (Arg1, 0x6A, IW53)
                        Store (IW53, ID53)
                        CreateWordField (Arg1, 0x7E, IW63)
                        Store (IW63, ID63)
                        CreateWordField (Arg1, 0x76, IW59)
                        Store (IW59, ID59)
                        CreateWordField (Arg1, 0xB0, IW88)
                        Store (IW88, ID88)
                    }

                    Store (0xA0, Local7)
                    If (Arg0)
                    {
                        Store (0xB0, Local7)
                        And (CHNF, 0x08, IRDY)
                        If (And (CHNF, 0x10))
                        {
                            Store (PIO1, PIOT)
                        }
                        Else
                        {
                            Store (PIO0, PIOT)
                        }

                        If (And (CHNF, 0x04))
                        {
                            If (And (CHNF, 0x10))
                            {
                                Store (DMA1, DMAT)
                            }
                            Else
                            {
                                Store (DMA0, DMAT)
                            }
                        }
                    }
                    Else
                    {
                        And (CHNF, 0x02, IRDY)
                        Store (PIO0, PIOT)
                        If (And (CHNF, One))
                        {
                            Store (DMA0, DMAT)
                        }
                    }

                    If (LAnd (LAnd (And (ID53, 0x04), And (ID88, 0xFF00
                        )), DMAT))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMAT, MTR, 
                            Zero, Zero), Local1)
                        If (LGreater (Local1, 0x05))
                        {
                            Store (0x05, Local1)
                        }

                        GTFB (AT01, Or (0x40, Local1), Local7)
                    }
                    Else
                    {
                        If (LAnd (And (ID63, 0xFF00), PIOT))
                        {
                            And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                                Zero, Zero), 0x03, Local0)
                            Or (0x20, DerefOf (Index (DerefOf (Index (TIM0, 0x07)), Local0
                                )), Local1)
                            GTFB (AT01, Local1, Local7)
                        }
                    }

                    If (IRDY)
                    {
                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Or (0x08, DerefOf (Index (DerefOf (Index (TIM0, 0x06)), Local0
                            )), Local1)
                        GTFB (AT01, Local1, Local7)
                    }
                    Else
                    {
                        If (And (ID49, 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    If (LAnd (And (ID59, 0x0100), And (ID59, 0xFF)))
                    {
                        GTFB (AT03, And (ID59, 0xFF), Local7)
                    }

                    Store (ATAB, Debug)
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Store (RETB, Debug)
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, REGF)
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        ShiftLeft (PSCR, One, Local1)
                        Or (PMCR, Local1, Local0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local1)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local2)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local0)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local1)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (PMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (PMUT, GMUT)
                        Store (PMCR, GMCR)
                        Store (PSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (PSUT, GSUT)
                        Store (PSCR, GSCR)
                        STM ()
                        Store (GMPT, PMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, PMUT)
                        Store (GMCR, PMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, PSUT)
                        Store (GSCR, PSCR)
                        If (And (Local0, One))
                        {
                            Store (One, PM3E)
                        }
                        Else
                        {
                            Store (Zero, PM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, PM6E)
                        }
                        Else
                        {
                            Store (Zero, PM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, PMAE)
                        }
                        Else
                        {
                            Store (Zero, PMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, PS3E)
                        }
                        Else
                        {
                            Store (Zero, PS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, PS6E)
                        }
                        Else
                        {
                            Store (Zero, PS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, PSAE)
                        }
                        Else
                        {
                            Store (Zero, PSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA0)
                        Store (GTF (One, Arg2), ATA1)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        ShiftLeft (SSCR, One, Local1)
                        Or (SMCR, Local1, Local0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local1)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local2)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local0)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local1)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (SMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (SMUT, GMUT)
                        Store (SMCR, GMCR)
                        Store (SSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (SSUT, GSUT)
                        Store (SSCR, GSCR)
                        STM ()
                        Store (GMPT, SMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, SMUT)
                        Store (GMCR, SMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, SSUT)
                        Store (GSCR, SSCR)
                        If (And (Local0, One))
                        {
                            Store (One, SM3E)
                        }
                        Else
                        {
                            Store (Zero, SM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, SM6E)
                        }
                        Else
                        {
                            Store (Zero, SM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, SMAE)
                        }
                        Else
                        {
                            Store (Zero, SMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, SS3E)
                        }
                        Else
                        {
                            Store (Zero, SS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, SS6E)
                        }
                        Else
                        {
                            Store (Zero, SS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, SSAE)
                        }
                        Else
                        {
                            Store (Zero, SSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA2)
                        Store (GTF (One, Arg2), ATA3)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    Store (Ones, PIO0)
                    Store (Ones, PIO1)
                    Store (Ones, DMA0)
                    Store (Ones, DMA1)
                    Store (0x10, CHNF)
                    If (REGF) {}
                    Else
                    {
                        Return (TMD0)
                    }

                    If (And (Arg1, 0x20))
                    {
                        Or (CHNF, 0x02, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, One)), MEQ, Arg0, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA0)
                    Store (Local7, PIO0)
                    If (And (Arg4, 0x20))
                    {
                        Or (CHNF, 0x08, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, 0x02)), MEQ, Arg3, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA1)
                    Store (Local7, PIO1)
                    If (And (Arg1, 0x07))
                    {
                        Store (Arg2, Local5)
                        If (And (Arg1, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg1, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA0)
                        Or (CHNF, One, CHNF)
                    }

                    If (And (Arg4, 0x07))
                    {
                        Store (Arg5, Local5)
                        If (And (Arg4, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg4, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA1)
                        Or (CHNF, 0x04, CHNF)
                    }

                    Store (TMD0, Debug)
                    Return (TMD0)
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        Store (Zero, GMUE)
                        Store (Zero, GMUT)
                        Store (Zero, GSUE)
                        Store (Zero, GSUT)
                        If (And (CHNF, One))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GMUT)
                            Or (GMUE, One, GMUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GMUE, 0x02, GMUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GMUE, 0xFD, GMUE)
                                Or (GMUE, 0x04, GMUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO0, Ones), LEqual (PIO0, Zero)))
                            {
                                If (And (LLess (DMA0, Ones), LGreater (DMA0, Zero)))
                                {
                                    Store (DMA0, PIO0)
                                    Or (GMUE, 0x80, GMUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x04))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA1, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GSUT)
                            Or (GSUE, One, GSUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GSUE, 0x02, GSUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GSUE, 0xFD, GSUE)
                                Or (GSUE, 0x04, GSUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO1, Ones), LEqual (PIO1, Zero)))
                            {
                                If (And (LLess (DMA1, Ones), LGreater (DMA1, Zero)))
                                {
                                    Store (DMA1, PIO1)
                                    Or (GSUE, 0x80, GSUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x02))
                        {
                            Or (GMUE, 0x20, GMUE)
                        }

                        If (And (CHNF, 0x08))
                        {
                            Or (GSUE, 0x20, GSUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, One)), Local0)), 
                            Local1)
                        Store (Local1, GMPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GMUE, 0x50, GMUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO1, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0)), 
                            Local1)
                        Store (Local1, GSPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GSUE, 0x50, GSUE)
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x1D) {})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Multiply (CMDC, 0x38, Local0)
                    Add (Local0, 0x08, Local1)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Multiply (CMDC, 0x07, Local0)
                    CreateByteField (ATAB, Add (Local0, 0x02), A001)
                    CreateByteField (ATAB, Add (Local0, 0x06), A005)
                    Store (Arg0, CMDX)
                    Store (Arg1, A001)
                    Store (Arg2, A005)
                    Increment (CMDC)
                }

                Method (GTF, 2, Serialized)
                {
                    Store (Arg1, Debug)
                    Store (Zero, CMDC)
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        Store (IW49, ID49)
                        CreateWordField (Arg1, 0x6A, IW53)
                        Store (IW53, ID53)
                        CreateWordField (Arg1, 0x7E, IW63)
                        Store (IW63, ID63)
                        CreateWordField (Arg1, 0x76, IW59)
                        Store (IW59, ID59)
                        CreateWordField (Arg1, 0xB0, IW88)
                        Store (IW88, ID88)
                    }

                    Store (0xA0, Local7)
                    If (Arg0)
                    {
                        Store (0xB0, Local7)
                        And (CHNF, 0x08, IRDY)
                        If (And (CHNF, 0x10))
                        {
                            Store (PIO1, PIOT)
                        }
                        Else
                        {
                            Store (PIO0, PIOT)
                        }

                        If (And (CHNF, 0x04))
                        {
                            If (And (CHNF, 0x10))
                            {
                                Store (DMA1, DMAT)
                            }
                            Else
                            {
                                Store (DMA0, DMAT)
                            }
                        }
                    }
                    Else
                    {
                        And (CHNF, 0x02, IRDY)
                        Store (PIO0, PIOT)
                        If (And (CHNF, One))
                        {
                            Store (DMA0, DMAT)
                        }
                    }

                    If (LAnd (LAnd (And (ID53, 0x04), And (ID88, 0xFF00
                        )), DMAT))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMAT, MTR, 
                            Zero, Zero), Local1)
                        If (LGreater (Local1, 0x05))
                        {
                            Store (0x05, Local1)
                        }

                        GTFB (AT01, Or (0x40, Local1), Local7)
                    }
                    Else
                    {
                        If (LAnd (And (ID63, 0xFF00), PIOT))
                        {
                            And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                                Zero, Zero), 0x03, Local0)
                            Or (0x20, DerefOf (Index (DerefOf (Index (TIM0, 0x07)), Local0
                                )), Local1)
                            GTFB (AT01, Local1, Local7)
                        }
                    }

                    If (IRDY)
                    {
                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Or (0x08, DerefOf (Index (DerefOf (Index (TIM0, 0x06)), Local0
                            )), Local1)
                        GTFB (AT01, Local1, Local7)
                    }
                    Else
                    {
                        If (And (ID49, 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    If (LAnd (And (ID59, 0x0100), And (ID59, 0xFF)))
                    {
                        GTFB (AT03, And (ID59, 0xFF), Local7)
                    }

                    Store (ATAB, Debug)
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Store (RETB, Debug)
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (SMIO, SystemIO, SMBS, SMBL)
                Field (SMIO, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                    HCNT,   8, 
                    HCMD,   8, 
                    TSAD,   8, 
                    HDT0,   8, 
                    HDT1,   8, 
                    HBDT,   8, 
                    RSAD,   8, 
                    RSDA,   16, 
                    AUST,   8, 
                    AUCT,   8, 
                    SMLP,   8, 
                    SMBP,   8, 
                    SSTS,   8, 
                    SCMD,   8, 
                    NDAD,   8, 
                    NDLB,   8, 
                    NDHB,   8
                }

                Method (SMCS, 0, NotSerialized)
                {
                    Store (0x20, HSTS)
                }

                Scope (\_GPE)
                {
                    Method (_L07, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        Store (0x20, \_SB.PCI0.SMB.HSTS)
                    }

                    Method (_L1B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        Store (0x20, \_SB.PCI0.SMB.HSTS)
                    }
                }
            }

            Device (P0PA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0A)
                    }

                    Return (PR0A)
                }
            }

            Device (NPE1)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR11)
                    }

                    Return (PR11)
                }

                Device (BR1B)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                    {
                        If (PICM)
                        {
                            Return (AR1B)
                        }

                        Return (PR1B)
                    }

                    Device (BR1C)
                    {
                        Name (_ADR, 0x00080000)  // _ADR: Address
                        Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                        {
                            If (PICM)
                            {
                                Return (AR1C)
                            }

                            Return (PR1C)
                        }
                    }
                }
            }

            Device (NPE4)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE5)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE6)
            {
                Name (_ADR, 0x00020003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE7)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR17)
                    }

                    Return (PR17)
                }
            }

            Device (NPE8)
            {
                Name (_ADR, 0x00030001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE9)
            {
                Name (_ADR, 0x00030002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPEA)
            {
                Name (_ADR, 0x00030003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR03)
                    }

                    Return (PR03)
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }
            }

            Device (PEX6)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR07)
                    }

                    Return (PR07)
                }

                Device (PXE2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x09, 0x04))
                    }
                }

                Device (GBE2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x09, 0x04))
                    }
                }
            }

            Device (PEX7)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR08)
                    }

                    Return (PR08)
                }
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1) // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)  
                            {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }})
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR36)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR37)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x03))
                }
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer(0x10) {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }})
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x30, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 00     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x30, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 00     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x30, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 00     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package() { Buffer (0x10)  // _PLD: Physical Location of Device
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x30, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 00     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 07     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            } })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x03))
                }
            }

            Device (GBE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (PXE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (NPE2)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR12)
                    }

                    Return (PR12)
                }
            }

            Device (NPE3)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR13)
                    }

                    Return (PR13)
                }
            }
        }

        Device (PCI1)
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN20, 0, NotSerialized)
            {
                Return (0x20)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN20 ())
            }

            Name (_UID, 0x20)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR20)
                }

                Return (PR20)
            }

            Name (CPRB, Zero)
            Name (LVGA, 0x00)
            Name (STAV, 0x00)
            Name (BRB, 0x0000)
            Name (BRL, 0x003F)
            Name (IOB, 0x0000)
            Name (IOL, 0x0000)
            Name (MBB, 0x00000000)
            Name (MBL, 0x00000000)
            Name (MABL, 0x00000000)
            Name (MABH, 0x00000000)
            Name (MALL, 0x00000000)
            Name (MALH, 0x00000000)
            Name (MAML, 0x00000000)
            Name (MAMH, 0x00000000)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y23)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x03AF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x03B0,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y25, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y24, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y26, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDE00000,         // Length
                    ,, _Y27, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y28, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y29)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y2B, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y2A, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y2C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y2D, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y2E, AddressRangeMemory, TypeStatic)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (STAV)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI1._Y23._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI1._Y23._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI1._Y23._LEN, LEN0)  // _LEN: Length
                    Store (BRB, MIN0)
                    Store (BRL, LEN0)
                    Store (LEN0, Local0)
                    Add (MIN0, Decrement (Local0), MAX0)
                    CreateWordField (CRS1, \_SB.PCI1._Y24._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI1._Y24._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI1._Y24._LEN, LEN1)  // _LEN: Length
                    If (LEqual (IOB, 0x1000))
                    {
                        Store (IOL, Local0)
                        Add (IOB, Decrement (Local0), MAX1)
                        Subtract (MAX1, MIN1, Local0)
                        Add (Local0, One, LEN1)
                    }
                    Else
                    {
                        Store (IOB, MIN1)
                        Store (IOL, LEN1)
                        Store (LEN1, Local0)
                        Add (MIN1, Decrement (Local0), MAX1)
                    }

                    If (LOr (LEqual (LVGA, One), LEqual (LVGA, 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI1._Y25._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI1._Y25._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI1._Y25._LEN, ILN1)  // _LEN: Length
                            Store (0x03B0, IMN1)
                            Store (0x03DF, IMX1)
                            Store (0x30, ILN1)
                            CreateDWordField (CRS1, \_SB.PCI1._Y26._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI1._Y26._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI1._Y26._LEN, VLN1)  // _LEN: Length
                            Store (0x000A0000, VMN1)
                            Store (0x000BFFFF, VMX1)
                            Store (0x00020000, VLN1)
                            Store (Zero, VGAF)
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI1._Y27._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI1._Y27._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI1._Y27._LEN, LEN3)  // _LEN: Length
                    Store (MBB, MIN3)
                    Store (MBL, LEN3)
                    Store (LEN3, Local0)
                    Add (MIN3, Decrement (Local0), MAX3)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS1, \_SB.PCI1._Y28._MIN, MN8L)  // _MIN: Minimum Base Address
                        Add (0xB4, 0x04, Local0)
                        CreateDWordField (CRS1, Local0, MN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        CreateDWordField (CRS1, \_SB.PCI1._Y28._MAX, MX8L)  // _MAX: Maximum Base Address
                        Add (0xBC, 0x04, Local1)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateDWordField (CRS1, \_SB.PCI1._Y28._LEN, LN8L)  // _LEN: Length
                        Add (0xCC, 0x04, Local2)
                        CreateDWordField (CRS1, Local2, LN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        Store (MALL, LN8L)
                        Store (MALH, LN8H)
                        Store (MAML, MX8L)
                        Store (MAMH, MX8H)
                    }

                    Return (CRS1)
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI1._Y29._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI1._Y29._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI1._Y29._LEN, LEN2)  // _LEN: Length
                    Store (BRB, MIN2)
                    Store (BRL, LEN2)
                    Store (LEN2, Local1)
                    Add (MIN2, Decrement (Local1), MAX2)
                    CreateWordField (CRS2, \_SB.PCI1._Y2A._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI1._Y2A._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI1._Y2A._LEN, LEN4)  // _LEN: Length
                    Store (IOB, MIN4)
                    Store (IOL, LEN4)
                    Store (LEN4, Local1)
                    Add (MIN4, Decrement (Local1), MAX4)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI1._Y2B._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI1._Y2B._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI1._Y2B._LEN, ILN2)  // _LEN: Length
                        Store (0x03B0, IMN2)
                        Store (0x03DF, IMX2)
                        Store (0x30, ILN2)
                        CreateDWordField (CRS2, \_SB.PCI1._Y2C._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI1._Y2C._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI1._Y2C._LEN, VLN2)  // _LEN: Length
                        Store (0x000A0000, VMN2)
                        Store (0x000BFFFF, VMX2)
                        Store (0x00020000, VLN2)
                    }

                    CreateDWordField (CRS2, \_SB.PCI1._Y2D._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI1._Y2D._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI1._Y2D._LEN, LEN5)  // _LEN: Length
                    Store (MBB, MIN5)
                    Store (MBL, LEN5)
                    Store (LEN5, Local1)
                    Add (MIN5, Decrement (Local1), MAX5)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS2, \_SB.PCI1._Y2E._MIN, MN9L)  // _MIN: Minimum Base Address
                        Add (0x72, 0x04, Local0)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateDWordField (CRS2, \_SB.PCI1._Y2E._MAX, MX9L)  // _MAX: Maximum Base Address
                        Add (0x7A, 0x04, Local1)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateDWordField (CRS2, \_SB.PCI1._Y2E._LEN, LN9L)  // _LEN: Length
                        Add (0x8A, 0x04, Local2)
                        CreateDWordField (CRS2, Local2, LN9H)
                        Store (MABL, MN9L)
                        Store (MABH, MN9H)
                        Store (MALL, LN9L)
                        Store (MALH, LN9H)
                        Store (MAML, MX9L)
                        Store (MAMH, MX9H)
                    }

                    Return (CRS2)
                }
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                            /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (PEHP))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (SHPC))
                    {
                        And (CTRL, 0x1D, CTRL)
                    }

                    If (LNot (PEPM))
                    {
                        And (CTRL, 0x1B, CTRL)
                    }

                    If (LNot (PEER))
                    {
                        And (CTRL, 0x15, CTRL)
                    }

                    If (LNot (PECS))
                    {
                        And (CTRL, 0x0F, CTRL)
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }

            Name (_PXM, One)  // _PXM: Device Proximity
            Method (BN20, 0, NotSerialized)
            {
                Return (BRB)
            }

            Method (BN40, 0, NotSerialized)
            {
                Return (BRB)
            }

            Method (BN80, 0, NotSerialized)
            {
                Return (BRB)
            }

            Device (IOH1)
            {
                Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                })
            }

            Device (^UNC1)
            {
                Name (_HID, EisaId ("PNP0A03"))  // _HID: Hardware ID
                Method (_UID, 0, NotSerialized)  // _UID: Unique ID
                {
                    Add (^^PCI1.BRB, ^^PCI1.BRL, Local0)
                    Return (Local0)
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Add (^^PCI1.BRB, ^^PCI1.BRL, Local0)
                    Return (Local0)
                }

                Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
                {
                    Return (Arg3)
                }

                Name (_ADR, Zero)  // _ADR: Address
                Name (_PXM, One)  // _PXM: Device Proximity
                Name (CRS1, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x00FF,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0001,             // Length
                        ,, _Y2F)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Add (^^PCI1.BRB, ^^PCI1.BRL, Local0)
                    CreateDWordField (CRS1, \_SB.UNC1._Y2F._MIN, UMIN)  // _MIN: Minimum Base Address
                    Store (Local0, UMIN)
                    CreateDWordField (CRS1, \_SB.UNC1._Y2F._MAX, UMAX)  // _MAX: Maximum Base Address
                    Store (Local0, UMAX)
                    Return (CRS1)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (^^PCI1.STAV)
                }
            }

            Device (VTDR)
            {
                Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly,
                        0x00000000,         // Address Base
                        0x00002000,         // Address Length
                        _Y30)
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (VTD1, 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (BUF0, \_SB.PCI1.VTDR._Y30._BAS, VBR1)  // _BAS: Base Address
                    CreateDWordField (BUF0, \_SB.PCI1.VTDR._Y30._LEN, VLT1)  // _LEN: Length
                    Store (VTD1, VBR1)
                    If (LEqual (VTD1, 0xFFFFFFFF))
                    {
                        Store (Zero, VLT1)
                    }

                    Return (BUF0)
                }
            }

            Device (NPE0)
            {
                Name (_ADR, Zero)  // _ADR: Address
            }

            Device (NPE1)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
            }

            Device (NPE2)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
            }

            Device (NPE3)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
            }

            Device (NPE4)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
            }

            Device (NPE5)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
            }

            Device (NPE6)
            {
                Name (_ADR, 0x00020003)  // _ADR: Address
            }

            Device (NPE7)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
            }

            Device (NPE8)
            {
                Name (_ADR, 0x00030001)  // _ADR: Address
            }

            Device (NPE9)
            {
                Name (_ADR, 0x00030002)  // _ADR: Address
            }

            Device (NPEA)
            {
                Name (_ADR, 0x00030003)  // _ADR: Address
            }
        }

        Scope (\_GPE)
        {
            Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                \_SB.PCI0.SBRG.SIOH ()
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                \_SB.PCI0.SBRG.SIOH ()
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0P9, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.NPE1, 0x02)
                Notify (\_SB.PCI0.NPE4, 0x02)
                Notify (\_SB.PCI0.NPE5, 0x02)
                Notify (\_SB.PCI0.NPE6, 0x02)
                Notify (\_SB.PCI0.NPE7, 0x02)
                Notify (\_SB.PCI0.NPE8, 0x02)
                Notify (\_SB.PCI0.NPE9, 0x02)
                Notify (\_SB.PCI0.NPEA, 0x02)
                Notify (\_SB.PCI0.PEX0, 0x02)
                Notify (\_SB.PCI0.PEX1, 0x02)
                Notify (\_SB.PCI0.PEX2, 0x02)
                Notify (\_SB.PCI0.PEX3, 0x02)
                Notify (\_SB.PCI0.PEX4, 0x02)
                Notify (\_SB.PCI0.PEX5, 0x02)
                Notify (\_SB.PCI0.PEX6, 0x02)
                Notify (\_SB.PCI0.PEX6.PXE2, 0x02)
                Notify (\_SB.PCI0.PEX6.GBE2, 0x02)
                Notify (\_SB.PCI0.PEX7, 0x02)
                Notify (\_SB.PCI0.NPE2, 0x02)
                Notify (\_SB.PCI0.NPE3, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.EUSB, 0x02)
                Notify (\_SB.PCI0.USBE, 0x02)
                Notify (\_SB.PCI0.GBE, 0x02)
                Notify (\_SB.PCI0.PXE, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x1D, 0x03))
            }
        }
    }

    OperationRegion (_SB.PCI0.SBRG.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.SBRG.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
        Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, IRA0)
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRA, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRA, 0x80, PIRA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRA, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRA)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRB, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRB, 0x80, PIRB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRB, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRB)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRC, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRC, 0x80, PIRC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRC, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRC)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRD, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRD, 0x80, PIRD)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRD, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRD)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRE, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRE, 0x80, PIRE)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRE, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRF, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRF, 0x80, PIRF)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRF, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRG, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRG, 0x80, PIRG)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRG, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                And (PIRH, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (PIRH, 0x80, PIRH)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (PIRH, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }
    }

    Scope (_SB.PCI0.SBRG)
    {
        Method (SIOH, 0, NotSerialized)
        {
            If (And (PMFG, 0x08))
            {
                Notify (PS2K, 0x02)
            }

            If (And (PMFG, 0x10))
            {
                Notify (PS2M, 0x02)
            }
        }
    }

    OperationRegion (_SB.PCI0.SBRG.LPCR, PCI_Config, 0x80, 0x04)
    Field (\_SB.PCI0.SBRG.LPCR, ByteAcc, NoLock, Preserve)
    {
        CADR,   3, 
            ,   1, 
        CBDR,   3, 
        Offset (0x01), 
        LTDR,   2, 
            ,   2, 
        FDDR,   1, 
        Offset (0x02), 
        CALE,   1, 
        CBLE,   1, 
        LTLE,   1, 
        FDLE,   1, 
        Offset (0x03), 
        GLLE,   1, 
        GHLE,   1, 
        KCLE,   1, 
        MCLE,   1, 
        C1LE,   1, 
        C2LE,   1, 
        Offset (0x04)
    }

    Method (UXDV, 1, NotSerialized)
    {
        Store (0xFF, Local0)
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
        Store (Add (Arg0, Zero), _T_0)
        If (LEqual (_T_0, 0x03F8))
        {
            Store (Zero, Local0)
        }
        Else
        {
            If (LEqual (_T_0, 0x02F8))
            {
                Store (One, Local0)
            }
            Else
            {
                If (LEqual (_T_0, 0x0220))
                {
                    Store (0x02, Local0)
                }
                Else
                {
                    If (LEqual (_T_0, 0x0228))
                    {
                        Store (0x03, Local0)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x0238))
                        {
                            Store (0x04, Local0)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02E8))
                            {
                                Store (0x05, Local0)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x0338))
                                {
                                    Store (0x06, Local0)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03E8))
                                    {
                                        Store (0x07, Local0)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Return (Local0)
    }

    Method (RRIO, 4, NotSerialized)
    {
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
        Store (Add (Arg0, Zero), _T_0)
        If (LEqual (_T_0, Zero))
        {
            Store (Zero, CALE)
            Store (UXDV (Arg2), Local0)
            If (LNotEqual (Local0, 0xFF))
            {
                Store (Local0, CADR)
            }

            If (Arg1)
            {
                Store (One, CALE)
            }
        }
        Else
        {
            If (LEqual (_T_0, One))
            {
                Store (Zero, CBLE)
                Store (UXDV (Arg2), Local0)
                If (LNotEqual (Local0, 0xFF))
                {
                    Store (Local0, CBDR)
                }

                If (Arg1)
                {
                    Store (One, CBLE)
                }
            }
            Else
            {
                If (LEqual (_T_0, 0x02))
                {
                    Store (Zero, LTLE)
                    If (LEqual (Arg2, 0x0378))
                    {
                        Store (Zero, LTDR)
                    }

                    If (LEqual (Arg2, 0x0278))
                    {
                        Store (One, LTDR)
                    }

                    If (LEqual (Arg2, 0x03BC))
                    {
                        Store (0x02, LTDR)
                    }

                    If (Arg1)
                    {
                        Store (One, LTLE)
                    }
                }
                Else
                {
                    If (LEqual (_T_0, 0x03))
                    {
                        Store (Zero, FDLE)
                        If (LEqual (Arg2, 0x03F0))
                        {
                            Store (Zero, FDDR)
                        }

                        If (LEqual (Arg2, 0x0370))
                        {
                            Store (One, FDDR)
                        }

                        If (Arg1)
                        {
                            Store (One, FDLE)
                        }
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x08))
                        {
                            If (LEqual (Arg2, 0x0200))
                            {
                                If (Arg1)
                                {
                                    Store (One, GLLE)
                                }
                                Else
                                {
                                    Store (Zero, GLLE)
                                }
                            }

                            If (LEqual (Arg2, 0x0208))
                            {
                                If (Arg1)
                                {
                                    Store (One, GHLE)
                                }
                                Else
                                {
                                    Store (Zero, GHLE)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x09))
                            {
                                If (LEqual (Arg2, 0x0200))
                                {
                                    If (Arg1)
                                    {
                                        Store (One, GLLE)
                                    }
                                    Else
                                    {
                                        Store (Zero, GLLE)
                                    }
                                }

                                If (LEqual (Arg2, 0x0208))
                                {
                                    If (Arg1)
                                    {
                                        Store (One, GHLE)
                                    }
                                    Else
                                    {
                                        Store (Zero, GHLE)
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x0A))
                                {
                                    If (LOr (LEqual (Arg2, 0x60), LEqual (Arg2, 0x64)))
                                    {
                                        If (Arg1)
                                        {
                                            Store (One, KCLE)
                                        }
                                        Else
                                        {
                                            Store (Zero, KCLE)
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x0B))
                                    {
                                        If (LOr (LEqual (Arg2, 0x62), LEqual (Arg2, 0x66)))
                                        {
                                            If (Arg1)
                                            {
                                                Store (One, MCLE)
                                            }
                                            Else
                                            {
                                                Store (Zero, MCLE)
                                            }
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0C))
                                        {
                                            If (LEqual (Arg2, 0x2E))
                                            {
                                                If (Arg1)
                                                {
                                                    Store (One, C1LE)
                                                }
                                                Else
                                                {
                                                    Store (Zero, C1LE)
                                                }
                                            }

                                            If (LEqual (Arg2, 0x4E))
                                            {
                                                If (Arg1)
                                                {
                                                    Store (One, C2LE)
                                                }
                                                Else
                                                {
                                                    Store (Zero, C2LE)
                                                }
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0D))
                                            {
                                                If (LEqual (Arg2, 0x2E))
                                                {
                                                    If (Arg1)
                                                    {
                                                        Store (One, C1LE)
                                                    }
                                                    Else
                                                    {
                                                        Store (Zero, C1LE)
                                                    }
                                                }

                                                If (LEqual (Arg2, 0x4E))
                                                {
                                                    If (Arg1)
                                                    {
                                                        Store (One, C2LE)
                                                    }
                                                    Else
                                                    {
                                                        Store (Zero, C2LE)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Method (RDMA, 3, NotSerialized)
    {
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                Name (CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y31)
                })
                OperationRegion (HCNT, SystemMemory, HPTC, 0x04)
                Field (HCNT, DWordAcc, NoLock, Preserve)
                {
                    HPTS,   2, 
                        ,   5, 
                    HPTE,   1
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (HPTE)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (CRS, \_SB.PCI0.HPET._Y31._BAS, HTBS)  // _BAS: Base Address
                    Multiply (HPTS, 0x1000, Local0)
                    Add (Local0, 0xFED00000, HTBS)
                    Return (CRS)
                }
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Store (Arg0, DBG8)
        If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (Zero, AAXB)
        Store (One, \_SB.SLPS)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        ShiftLeft (Arg0, 0x04, DBG8)
        WAK (Arg0)
        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Return (WAKP)
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
    }

    Device (_SB.PCI0.SBRG.TPM)
    {
        Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
        {
            If (TCMF) {}
            Else
            {
                Return (0x310CD041)
            }
        }

        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)
        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            ACCS,   8, 
            Offset (0x18), 
            TSTA,   8, 
            TBCA,   8, 
            Offset (0xF00), 
            TVID,   16, 
            TDID,   16
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LEqual (VIDT, 0x8086))
            {
                Return (Zero)
            }
            Else
            {
                If (TPMF)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.SBRG.TPM)
    {
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */   0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E,
                        /* 0008 */   0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    }))
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                Store (ToInteger (Arg2), _T_0)
                If (LEqual (_T_0, Zero))
                {
                    Return (Buffer (0x02)
                    {
                         0xFF, 0x01
                    })
                }
                Else
                {
                    If (LEqual (_T_0, One))
                    {
                        Return ("1.2")
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                            Store (0x12, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Store (TMF2, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            If (LEqual (DAT, 0xF1))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Name (PPI1, Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                                Store (0x11, DAT)
                                Store (OFST, INQ)
                                If (LEqual (DAT, 0xFF))
                                {
                                    Return (One)
                                }

                                Store (DAT, Index (PPI1, One))
                                Return (PPI1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Return (TRST)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Name (PPI2, Package (0x03)
                                        {
                                            Zero, 
                                            Zero, 
                                            Zero
                                        })
                                        Store (0x21, DAT)
                                        Store (OFST, INQ)
                                        Store (DAT, Index (PPI2, One))
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        Store (DAT, Index (PPI2, One))
                                        Store (0x31, DAT)
                                        Store (OFST, INQ)
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        If (LEqual (DAT, 0xFFF0))
                                        {
                                            Store (0xFFFFFFF0, Index (PPI2, 0x02))
                                        }
                                        Else
                                        {
                                            If (LEqual (DAT, 0xFFF1))
                                            {
                                                Store (0xFFFFFFF1, Index (PPI2, 0x02))
                                            }
                                            Else
                                            {
                                                Store (DAT, Index (PPI2, 0x02))
                                            }
                                        }

                                        Return (PPI2)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Return (0x03)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x07))
                                            {
                                                ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                                                Store (0x12, TMF1)
                                                Store (TMF1, DAT)
                                                Store (OFST, INQ)
                                                If (LEqual (DAT, 0xFF))
                                                {
                                                    Return (0x02)
                                                }

                                                Store (TMF2, DAT)
                                                Store (OFST, INQ)
                                                If (LEqual (DAT, 0xFF))
                                                {
                                                    Return (0x02)
                                                }

                                                If (LEqual (DAT, 0xF1))
                                                {
                                                    Return (One)
                                                }

                                                Return (Zero)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x08))
                                                {
                                                    ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                                                    Store (0x43, TMF1)
                                                    Store (TMF1, DAT)
                                                    Store (OFST, INQ)
                                                    Store (TMF2, DAT)
                                                    Store (OFST, INQ)
                                                    Return (DAT)
                                                }
                                                Else
                                                {
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46,
                            /* 0008 */   0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                        }))
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                    Store (ToInteger (Arg2), _T_1)
                    If (LEqual (_T_1, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }
                    Else
                    {
                        If (LEqual (_T_1, One))
                        {
                            Store (0x22, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Return (Buffer (One)
            {
                 0x00
            })
        }
    }

    Scope (_SB.PCI0)
    {
        OperationRegion (ITPD, PCI_Config, 0xE8, 0x04)
        Field (ITPD, DWordAcc, NoLock, Preserve)
        {
                ,   15, 
            TPDI,   1
        }

        OperationRegion (TVID, SystemMemory, 0xFED40F00, 0x02)
        Field (TVID, WordAcc, NoLock, Preserve)
        {
            VIDT,   16
        }
    }

    Device (_SB.PCI0.ITPM)
    {
        Name (_HID, "INTC0102")  // _HID: Hardware ID
        Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        OperationRegion (TPMR, SystemMemory, 0xFED40000, 0x5000)
        Field (TPMR, AnyAcc, NoLock, Preserve)
        {
            ACC0,   8
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LNotEqual (ACC0, 0xFF))
            {
                If (LEqual (VIDT, 0x8086))
                {
                    If (TPMF)
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }

            Return (Zero)
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */   0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E,
                        /* 0008 */   0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    }))
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                Store (ToInteger (Arg2), _T_0)
                If (LEqual (_T_0, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x7F
                    })
                }
                Else
                {
                    If (LEqual (_T_0, One))
                    {
                        Return ("1.0")
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                            Store (0x12, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Store (TMF2, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Name (PPI1, Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                                Store (0x11, DAT)
                                Store (OFST, INQ)
                                If (LEqual (DAT, 0xFF))
                                {
                                    Return (One)
                                }

                                Store (DAT, Index (PPI1, One))
                                Return (PPI1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Name (PPI2, Package (0x03)
                                        {
                                            Zero, 
                                            Zero, 
                                            Zero
                                        })
                                        Store (0x21, DAT)
                                        Store (OFST, INQ)
                                        Store (DAT, Index (PPI2, One))
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        Store (DAT, Index (PPI2, One))
                                        Store (0x31, DAT)
                                        Store (OFST, INQ)
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        If (LEqual (DAT, 0xFFF0))
                                        {
                                            Store (0xFFFFFFF0, Index (PPI2, 0x02))
                                        }
                                        Else
                                        {
                                            If (LEqual (DAT, 0xFFF1))
                                            {
                                                Store (0xFFFFFFF1, Index (PPI2, 0x02))
                                            }
                                            Else
                                            {
                                                Store (DAT, Index (PPI2, 0x02))
                                            }
                                        }

                                        Return (PPI2)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Return (Zero)
                                        }
                                        Else
                                        {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46,
                            /* 0008 */   0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                        }))
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                    Store (ToInteger (Arg2), _T_1)
                    If (LEqual (_T_1, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }
                    Else
                    {
                        If (LEqual (_T_1, One))
                        {
                            Store (0x22, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Return (Buffer (One)
            {
                 0x00
            })
        }
    }

    Method (WOSC, 4, NotSerialized)
    {
        CreateDWordField (Arg3, Zero, CDW1)
        If (LEqual (Arg0, Buffer (0x10)
                {
                    /* 0000 */   0x0C, 0x5E, 0x85, 0xED, 0x90, 0x6C, 0xBF, 0x47,
                    /* 0008 */   0xA6, 0x2A, 0x26, 0xDE, 0x0F, 0xC5, 0xAD, 0x5C
                }))
        {
            CreateDWordField (Arg3, 0x04, CDW2)
            CreateDWordField (Arg3, 0x08, CDW3)
            If (WHEA)
            {
                If (And (CDW2, One))
                {
                    Return (One)
                }
            }
        }
        Else
        {
            Or (CDW1, 0x04, CDW1)
        }

        Return (Zero)
    }

    Scope (_SB)
    {
        Name (\PETE, Zero)
        Name (\PSTE, Zero)
        Name (\TSTE, Zero)
        Name (\NPB0, One)
        Name (\NPB1, Zero)
        Name (\NPB2, Zero)
        Name (\NPB3, Zero)
        Name (P0ID, Zero)
        Name (P1ID, 0x20)
        Name (P2ID, 0x40)
        Name (P3ID, 0x60)
        Name (P0BM, 0x00000055)
        Name (P1BM, 0x00000000)
        Name (P2BM, 0x00000000)
        Name (P3BM, 0x00000000)
        Name (CUU0, Zero)
        Name (CUU1, Zero)
        Name (CUU2, Zero)
        Name (CUU3, Zero)
        Method (PSTA, 1, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                If (NPB0)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If (LEqual (Arg0, One))
            {
                If (NPB1)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If (LEqual (Arg0, 0x02))
            {
                If (NPB2)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If (LEqual (Arg0, 0x03))
            {
                If (NPB3)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Return (Zero)
        }

        Method (CSTA, 2, NotSerialized)
        {
            Store (Zero, Local0)
            If (LEqual (Arg0, Zero))
            {
                ShiftRight (P0BM, Arg1, Local0)
            }

            If (LEqual (Arg0, One))
            {
                ShiftRight (P1BM, Arg1, Local0)
            }

            If (LEqual (Arg0, 0x02))
            {
                ShiftRight (P2BM, Arg1, Local0)
            }

            If (LEqual (Arg0, 0x03))
            {
                ShiftRight (P3BM, Arg1, Local0)
            }

            And (Local0, One, Local0)
            If (LEqual (Local0, Zero))
            {
                Return (Zero)
            }
            Else
            {
                Return (One)
            }
        }

        Processor (C000, 0x00, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP000")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, Zero), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C001, 0x80, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP001")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, One), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C002, 0x01, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP002")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x02), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C003, 0x81, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP003")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x03), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C004, 0x02, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP004")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x04), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C005, 0x82, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP005")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x05), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C006, 0x03, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP006")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x06), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C007, 0x83, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP007")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x07), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C008, 0x84, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP008")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x08), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C009, 0x85, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP009")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x09), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C00A, 0x86, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP00A")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x0A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C00B, 0x87, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP00B")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x0B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C00C, 0x88, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP00C")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x0C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C00D, 0x89, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP00D")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x0D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C00E, 0x8A, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP00E")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x0E), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C00F, 0x8B, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP00F")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x0F), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C010, 0x8C, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP010")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x10), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C011, 0x8D, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP011")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x11), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C012, 0x8E, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP012")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x12), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C013, 0x8F, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP013")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x13), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C014, 0x90, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP014")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x14), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C015, 0x91, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP015")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x15), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C016, 0x92, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP016")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x16), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C017, 0x93, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP017")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x17), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C018, 0x94, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP018")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x18), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C019, 0x95, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP019")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x19), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C01A, 0x96, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP01A")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x1A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C01B, 0x97, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP01B")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x1B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C01C, 0x98, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP01C")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x1C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C01D, 0x99, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI0-CP01D")  // _UID: Unique ID
            Name (_PXM, Zero)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (Zero, 0x1D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C100, 0x9A, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP100")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, Zero), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C101, 0x9B, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP101")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, One), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C102, 0x9C, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP102")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x02), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C103, 0x9D, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP103")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x03), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C104, 0x9E, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP104")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x04), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C105, 0x9F, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP105")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x05), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C106, 0xA0, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP106")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x06), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C107, 0xA1, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP107")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x07), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C108, 0xA2, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP108")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x08), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C109, 0xA3, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP109")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x09), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C10A, 0xA4, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP10A")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x0A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C10B, 0xA5, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP10B")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x0B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C10C, 0xA6, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP10C")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x0C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C10D, 0xA7, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP10D")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x0D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C10E, 0xA8, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP10E")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x0E), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C10F, 0xA9, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP10F")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x0F), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C110, 0xAA, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP110")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x10), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C111, 0xAB, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP111")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x11), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C112, 0xAC, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP112")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x12), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C113, 0xAD, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP113")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x13), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C114, 0xAE, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP114")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x14), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C115, 0xAF, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP115")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x15), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C116, 0xB0, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP116")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x16), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C117, 0xB1, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP117")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x17), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C118, 0xB2, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP118")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x18), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C119, 0xB3, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP119")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x19), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C11A, 0xB4, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP11A")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x1A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C11B, 0xB5, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP11B")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x1B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C11C, 0xB6, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP11C")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x1C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C11D, 0xB7, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI1-CP11D")  // _UID: Unique ID
            Name (_PXM, One)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (One, 0x1D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C200, 0xB8, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP200")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, Zero), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C201, 0xB9, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP201")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, One), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C202, 0xBA, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP202")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x02), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C203, 0xBB, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP203")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x03), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C204, 0xBC, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP204")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x04), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C205, 0xBD, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP205")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x05), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C206, 0xBE, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP206")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x06), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C207, 0xBF, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP207")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x07), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C208, 0xC0, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP208")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x08), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C209, 0xC1, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP209")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x09), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C20A, 0xC2, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP20A")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x0A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C20B, 0xC3, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP20B")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x0B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C20C, 0xC4, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP20C")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x0C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C20D, 0xC5, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP20D")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x0D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C20E, 0xC6, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP20E")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x0E), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C20F, 0xC7, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP20F")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x0F), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C210, 0xC8, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP210")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x10), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C211, 0xC9, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP211")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x11), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C212, 0xCA, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP212")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x12), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C213, 0xCB, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP213")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x13), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C214, 0xCC, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP214")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x14), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C215, 0xCD, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP215")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x15), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C216, 0xCE, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP216")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x16), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C217, 0xCF, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP217")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x17), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C218, 0xD0, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP218")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x18), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C219, 0xD1, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP219")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x19), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C21A, 0xD2, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP21A")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x1A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C21B, 0xD3, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP21B")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x1B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C21C, 0xD4, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP21C")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x1C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C21D, 0xD5, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI2-CP21D")  // _UID: Unique ID
            Name (_PXM, 0x02)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x02, 0x1D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C300, 0xD6, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP300")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, Zero), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C301, 0xD7, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP301")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, One), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C302, 0xD8, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP302")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x02), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C303, 0xD9, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP303")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x03), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C304, 0xDA, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP304")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x04), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C305, 0xDB, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP305")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x05), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C306, 0xDC, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP306")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x06), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C307, 0xDD, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP307")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x07), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C308, 0xDE, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP308")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x08), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C309, 0xDF, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP309")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x09), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C30A, 0xE0, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP30A")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x0A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C30B, 0xE1, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP30B")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x0B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C30C, 0xE2, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP30C")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x0C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C30D, 0xE3, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP30D")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x0D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C30E, 0xE4, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP30E")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x0E), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C30F, 0xE5, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP30F")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x0F), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C310, 0xE6, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP310")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x10), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C311, 0xE7, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP311")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x11), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C312, 0xE8, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP312")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x12), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C313, 0xE9, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP313")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x13), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C314, 0xEA, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP314")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x14), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C315, 0xEB, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP315")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x15), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C316, 0xEC, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP316")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x16), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C317, 0xED, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP317")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x17), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C318, 0xEE, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP318")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x18), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C319, 0xEF, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP319")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x19), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C31A, 0xF0, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP31A")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x1A), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C31B, 0xF1, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP31B")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x1B), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C31C, 0xF2, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP31C")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x1C), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Processor (C31D, 0xF3, 0x00000410, 0x06)
        {
            Name (_HID, "ACPI0007")  // _HID: Hardware ID
            Name (_UID, "PCI3-CP31D")  // _UID: Unique ID
            Name (_PXM, 0x03)  // _PXM: Device Proximity
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (CSTA (0x03, 0x1D), Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }

    Method (RPOP, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x05))
        {
            Store (WVAL, SMIR)
        }
    }

    OperationRegion (APMP, SystemIO, SMIB, One)
    Field (APMP, ByteAcc, NoLock, Preserve)
    {
        SMIR,   8
    }

    Device (VIRD)
    {
        Name (_HID, "LBAI0100")  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (VDFG)
            {
                Return (0x0F)
            }

            Return (Zero)
        }
    }

    Name (WMIO, 0x7BB51C18)
    OperationRegion (SMI1, SystemIO, SMIB, 0x04)
    Field (SMI1, DWordAcc, NoLock, Preserve)
    {
        APM2,   32
    }

    OperationRegion (WMIN, SystemMemory, WMIO, 0x0A)
    Field (WMIN, AnyAcc, NoLock, Preserve)
    {
        CMD7,   8, 
        STUS,   8, 
        DATA,   64
    }

    OperationRegion (IO80, SystemIO, 0x80, One)
    Field (IO80, ByteAcc, NoLock, Preserve)
    {
        DBGP,   8
    }

    OperationRegion (SMI0, SystemIO, SMIB, One)
    Field (SMI0, ByteAcc, NoLock, Preserve)
    {
        APMC,   8
    }

    OperationRegion (WMIM, SystemMemory, WMIO, WMSZ)
    Field (WMIM, AnyAcc, NoLock, Preserve)
    {
        CMD,    8, 
        ERR,    32, 
        PAR0,   32, 
        PAR1,   32, 
        PAR2,   32, 
        PAR3,   32
    }

    Field (WMIM, ByteAcc, NoLock, Preserve)
    {
        Offset (0x15), 
        WITM,   8, 
        WSEL,   8, 
        WLS0,   8, 
        WLS1,   8, 
        WLS2,   8, 
        WLS3,   8, 
        WLS4,   8, 
        WLS5,   8, 
        WLS6,   8, 
        WLS7,   8, 
        WLS8,   8, 
        WLS9,   8, 
        WLSA,   8, 
        WLSB,   8, 
        WLSC,   8, 
        WLSD,   8, 
        WLSE,   8, 
        WLSF,   8, 
        WLSG,   8, 
        WLSH,   8, 
        WLSI,   8, 
        WLSJ,   8, 
        WLSK,   8, 
        WLSL,   8, 
        WLSM,   8, 
        WLSN,   8, 
        INCL,   8, 
        WENC,   8, 
        WKBD,   8, 
        WPTY,   8, 
        WPAS,   1032, 
        WPNW,   1032, 
        WSPM,   8, 
        WSPS,   8, 
        WSMN,   8, 
        WSMX,   8, 
        WSEN,   8, 
        WSKB,   8, 
        HDP0,   8, 
        HDP1,   8, 
        HDP2,   8, 
        HDP3,   8, 
        HDP4,   8, 
        HDP5,   8
    }

    Mutex (MSMI, 0x07)
    Mutex (RSMI, 0x07)
    Method (SMIK, 0, NotSerialized)
    {
        Acquire (RSMI, 0xFFFF)
        Store (0x534D01EF, APM2)
        Release (RSMI)
    }

    Method (SMI, 5, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg0, CMD)
        Store (Arg1, PAR0)
        Store (Arg2, PAR1)
        Store (Arg3, PAR2)
        Store (Arg4, PAR3)
        Store (0x2F, APMC)
        While (LEqual (ERR, One))
        {
            Sleep (0x64)
            Store (0x2F, APMC)
        }

        Store (PAR0, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (WMIS, 2, NotSerialized)
    {
        Return (SMI (0x10, Arg0, Arg1, Zero, Zero))
    }

    Method (PMON, 3, NotSerialized)
    {
        Return (SMI (0x11, Arg1, Arg2, Zero, Zero))
    }

    Device (WMI1)
    {
        Name (_HID, EisaId ("PNP0C14"))  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
        Name (_WDG, Buffer (0xC8)
        {
            /* 0000 */   0x0E, 0x23, 0xF5, 0x51, 0x77, 0x96, 0xCD, 0x46,
            /* 0008 */   0xA1, 0xCF, 0xC0, 0xB2, 0x3E, 0xE3, 0x4D, 0xB7,
            /* 0010 */   0x41, 0x30, 0xFF, 0x05, 0x64, 0x9A, 0x47, 0x98,
            /* 0018 */   0xF5, 0x33, 0x33, 0x4E, 0xA7, 0x07, 0x8E, 0x25,
            /* 0020 */   0x1E, 0xBB, 0xC3, 0xA1, 0x41, 0x31, 0x01, 0x06,
            /* 0028 */   0xEF, 0x54, 0x4B, 0x6A, 0xED, 0xA5, 0x33, 0x4D,
            /* 0030 */   0x94, 0x55, 0xB0, 0xD9, 0xB4, 0x8D, 0xF4, 0xB3,
            /* 0038 */   0x41, 0x32, 0x01, 0x06, 0xB6, 0xEB, 0xF1, 0x74,
            /* 0040 */   0x7A, 0x92, 0x7D, 0x4C, 0x95, 0xDF, 0x69, 0x8E,
            /* 0048 */   0x21, 0xE8, 0x0E, 0xB5, 0x41, 0x33, 0x01, 0x06,
            /* 0050 */   0xFF, 0x04, 0xEF, 0x7E, 0x28, 0x43, 0x7C, 0x44,
            /* 0058 */   0xB5, 0xBB, 0xD4, 0x49, 0x92, 0x5D, 0x53, 0x8D,
            /* 0060 */   0x41, 0x34, 0x01, 0x06, 0x9E, 0x15, 0xDB, 0x8A,
            /* 0068 */   0x32, 0x1E, 0x5C, 0x45, 0xBC, 0x93, 0x30, 0x8A,
            /* 0070 */   0x7E, 0xD9, 0x82, 0x46, 0x41, 0x35, 0x01, 0x01,
            /* 0078 */   0xFD, 0xD9, 0x51, 0x26, 0x1C, 0x91, 0x69, 0x4B,
            /* 0080 */   0xB9, 0x4E, 0xD0, 0xDE, 0xD5, 0x96, 0x3B, 0xD7,
            /* 0088 */   0x41, 0x36, 0x01, 0x06, 0xF8, 0x44, 0xAE, 0x7B,
            /* 0090 */   0x53, 0x38, 0x2B, 0x4D, 0xB9, 0x8B, 0xF8, 0x40,
            /* 0098 */   0xD7, 0xAC, 0x26, 0xB6, 0x43, 0x30, 0x01, 0x01,
            /* 00A0 */   0xF8, 0x44, 0xAE, 0x8B, 0x53, 0x38, 0x2B, 0x4D,
            /* 00A8 */   0xB9, 0x8B, 0xF8, 0x40, 0xD7, 0xAC, 0x26, 0xB6,
            /* 00B0 */   0x43, 0x31, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,
            /* 00B8 */   0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,
            /* 00C0 */   0xC9, 0x06, 0x29, 0x10, 0x43, 0x41, 0x01, 0x00
        })
        Name (RETN, Package (0x06)
        {
            "Success", 
            "Not Supported", 
            "Invalid Parameter", 
            "Access Denied", 
            "System Busy", 
            "Item is show only, inaccessible."
        })
        Name (ITEM, Package (0x72)
        {
            Package (0x03)
            {
                Zero, 
                "Intel(R) VT-d", 
                Zero
            }, 

            Package (0x03)
            {
                Zero, 
                "Intel(R) I/OAT", 
                One
            }, 

            Package (0x03)
            {
                0x52, 
                "MMCFG BASE", 
                0x02
            }, 

            Package (0x03)
            {
                0x41, 
                "Memory Mode", 
                0x03
            }, 

            Package (0x03)
            {
                0x42, 
                "DDR Voltage", 
                0x04
            }, 

            Package (0x03)
            {
                0x53, 
                "Channel Interleaving", 
                0x05
            }, 

            Package (0x03)
            {
                0x43, 
                "Rank Interleaving", 
                0x06
            }, 

            Package (0x03)
            {
                Zero, 
                "Patrol Scrub", 
                0x07
            }, 

            Package (0x03)
            {
                Zero, 
                "Demand Scrub", 
                0x08
            }, 

            Package (0x03)
            {
                Zero, 
                "Data Scrambling", 
                0x09
            }, 

            Package (0x03)
            {
                Zero, 
                "Device Tagging", 
                0x0A
            }, 

            Package (0x03)
            {
                Zero, 
                "GbE Controller", 
                0x0B
            }, 

            Package (0x03)
            {
                Zero, 
                "GbE2 Controller", 
                0x0C
            }, 

            Package (0x03)
            {
                0x3A, 
                "Deep Sx", 
                0x0D
            }, 

            Package (0x03)
            {
                Zero, 
                "Disable SCU devices", 
                0x0E
            }, 

            Package (0x03)
            {
                Zero, 
                "Onboard SAS Oprom", 
                0x0F
            }, 

            Package (0x03)
            {
                0x44, 
                "Power USB ports in S4/S5", 
                0x10
            }, 

            Package (0x03)
            {
                Zero, 
                "Onboard SATA RAID Oprom", 
                0x11
            }, 

            Package (0x03)
            {
                Zero, 
                "Azalia HD Audio", 
                0x12
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 1", 
                0x13
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 2", 
                0x14
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 3", 
                0x15
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 4", 
                0x16
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 5", 
                0x17
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 6", 
                0x18
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 7", 
                0x19
            }, 

            Package (0x03)
            {
                0x45, 
                "PCI Express Port 8", 
                0x1A
            }, 

            Package (0x03)
            {
                Zero, 
                "ME Subsystem", 
                0x1B
            }, 

            Package (0x03)
            {
                Zero, 
                "Execute MEBx", 
                0x1C
            }, 

            Package (0x03)
            {
                0x13, 
                "Boot Agent", 
                0x1D
            }, 

            Package (0x03)
            {
                0x13, 
                "Boot Agent2", 
                0x1E
            }, 

            Package (0x03)
            {
                0x46, 
                "Network stack", 
                0x1F
            }, 

            Package (0x03)
            {
                0x22, 
                "Hard Disk Pre-delay", 
                0x20
            }, 

            Package (0x03)
            {
                Zero, 
                "Launch Storage OpROM", 
                0x21
            }, 

            Package (0x03)
            {
                0x48, 
                "Custom table set", 
                0x22
            }, 

            Package (0x03)
            {
                Zero, 
                "Above 4G Decoding", 
                0x23
            }, 

            Package (0x03)
            {
                Zero, 
                "VGA Palette Snoop", 
                0x24
            }, 

            Package (0x03)
            {
                Zero, 
                "PERR# Generation", 
                0x25
            }, 

            Package (0x03)
            {
                Zero, 
                "SERR# Generation", 
                0x26
            }, 

            Package (0x03)
            {
                0x51, 
                "ASPM Support", 
                0x27
            }, 

            Package (0x03)
            {
                0x4A, 
                "Link Training Retry", 
                0x28
            }, 

            Package (0x03)
            {
                Zero, 
                "WHEA Support", 
                0x29
            }, 

            Package (0x03)
            {
                Zero, 
                "Hyper-threading", 
                0x2A
            }, 

            Package (0x03)
            {
                0x5D, 
                "Active Processor Cores Grp0", 
                0x2B
            }, 

            Package (0x03)
            {
                0x4F, 
                "Active Processor Cores Grp1", 
                0x2C
            }, 

            Package (0x03)
            {
                0x57, 
                "Active Processor Cores Grp2", 
                0x2D
            }, 

            Package (0x03)
            {
                0x58, 
                "Active Processor Cores Grp3", 
                0x2E
            }, 

            Package (0x03)
            {
                0x59, 
                "Active Processor Cores Grp4", 
                0x2F
            }, 

            Package (0x03)
            {
                0x5B, 
                "Active Processor Cores Grp6", 
                0x30
            }, 

            Package (0x03)
            {
                0x5A, 
                "Active Processor Cores Grp5", 
                0x31
            }, 

            Package (0x03)
            {
                0x5C, 
                "Active Processor Cores Grp7", 
                0x32
            }, 

            Package (0x03)
            {
                Zero, 
                "Limit CPUID Maximum", 
                0x33
            }, 

            Package (0x03)
            {
                Zero, 
                "Execute Disable Bit", 
                0x34
            }, 

            Package (0x03)
            {
                Zero, 
                "Intel Virtualization Technology", 
                0x35
            }, 

            Package (0x03)
            {
                0x4B, 
                "Intel Dynamic Power Technology", 
                0x36
            }, 

            Package (0x03)
            {
                Zero, 
                "EIST", 
                0x37
            }, 

            Package (0x03)
            {
                Zero, 
                "Turbo Mode", 
                0x38
            }, 

            Package (0x03)
            {
                0x50, 
                "CPU C3 Report", 
                0x39
            }, 

            Package (0x03)
            {
                0x50, 
                "CPU C6 report", 
                0x3A
            }, 

            Package (0x03)
            {
                0x50, 
                "CPU C7 report", 
                0x3B
            }, 

            Package (0x03)
            {
                0x4C, 
                "Package C State limit", 
                0x3C
            }, 

            Package (0x03)
            {
                0x26, 
                "SATA Mode", 
                0x3D
            }, 

            Package (0x03)
            {
                0x54, 
                "SATA Ports", 
                0x3E
            }, 

            Package (0x03)
            {
                Zero, 
                "Aggressive Link Power Management", 
                0x3F
            }, 

            Package (0x03)
            {
                Zero, 
                "External SATA Port", 
                0x40
            }, 

            Package (0x03)
            {
                Zero, 
                "Staggered Spin-up", 
                0x41
            }, 

            Package (0x03)
            {
                0x03, 
                "Legacy USB Support", 
                0x42
            }, 

            Package (0x03)
            {
                Zero, 
                "USB3.0 Support", 
                0x43
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 1", 
                0x44
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 2", 
                0x45
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 3", 
                0x46
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 4", 
                0x47
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 5", 
                0x48
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 6", 
                0x49
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 7", 
                0x4A
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Port 8", 
                0x4B
            }, 

            Package (0x03)
            {
                Zero, 
                "USB Internal Port", 
                0x4C
            }, 

            Package (0x03)
            {
                Zero, 
                "Front USB", 
                0x4D
            }, 

            Package (0x03)
            {
                Zero, 
                "Card Reader", 
                0x4E
            }, 

            Package (0x03)
            {
                Zero, 
                "Serial Port", 
                0x4F
            }, 

            Package (0x03)
            {
                Zero, 
                "AMT", 
                0x50
            }, 

            Package (0x03)
            {
                Zero, 
                "WatchDog Timer", 
                0x51
            }, 

            Package (0x03)
            {
                0x2D, 
                "After Power Loss", 
                0x52
            }, 

            Package (0x03)
            {
                0x39, 
                "Wake on LAN", 
                0x53
            }, 

            Package (0x03)
            {
                0x39, 
                "Wake from PCI Modem", 
                0x54
            }, 

            Package (0x03)
            {
                0x39, 
                "Wake from Serial Port Ring", 
                0x55
            }, 

            Package (0x03)
            {
                0x39, 
                "Wake from PCI Device", 
                0x56
            }, 

            Package (0x03)
            {
                0x2E, 
                "Wake Up on Alarm", 
                0x57
            }, 

            Package (0x03)
            {
                Zero, 
                "Hardware Password Manager", 
                0x58
            }, 

            Package (0x03)
            {
                0x0F, 
                "Require Admin. Pass. when Flashing", 
                0x59
            }, 

            Package (0x03)
            {
                0x0F, 
                "Require POP on Restart", 
                0x5A
            }, 

            Package (0x03)
            {
                0x1B, 
                "TCG Security Feature", 
                0x5B
            }, 

            Package (0x03)
            {
                0x55, 
                "Clear TCG Security Feature", 
                0x5C
            }, 

            Package (0x03)
            {
                Zero, 
                "Preboot Authentication", 
                0x5D
            }, 

            Package (0x03)
            {
                0x0F, 
                "Require HDP on Restart", 
                0x5E
            }, 

            Package (0x03)
            {
                Zero, 
                "Chassis Intrusion Detection", 
                0x5F
            }, 

            Package (0x03)
            {
                Zero, 
                "Configuration Change Detection", 
                0x60
            }, 

            Package (0x03)
            {
                0x4D, 
                "UEFI Boot Mode", 
                0x61
            }, 

            Package (0x03)
            {
                Zero, 
                "Quick Boot", 
                0x62
            }, 

            Package (0x03)
            {
                Zero, 
                "Option ROM Message Display", 
                0x63
            }, 

            Package (0x03)
            {
                0x04, 
                "Boot Up Num-Lock Status", 
                0x64
            }, 

            Package (0x03)
            {
                Zero, 
                "Keyboardless Operation", 
                0x65
            }, 

            Package (0x03)
            {
                0x3C, 
                "Option ROM Messages", 
                0x66
            }, 

            Package (0x03)
            {
                0x56, 
                "INT19 Trap Response", 
                0x67
            }, 

            Package (0x03)
            {
                Zero, 
                "Option Keys Display", 
                0x68
            }, 

            Package (0x03)
            {
                0x1D, 
                "Option Keys Display Style", 
                0x69
            }, 

            Package (0x03)
            {
                Zero, 
                "Startup Device Menu Prompt", 
                0x6A
            }, 

            Package (0x03)
            {
                0x34, 
                "Serial Number Style", 
                0x6B
            }, 

            Package (0x03)
            {
                Zero, 
                "OS Optimization", 
                0x6C
            }, 

            Package (0x03)
            {
                0x5E, 
                "Launch Storage OpROM Policy", 
                0x6D
            }, 

            Package (0x03)
            {
                0x64, 
                "Primary Boot Sequence", 
                0x6E
            }, 

            Package (0x03)
            {
                0x64, 
                "Error Boot Sequence", 
                0x6F
            }, 

            Package (0x03)
            {
                0x64, 
                "Automatic Boot Sequence", 
                0x70
            }, 

            Package (0x03)
            {
                0x64, 
                "Manufacturing Boot Sequence", 
                0x71
            }
        })
        Name (VSEL, Package (0x5F)
        {
            Package (0x02)
            {
                "Disabled", 
                "Enabled"
            }, 

            Package (0x02)
            {
                "Enabled", 
                "Disabled"
            }, 

            Package (0x03)
            {
                "Primary", 
                "Automatic", 
                "Disabled"
            }, 

            Package (0x03)
            {
                "Enabled", 
                "Disabled", 
                "Auto"
            }, 

            Package (0x02)
            {
                "Off", 
                "On"
            }, 

            Package (0x02)
            {
                "Full", 
                "Half"
            }, 

            Package (0x03)
            {
                "Normal", 
                "IrDA", 
                "ASKIR"
            }, 

            Package (0x02)
            {
                "IRQ7", 
                "IRQ5"
            }, 

            Package (0x02)
            {
                "DMA3", 
                "DMA1"
            }, 

            Package (0x03)
            {
                "ECP+EPP", 
                "ECP", 
                "EPP"
            }, 

            Package (0x02)
            {
                "1.9", 
                "1.7"
            }, 

            Package (0x02)
            {
                "Automatic", 
                "Serial ATA"
            }, 

            Package (0x06)
            {
                "IGD", 
                "", 
                "PCI", 
                "", 
                "PEG", 
                "Auto"
            }, 

            Package (0x04)
            {
                "NULL", 
                "128MB", 
                "256MB", 
                "MaxDVMT"
            }, 

            Package (0x09)
            {
                "", 
                "1MB", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "8MB"
            }, 

            Package (0x02)
            {
                "No", 
                "Yes"
            }, 

            Package (0x07)
            {
                "3F8/IRQ4", 
                "2F8/IRQ3", 
                "3E8/IRQ4", 
                "2E8/IRQ3", 
                "", 
                "", 
                "Disabled"
            }, 

            Package (0x08)
            {
                "378", 
                "278", 
                "3BC", 
                "", 
                "", 
                "", 
                "", 
                "Disabled"
            }, 

            Package (0x10)
            {
                "Disabled", 
                "AutoSelect", 
                "", 
                "3", 
                "4", 
                "5", 
                "6", 
                "7", 
                "", 
                "9", 
                "10", 
                "11", 
                "", 
                "", 
                "", 
                ""
            }, 

            Package (0x03)
            {
                "PXE", 
                "SMC", 
                "Disabled"
            }, 

            Package (0x02)
            {
                "MaximizePerformance", 
                "Balanced"
            }, 

            Package (0x02)
            {
                "Quick", 
                "Diagnostics"
            }, 

            Package (0x0D)
            {
                "Disabled", 
                "", 
                "", 
                "", 
                "4", 
                "5", 
                "6", 
                "7", 
                "8", 
                "9", 
                "10", 
                "11", 
                "12"
            }, 

            Package (0x04)
            {
                "Auto", 
                "On", 
                "Off", 
                ""
            }, 

            Package (0x04)
            {
                "IGD", 
                "PEG", 
                "PCI", 
                "Auto"
            }, 

            Package (0x03)
            {
                "DVMT", 
                "Fixed", 
                "Auto"
            }, 

            Package (0x03)
            {
                "Stay Off", 
                "Last State", 
                "Power on"
            }, 

            Package (0x03)
            {
                "Disabled", 
                "Active", 
                "Inactive"
            }, 

            Package (0x02)
            {
                "Quick", 
                "Enhance"
            }, 

            Package (0x02)
            {
                "Normal", 
                "Legacy"
            }, 

            Package (0x02)
            {
                "Fast", 
                "Fast"
            }, 

            Package (0x02)
            {
                "Enable", 
                "Once"
            }, 

            Package (0x04)
            {
                "3F8", 
                "2F8", 
                "3E8", 
                "2E8"
            }, 

            Package (0x02)
            {
                "IRQ3", 
                "IRQ4"
            }, 

            Package (0x1F)
            {
                "Disabled", 
                "", 
                "", 
                "3 Seconds", 
                "", 
                "", 
                "6 Seconds", 
                "", 
                "", 
                "9 Seconds", 
                "", 
                "", 
                "12 Seconds", 
                "", 
                "", 
                "15 Seconds", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "21 Seconds", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "30 Seconds"
            }, 

            Package (0x04)
            {
                "Disabled", 
                "GV1/GV3 Only", 
                "C States Onley", 
                "Enabled"
            }, 

            Package (0x07)
            {
                "", 
                "C1", 
                "C1C2", 
                "C1C3", 
                "", 
                "", 
                "C1C3C6"
            }, 

            Package (0x07)
            {
                "VT100", 
                "VT100-8bit", 
                "PC-ANSI-7bit", 
                "PC-ANSI", 
                "VT100+", 
                "VT-UTF8", 
                "ASCII"
            }, 

            Package (0x04)
            {
                "Disabled", 
                "IDE Mode", 
                "AHCI Mode", 
                "RAID Mode"
            }, 

            Package (0x09)
            {
                "", 
                "", 
                "", 
                "", 
                "", 
                "32MB", 
                "", 
                "64MB", 
                "128MB"
            }, 

            Package (0x04)
            {
                "", 
                "128MB", 
                "256MB", 
                "Maximum"
            }, 

            Package (0x04)
            {
                "Disabled", 
                "", 
                "ACPI C-2", 
                "ACPI C-3"
            }, 

            Package (0x07)
            {
                "VT100", 
                "VT100,8bit", 
                "PC-ANSI,7bit", 
                "PC-ANSI", 
                "VT100+", 
                "VT-UTF8", 
                "ASCII"
            }, 

            Package (0x02)
            {
                "On", 
                "Off"
            }, 

            Package (0x04)
            {
                "VT100/VT100", 
                "VT100+", 
                "VT-UTF8", 
                "ANSI"
            }, 

            Package (0x03)
            {
                "Power Off", 
                "Power On", 
                "Last State"
            }, 

            Package (0x05)
            {
                "Single Event", 
                "Daily Event", 
                "Weekly Event", 
                "Disabled", 
                "User Defined"
            }, 

            Package (0x02)
            {
                "Primary", 
                "Automatic"
            }, 

            Package (0x07)
            {
                "Sunday", 
                "Monday", 
                "Tuesday", 
                "Wednesday", 
                "Thursday", 
                "Friday", 
                "Saturday"
            }, 

            Package (0x02)
            {
                "Yes", 
                "No"
            }, 

            Package (0x04)
            {
                "Disabled", 
                "", 
                "", 
                "Enabled"
            }, 

            Package (0x03)
            {
                "Disabled", 
                "Enabled", 
                "Registered"
            }, 

            Package (0x04)
            {
                "Legacy Style", 
                "MTM&SN-1", 
                "MTM&SN-2", 
                "1S-MTM-SN"
            }, 

            Package (0x03)
            {
                "", 
                "IDE", 
                "AHCI"
            }, 

            Package (0x03)
            {
                "", 
                "Enabled", 
                "Disabled"
            }, 

            Package (0x07)
            {
                "", 
                "C1", 
                "", 
                "C1C3", 
                "", 
                "", 
                "C1C3C6"
            }, 

            Package (0x07)
            {
                "VT100", 
                "VT100,8bit", 
                "PC-ANSI,7bit", 
                "PC-ANSI", 
                "VT100+", 
                "VT-UTF8", 
                "ASCII"
            }, 

            Package (0x03)
            {
                "Primary", 
                "Automatic", 
                "Disabled"
            }, 

            Package (0x05)
            {
                "Disabled", 
                "", 
                "Enabled in S5", 
                "", 
                "Enabled in S4 and S5"
            }, 

            Package (0x02)
            {
                "Upon Request", 
                "Always"
            }, 

            Package (0x02)
            {
                "Keep Current", 
                "Force BIOS"
            }, 

            Package (0x06)
            {
                "Auto", 
                "IO=3F8h; IRQ=4;", 
                "IO=3F8h; IRQ=3,4,5,6,7,9,10,11,12;", 
                "IO=2F8h; IRQ=3,4,5,6,7,9,10,11,12;", 
                "IO=3E8h; IRQ=3,4,5,6,7,9,10,11,12;", 
                "IO=2E8h; IRQ=3,4,5,6,7,9,10,11,12;"
            }, 

            Package (0x04)
            {
                "Disabled", 
                "378", 
                "278", 
                "3BC"
            }, 

            Package (0x04)
            {
                "", 
                "IDE", 
                "AHCI", 
                "RAID"
            }, 

            Package (0x02)
            {
                "Better Acoustic Performance", 
                "Better Thermal Performance"
            }, 

            Package (0x05)
            {
                "Independent", 
                "Mirroring", 
                "Lock Step", 
                "", 
                "Sparing"
            }, 

            Package (0x02)
            {
                "Auto", 
                "Force 1.5V"
            }, 

            Package (0x09)
            {
                "Auto", 
                "1 Way", 
                "2 Way", 
                "", 
                "4 Way", 
                "", 
                "", 
                "", 
                "8 Way"
            }, 

            Package (0x02)
            {
                "S4/S5 ON", 
                "S4/S5 OFF"
            }, 

            Package (0x03)
            {
                "Disabled", 
                "Enabled", 
                "Auto"
            }, 

            Package (0x02)
            {
                "Disabled", 
                "Enable"
            }, 

            Package (0x03)
            {
                "Fan table 1", 
                "Fan table 2", 
                "Fan table 3"
            }, 

            Package (0x02)
            {
                "Load Default Table", 
                "Load Custom Table"
            }, 

            Package (0x02)
            {
                "Legacy ROM", 
                "EFI Compatible ROM"
            }, 

            Package (0x06)
            {
                "Disabled", 
                "", 
                "2", 
                "3", 
                "", 
                "5"
            }, 

            Package (0x03)
            {
                "Disable", 
                "Energy Efficient", 
                "Custom"
            }, 

            Package (0x09)
            {
                "C0", 
                "C2", 
                "", 
                "", 
                "", 
                "", 
                "C6", 
                "C7", 
                "No Limit"
            }, 

            Package (0x04)
            {
                "Auto", 
                "", 
                "UEFI", 
                "Legacy"
            }, 

            Package (0x03)
            {
                "All", 
                "1", 
                "2"
            }, 

            Package (0x09)
            {
                "", 
                "1", 
                "2", 
                "3", 
                "4", 
                "5", 
                "6", 
                "7", 
                "All"
            }, 

            Package (0x02)
            {
                "Disabled", 
                "Enabled"
            }, 

            Package (0x38)
            {
                "Disabled", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "", 
                "Auto"
            }, 

            Package (0x06)
            {
                "0X80000000", 
                "0X90000000", 
                "0xA0000000", 
                "0xB0000000", 
                "0xC0000000", 
                "0xD0000000"
            }, 

            Package (0x06)
            {
                "Auto", 
                "1 Way", 
                "2 Way", 
                "3 Way", 
                "4 Way", 
                ""
            }, 

            Package (0x03)
            {
                "Disable all except Port 1", 
                "Enabled", 
                "Disabled"
            }, 

            Package (0x06)
            {
                "No", 
                "", 
                "", 
                "", 
                "", 
                "Yes"
            }, 

            Package (0x02)
            {
                "Immediate", 
                "Postponed"
            }, 

            Package (0x04)
            {
                "All", 
                "1", 
                "2", 
                "3"
            }, 

            Package (0x06)
            {
                "All", 
                "1", 
                "2", 
                "3", 
                "4", 
                "5"
            }, 

            Package (0x0B)
            {
                "", 
                "1", 
                "2", 
                "3", 
                "4", 
                "5", 
                "6", 
                "7", 
                "8", 
                "9", 
                "All"
            }, 

            Package (0x02)
            {
                "All", 
                "1"
            }, 

            Package (0x07)
            {
                "", 
                "1", 
                "2", 
                "", 
                "4", 
                "", 
                "ALL"
            }, 

            Package (0x09)
            {
                "", 
                "1", 
                "2", 
                "", 
                "4", 
                "", 
                "6", 
                "", 
                "ALL"
            }, 

            Package (0x03)
            {
                "All", 
                "1", 
                "2"
            }, 

            Package (0x03)
            {
                "Do not launch", 
                "UEFI Only", 
                "Legacy Only"
            }
        })
        Name (VLST, Package (0x1A)
        {
            "SATA 0", 
            "SATA 1", 
            "SATA 2", 
            "SATA 3", 
            "ESata", 
            "MSata", 
            "Drive 1", 
            "Drive 2", 
            "Drive 3", 
            "Drive 4", 
            "Drive 5", 
            "Drive 6", 
            "Drive 7", 
            "SCU DEVICES", 
            "Net 1", 
            "Net 2", 
            "USB FDDS", 
            "USB HDDS", 
            "USB CDROMS", 
            "USB KEYS", 
            "SCU 1", 
            "SCU 2", 
            "SCU 3", 
            "SCU 4", 
            "SCU 5", 
            "Unknown"
        })
        Name (PENC, Package (0x02)
        {
            "ascii", 
            "scancode"
        })
        Name (PKBD, Package (0x03)
        {
            "us", 
            "fr", 
            "gr"
        })
        Name (PTYP, Package (0x0E)
        {
            "pap", 
            "pop", 
            "uhdp0", 
            "mhdp0", 
            "uhdp1", 
            "mhdp1", 
            "uhdp2", 
            "mhdp2", 
            "uhdp3", 
            "mhdp3", 
            "uhdp4", 
            "mhdp4", 
            "uhdp5", 
            "mhdp5"
        })
        Mutex (MWMI, 0x07)
        Name (PCFG, Buffer (0x30) {})
        Name (IBUF, Buffer (0x0100) {})
        Name (ILEN, Zero)
        Name (PSTR, Buffer (0x81) {})
        Method (CEXC, 2, NotSerialized)
        {
            If (LEqual (INCL, Arg1))
            {
                Concatenate (Arg0, ";[Excluded:", Local1)
            }
            Else
            {
                Store (Arg0, Local1)
                If (LNotEqual (Arg1, Zero))
                {
                    Concatenate (Arg0, ":", Local1)
                }
            }

            Return (Local1)
        }

        Method (WQA0, 1, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Name (STR2, Buffer (0x32) {})
            Store (WMIS (Zero, Arg0), Local4)
            If (LNotEqual (Local4, 0x05))
            {
                If (LNotEqual (Local4, Zero))
                {
                    Release (MWMI)
                    Return ("")
                }
            }

            Store (DerefOf (Index (ITEM, WITM)), Local0)
            Store (DerefOf (Index (Local0, Zero)), Local1)
            Store (DerefOf (Index (Local0, One)), Local2)
            If (LLess (Local1, 0x64))
            {
                Concatenate (Local2, ",", Local6)
                Store (DerefOf (Index (VSEL, Local1)), Local3)
                Concatenate (Local6, DerefOf (Index (Local3, WSEL)), Local7)
                Concatenate (Local7, ";[Optional:", Local6)
                Store (Zero, Local7)
                Store (Zero, Local0)
                Store (SizeOf (Local3), Local5)
                While (LLess (Local7, Local5))
                {
                    Store (DerefOf (Index (Local3, Local7)), STR2)
                    Store (DerefOf (Index (STR2, Zero)), Local2)
                    If (LNotEqual (Local2, Zero))
                    {
                        If (LNotEqual (Local0, Zero))
                        {
                            Concatenate (Local6, ",", Local1)
                            Store (Local1, Local6)
                        }

                        Concatenate (Local6, DerefOf (Index (Local3, Local7)), Local1)
                        Store (Local1, Local6)
                        Increment (Local0)
                    }

                    Increment (Local7)
                }

                Concatenate (Local6, "]", Local7)
                If (LEqual (Local4, 0x05))
                {
                    Concatenate (Local7, "[Status:ShowOnly]", Local6)
                    Store (Local6, Local7)
                }
            }
            Else
            {
                Store (SizeOf (VLST), Local3)
                If (LLessEqual (WLS0, Local3))
                {
                    Concatenate (Local2, ",", Local4)
                    Store (CEXC (Local4, Zero), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS0)), Local2)
                }

                If (LLessEqual (WLS1, Local3))
                {
                    Store (CEXC (Local2, One), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS1)), Local2)
                }

                If (LLessEqual (WLS2, Local3))
                {
                    Store (CEXC (Local2, 0x02), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS2)), Local2)
                }

                If (LLessEqual (WLS3, Local3))
                {
                    Store (CEXC (Local2, 0x03), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS3)), Local2)
                }

                If (LLessEqual (WLS4, Local3))
                {
                    Store (CEXC (Local2, 0x04), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS4)), Local2)
                }

                If (LLessEqual (WLS5, Local3))
                {
                    Store (CEXC (Local2, 0x05), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS5)), Local2)
                }

                If (LLessEqual (WLS6, Local3))
                {
                    Store (CEXC (Local2, 0x06), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS6)), Local2)
                }

                If (LLessEqual (WLS7, Local3))
                {
                    Store (CEXC (Local2, 0x07), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS7)), Local2)
                }

                If (LLessEqual (WLS8, Local3))
                {
                    Store (CEXC (Local2, 0x08), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS8)), Local2)
                }

                If (LLessEqual (WLS9, Local3))
                {
                    Store (CEXC (Local2, 0x09), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLS9)), Local2)
                }

                If (LLessEqual (WLSA, Local3))
                {
                    Store (CEXC (Local2, 0x0A), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSA)), Local2)
                }

                If (LLessEqual (WLSB, Local3))
                {
                    Store (CEXC (Local2, 0x0B), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSB)), Local2)
                }

                If (LLessEqual (WLSC, Local3))
                {
                    Store (CEXC (Local2, 0x0C), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSC)), Local2)
                }

                If (LLessEqual (WLSD, Local3))
                {
                    Store (CEXC (Local2, 0x0D), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSD)), Local2)
                }

                If (LLessEqual (WLSE, Local3))
                {
                    Store (CEXC (Local2, 0x0E), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSE)), Local2)
                }

                If (LLessEqual (WLSF, Local3))
                {
                    Store (CEXC (Local2, 0x0F), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSF)), Local2)
                }

                If (LLessEqual (WLSG, Local3))
                {
                    Store (CEXC (Local2, 0x10), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSG)), Local2)
                }

                If (LLessEqual (WLSH, Local3))
                {
                    Store (CEXC (Local2, 0x11), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSH)), Local2)
                }

                If (LLessEqual (WLSI, Local3))
                {
                    Store (CEXC (Local2, 0x12), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSI)), Local2)
                }

                If (LLessEqual (WLSJ, Local3))
                {
                    Store (CEXC (Local2, 0x13), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSJ)), Local2)
                }

                If (LLessEqual (WLSK, Local3))
                {
                    Store (CEXC (Local2, 0x14), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSK)), Local2)
                }

                If (LLessEqual (WLSL, Local3))
                {
                    Store (CEXC (Local2, 0x15), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSL)), Local2)
                }

                If (LLessEqual (WLSM, Local3))
                {
                    Store (CEXC (Local2, 0x16), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSM)), Local2)
                }

                If (LLessEqual (WLSN, Local3))
                {
                    Store (CEXC (Local2, 0x17), Local7)
                    Concatenate (Local7, DerefOf (Index (VLST, WLSN)), Local2)
                    If (LNotEqual (INCL, 0x18))
                    {
                        Concatenate (Local2, "]", Local7)
                        Store (Local7, Local2)
                    }
                }

                Store (Local2, Local7)
            }

            Release (MWMI)
            Return (Local7)
        }

        Method (WMA1, 3, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Store (WSET (Arg2), Local0)
            Release (MWMI)
            Return (DerefOf (Index (RETN, Local0)))
        }

        Method (WMA2, 3, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Store (CARG (Arg2), Local0)
            If (LEqual (Local0, Zero))
            {
                If (LNotEqual (ILEN, Zero))
                {
                    Store (CPAS (IBUF, Zero), Local0)
                }

                If (LEqual (Local0, Zero))
                {
                    Store (WMIS (0x02, Zero), Local0)
                }
            }

            Release (MWMI)
            Return (DerefOf (Index (RETN, Local0)))
        }

        Method (WMA3, 3, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Store (0x02, Local0)
            If (LLessEqual (SizeOf (Arg2), 0x0100))
            {
                Store (Arg2, IBUF)
                Store (CPAS (IBUF, Zero), Local0)
            }

            Store (WMIS (0x03, Zero), Local0)
            Release (MWMI)
            Return (DerefOf (Index (RETN, Local0)))
        }

        Method (WMA4, 3, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Store (WMIS (0x04, Zero), Local0)
            Release (MWMI)
            Return (DerefOf (Index (RETN, Local0)))
        }

        Method (WQA5, 1, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Store (WMIS (0x05, Zero), Local0)
            Store (WSPM, Index (PCFG, Zero))
            Store (WSPS, Index (PCFG, 0x04))
            Store (WSMN, Index (PCFG, 0x08))
            Store (WSMX, Index (PCFG, 0x0C))
            Store (WSEN, Index (PCFG, 0x10))
            Store (WSKB, Index (PCFG, 0x14))
            Store (HDP0, Index (PCFG, 0x18))
            Store (HDP1, Index (PCFG, 0x1C))
            Store (HDP2, Index (PCFG, 0x20))
            Store (HDP3, Index (PCFG, 0x24))
            Store (HDP4, Index (PCFG, 0x28))
            Store (HDP5, Index (PCFG, 0x2C))
            Release (MWMI)
            Return (PCFG)
        }

        Method (WMA6, 3, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            If (LEqual (SizeOf (Arg2), Zero))
            {
                Store (0x02, Local0)
            }
            Else
            {
                Store (CARG (Arg2), Local0)
                If (LEqual (Local0, Zero))
                {
                    If (LNotEqual (ILEN, Zero))
                    {
                        Store (SPAS (IBUF), Local0)
                    }

                    If (LEqual (Local0, Zero))
                    {
                        Store (WMIS (0x06, Zero), Local0)
                    }
                }
            }

            Release (MWMI)
            Return (DerefOf (Index (RETN, Local0)))
        }

        Name (RE64, Buffer (0x40) {})
        Method (WQC0, 1, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Store (0xB0, CMD7)
            Store (Zero, DATA)
            Store (Zero, STUS)
            SMIK ()
            Store (DATA, RE64)
            Release (MWMI)
            Return (RE64)
        }

        Method (WMC1, 3, NotSerialized)
        {
            Acquire (MWMI, 0xFFFF)
            Store (0xB1, CMD7)
            Store (Arg2, DATA)
            Store (Zero, STUS)
            SMIK ()
            Release (MWMI)
            Return (DATA)
        }

        Method (CARG, 1, NotSerialized)
        {
            Store (SizeOf (Arg0), Local0)
            If (LEqual (Local0, Zero))
            {
                Store (Zero, IBUF)
                Store (Zero, ILEN)
                Return (Zero)
            }

            If (LNotEqual (ObjectType (Arg0), 0x02))
            {
                Return (0x02)
            }

            If (LGreaterEqual (Local0, 0xFF))
            {
                Return (0x02)
            }

            Store (Arg0, IBUF)
            Decrement (Local0)
            Store (DerefOf (Index (IBUF, Local0)), Local1)
            If (LOr (LEqual (Local1, 0x3B), LEqual (Local1, 0x2A)))
            {
                Store (Zero, Index (IBUF, Local0))
                Store (Local0, ILEN)
            }
            Else
            {
                Store (SizeOf (Arg0), ILEN)
            }

            Return (Zero)
        }

        Method (SCMP, 3, NotSerialized)
        {
            Store (SizeOf (Arg0), Local0)
            If (LEqual (Local0, Zero))
            {
                Return (Zero)
            }

            Increment (Local0)
            Name (STR1, Buffer (Local0) {})
            Store (Arg0, STR1)
            Decrement (Local0)
            Store (Zero, Local1)
            Store (Arg2, Local2)
            While (LLess (Local1, Local0))
            {
                Store (DerefOf (Index (STR1, Local1)), Local3)
                If (LGreaterEqual (Local3, 0x41))
                {
                    If (LLessEqual (Local3, 0x5A))
                    {
                        Add (Local3, 0x20, Local3)
                    }
                }

                Store (DerefOf (Index (Arg1, Local2)), Local4)
                If (LGreaterEqual (Local4, 0x41))
                {
                    If (LLessEqual (Local4, 0x5A))
                    {
                        Add (Local4, 0x20, Local4)
                    }
                }

                If (LNotEqual (Local3, Local4))
                {
                    Return (Zero)
                }

                Increment (Local1)
                Increment (Local2)
            }

            Store (DerefOf (Index (Arg1, Local2)), Local4)
            If (LEqual (Local4, Zero))
            {
                Return (One)
            }

            If (LOr (LEqual (Local4, 0x2C), LOr (LEqual (Local4, 0x3A), LEqual (
                Local4, 0x3B))))
            {
                Return (One)
            }

            Return (Zero)
        }

        Method (GITM, 1, NotSerialized)
        {
            Store (Zero, Local0)
            Store (SizeOf (ITEM), Local1)
            While (LLess (Local0, Local1))
            {
                Store (DerefOf (Index (DerefOf (Index (ITEM, Local0)), One)), 
                    Local3)
                If (SCMP (Local3, Arg0, Zero))
                {
                    Return (Local0)
                }

                Increment (Local0)
            }

            Return (Ones)
        }

        Method (GSEL, 3, NotSerialized)
        {
            Store (Zero, Local0)
            Store (SizeOf (Arg0), Local1)
            While (LLess (Local0, Local1))
            {
                Store (DerefOf (Index (Arg0, Local0)), Local2)
                If (SCMP (Local2, Arg1, Arg2))
                {
                    Return (Local0)
                }

                Increment (Local0)
            }

            Return (Ones)
        }

        Method (SLEN, 2, NotSerialized)
        {
            Store (DerefOf (Index (Arg0, Arg1)), Local0)
            Return (SizeOf (Local0))
        }

        Method (CLRP, 0, NotSerialized)
        {
            Store (Zero, WPAS)
            Store (Zero, WPNW)
        }

        Method (GPAS, 2, NotSerialized)
        {
            Store (Arg1, Local0)
            Store (Zero, Local1)
            While (LLessEqual (Local1, 0x80))
            {
                Store (DerefOf (Index (Arg0, Local0)), Local2)
                If (LOr (LEqual (Local2, 0x2C), LEqual (Local2, Zero)))
                {
                    Store (Zero, Index (PSTR, Local1))
                    Return (Local1)
                }

                Store (Local2, Index (PSTR, Local1))
                Increment (Local0)
                Increment (Local1)
            }

            Store (Zero, Index (PSTR, Local1))
            Return (Ones)
        }

        Method (CPAS, 2, NotSerialized)
        {
            CLRP ()
            Store (Arg1, Local0)
            Store (GPAS (Arg0, Local0), Local1)
            If (LEqual (Local1, Ones))
            {
                Return (0x02)
            }

            If (LEqual (Local1, Zero))
            {
                Return (0x02)
            }

            Store (PSTR, WPAS)
            Add (Local0, Local1, Local0)
            Increment (Local0)
            Store (GSEL (PENC, Arg0, Local0), Local6)
            If (LEqual (Local6, Ones))
            {
                Return (0x02)
            }

            Store (Local6, WENC)
            If (LEqual (Local6, Zero))
            {
                Add (Local0, SLEN (PENC, Zero), Local0)
                If (LNotEqual (DerefOf (Index (Arg0, Local0)), 0x2C))
                {
                    Return (0x02)
                }

                Increment (Local0)
                Store (GSEL (PKBD, Arg0, Local0), Local6)
                If (LEqual (Local6, Ones))
                {
                    Return (0x02)
                }

                Store (Local6, WKBD)
            }

            Return (Zero)
        }

        Method (SPAS, 1, NotSerialized)
        {
            CLRP ()
            Store (GSEL (PTYP, Arg0, Zero), Local6)
            If (LEqual (Local6, Ones))
            {
                Return (0x02)
            }

            Store (Local6, WPTY)
            Store (SLEN (PTYP, Local6), Local0)
            If (LNotEqual (DerefOf (Index (Arg0, Local0)), 0x2C))
            {
                Return (0x02)
            }

            Increment (Local0)
            Store (GPAS (Arg0, Local0), Local1)
            If (LOr (LEqual (Local1, Ones), LEqual (Local1, Zero)))
            {
                Return (0x02)
            }

            Store (PSTR, WPAS)
            Add (Local0, Local1, Local0)
            If (LNotEqual (DerefOf (Index (Arg0, Local0)), 0x2C))
            {
                Return (0x02)
            }

            Increment (Local0)
            Store (GPAS (Arg0, Local0), Local1)
            If (LEqual (Local1, Ones))
            {
                Return (0x02)
            }

            If (LEqual (Local1, Zero))
            {
                Store (Zero, PSTR)
            }

            Store (PSTR, WPNW)
            Add (Local0, Local1, Local0)
            Increment (Local0)
            Store (GSEL (PENC, Arg0, Local0), Local6)
            If (LEqual (Local6, Ones))
            {
                Return (0x02)
            }

            Store (Local6, WENC)
            If (LEqual (Local6, Zero))
            {
                Add (Local0, SLEN (PENC, Zero), Local0)
                If (LNotEqual (DerefOf (Index (Arg0, Local0)), 0x2C))
                {
                    Return (0x02)
                }

                Increment (Local0)
                Store (GSEL (PKBD, Arg0, Local0), Local6)
                If (LEqual (Local6, Ones))
                {
                    Return (0x02)
                }

                Store (Local6, WKBD)
            }

            Return (Zero)
        }

        Method (WSET, 1, NotSerialized)
        {
            Store (SizeOf (Arg0), Local0)
            If (LOr (LEqual (Local0, Zero), LGreaterEqual (Local0, 0x0100)))
            {
                Return (0x02)
            }

            Increment (Local0)
            Store (Arg0, IBUF)
            Store (GITM (IBUF), Local1)
            If (LEqual (Local1, Ones))
            {
                Return (0x02)
            }

            Store (Local1, WITM)
            Store (DerefOf (Index (ITEM, Local1)), Local3)
            Store (DerefOf (Index (Local3, One)), Local4)
            Store (SizeOf (Local4), Local2)
            Increment (Local2)
            Store (DerefOf (Index (Local3, Zero)), Local4)
            If (LLess (Local4, 0x64))
            {
                Store (DerefOf (Index (VSEL, Local4)), Local5)
                Store (GSEL (Local5, IBUF, Local2), Local6)
                If (LEqual (Local6, Ones))
                {
                    Return (0x02)
                }

                Store (Local6, WSEL)
                Add (Local2, SLEN (Local5, Local6), Local2)
                Increment (Local2)
                Store (DerefOf (Index (IBUF, Local2)), Local4)
            }
            Else
            {
                Store (0x3F, WLS0)
                Store (0x3F, WLS1)
                Store (0x3F, WLS2)
                Store (0x3F, WLS3)
                Store (0x3F, WLS4)
                Store (0x3F, WLS5)
                Store (0x3F, WLS6)
                Store (0x3F, WLS7)
                Store (0x3F, WLS8)
                Store (0x3F, WLS9)
                Store (0x3F, WLSA)
                Store (0x3F, WLSB)
                Store (0x3F, WLSC)
                Store (0x3F, WLSD)
                Store (0x3F, WLSE)
                Store (0x3F, WLSF)
                Store (0x3F, WLSG)
                Store (0x3F, WLSH)
                Store (0x3F, WLSI)
                Store (0x3F, WLSJ)
                Store (0x3F, WLSK)
                Store (0x3F, WLSL)
                Store (0x3F, WLSM)
                Store (0x3F, WLSN)
                Store (GSEL (VLST, IBUF, Local2), Local6)
                If (LEqual (Local6, Ones))
                {
                    Return (0x02)
                }

                Store (Local6, WLS0)
                Add (Local2, SLEN (VLST, Local6), Local2)
                Store (DerefOf (Index (IBUF, Local2)), Local4)
                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS1)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS2)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS3)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS4)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS5)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS6)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS7)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS8)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLS9)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSA)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSB)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSC)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSD)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSE)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSF)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSG)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSH)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSI)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSJ)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSK)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSL)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSM)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }

                If (LAnd (LLess (Local2, Local0), LEqual (Local4, 0x3A)))
                {
                    Increment (Local2)
                    Store (GSEL (VLST, IBUF, Local2), Local6)
                    If (LEqual (Local6, Ones))
                    {
                        Return (0x02)
                    }

                    Store (Local6, WLSN)
                    Add (Local2, SLEN (VLST, Local6), Local2)
                    Store (DerefOf (Index (IBUF, Local2)), Local4)
                }
            }

            If (LAnd (LEqual (Local4, 0x2C), LLess (Local2, Local0)))
            {
                Increment (Local2)
                Store (CPAS (IBUF, Local2), Local0)
                If (LNotEqual (Local0, Zero))
                {
                    Return (Local0)
                }
            }

            Return (WMIS (One, Zero))
        }

        Name (WQCA, Buffer (0x0A2E)
        {
            /* 0000 */   0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,
            /* 0008 */   0x1E, 0x0A, 0x00, 0x00, 0x26, 0x40, 0x00, 0x00,
            /* 0010 */   0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,
            /* 0018 */   0xA8, 0x46, 0x9F, 0x00, 0x01, 0x06, 0x18, 0x42,
            /* 0020 */   0x10, 0x15, 0x10, 0x0A, 0x0C, 0x21, 0x02, 0x0B,
            /* 0028 */   0x83, 0x50, 0x44, 0x18, 0x14, 0xA0, 0x45, 0x41,
            /* 0030 */   0xC8, 0x05, 0x14, 0x95, 0x02, 0x21, 0xC3, 0x02,
            /* 0038 */   0x14, 0x0B, 0x70, 0x2E, 0x40, 0xBA, 0x00, 0xE5,
            /* 0040 */   0x28, 0x72, 0x0C, 0x22, 0x02, 0xF7, 0xEF, 0x0F,
            /* 0048 */   0x31, 0x0A, 0x88, 0x14, 0x40, 0x48, 0x26, 0x84,
            /* 0050 */   0x44, 0x00, 0x53, 0x21, 0x70, 0x84, 0xA0, 0x5F,
            /* 0058 */   0x01, 0x08, 0x1D, 0xA2, 0xC9, 0xA0, 0x00, 0xA7,
            /* 0060 */   0x08, 0x82, 0xB4, 0x65, 0x01, 0xBA, 0x05, 0xF8,
            /* 0068 */   0x16, 0xA0, 0x1D, 0x42, 0x68, 0x15, 0x0A, 0x30,
            /* 0070 */   0x29, 0xC0, 0x27, 0x98, 0x2C, 0x0A, 0x90, 0x0D,
            /* 0078 */   0x26, 0xDB, 0x70, 0x64, 0x18, 0x4C, 0xE0, 0x18,
            /* 0080 */   0x50, 0x62, 0xC6, 0x80, 0xD2, 0x39, 0x05, 0xD9,
            /* 0088 */   0x04, 0x16, 0x74, 0xA1, 0x28, 0x9A, 0x46, 0x94,
            /* 0090 */   0x04, 0x07, 0x75, 0x0C, 0x11, 0x82, 0x97, 0x2B,
            /* 0098 */   0xC0, 0xFB, 0x08, 0x64, 0x1A, 0x9A, 0xC0, 0xF3,
            /* 00A0 */   0x18, 0x12, 0x40, 0xE8, 0x22, 0x25, 0x1C, 0x06,
            /* 00A8 */   0xE5, 0x01, 0x44, 0x72, 0x06, 0x8A, 0x02, 0xB6,
            /* 00B0 */   0xD7, 0x69, 0x68, 0x50, 0x47, 0xC9, 0x24, 0xC1,
            /* 00B8 */   0xA1, 0xC6, 0x68, 0x89, 0x02, 0xCC, 0x8F, 0x4B,
            /* 00C0 */   0xC3, 0x3D, 0x10, 0x8F, 0x37, 0x24, 0x93, 0x36,
            /* 00C8 */   0x14, 0xD4, 0xC0, 0x3D, 0xA9, 0x53, 0xF2, 0x34,
            /* 00D0 */   0x23, 0x96, 0x3C, 0x45, 0xC1, 0x24, 0xF0, 0x28,
            /* 00D8 */   0x18, 0x1A, 0x27, 0x28, 0x0B, 0x42, 0x0E, 0x86,
            /* 00E0 */   0x89, 0x02, 0x3C, 0x09, 0xCF, 0xB0, 0xF8, 0x79,
            /* 00E8 */   0x9D, 0x2F, 0x39, 0x08, 0xC4, 0x48, 0xE0, 0x03,
            /* 00F0 */   0x81, 0x47, 0x73, 0xC4, 0x58, 0xA0, 0x70, 0x01,
            /* 00F8 */   0xCF, 0xE7, 0x18, 0x22, 0xC7, 0x3D, 0xD8, 0x18,
            /* 0100 */   0x47, 0x11, 0x39, 0xC1, 0x1B, 0x40, 0x14, 0xA3,
            /* 0108 */   0x15, 0x34, 0x6B, 0x21, 0x06, 0x8B, 0x66, 0xB0,
            /* 0110 */   0x9E, 0xC1, 0xC9, 0x31, 0xE0, 0x08, 0x30, 0xFF,
            /* 0118 */   0x7F, 0x19, 0x10, 0xF2, 0x28, 0xC0, 0xEA, 0xA0,
            /* 0120 */   0x34, 0x0D, 0x13, 0x74, 0x2F, 0xC0, 0x9A, 0x00,
            /* 0128 */   0x63, 0x02, 0x34, 0x62, 0x48, 0x99, 0x00, 0x67,
            /* 0130 */   0xB7, 0x05, 0xCD, 0xA8, 0x2D, 0x01, 0xE6, 0x04,
            /* 0138 */   0x68, 0x13, 0xE0, 0x0D, 0x41, 0x28, 0xE7, 0x19,
            /* 0140 */   0xE5, 0x58, 0x4E, 0x31, 0xCA, 0xA3, 0x40, 0xCC,
            /* 0148 */   0x57, 0x81, 0xA0, 0x51, 0x62, 0xC4, 0x3C, 0x97,
            /* 0150 */   0xB8, 0x86, 0x8D, 0x10, 0x23, 0xE4, 0x29, 0x04,
            /* 0158 */   0x8A, 0xDB, 0xFE, 0x20, 0xC8, 0xA0, 0x71, 0xA3,
            /* 0160 */   0xF7, 0x59, 0xE1, 0xAC, 0x4E, 0xE0, 0xE8, 0x9F,
            /* 0168 */   0x13, 0x4C, 0xE0, 0x29, 0x1F, 0xD8, 0x93, 0xC1,
            /* 0170 */   0x09, 0x1C, 0x6B, 0xD4, 0x18, 0xA7, 0x92, 0xC0,
            /* 0178 */   0x91, 0x9F, 0x0F, 0xD2, 0x00, 0xA2, 0x48, 0xF0,
            /* 0180 */   0xA8, 0xB3, 0x82, 0xCF, 0x05, 0x1E, 0xDA, 0x41,
            /* 0188 */   0x7B, 0x8E, 0x27, 0x10, 0xE4, 0x10, 0x8E, 0xE0,
            /* 0190 */   0x79, 0xE1, 0x81, 0xC0, 0x63, 0x60, 0x37, 0x07,
            /* 0198 */   0x1F, 0x01, 0x7C, 0x42, 0xC0, 0xBB, 0x06, 0xD4,
            /* 01A0 */   0xD5, 0xE0, 0xC1, 0x80, 0x0D, 0x3A, 0x1C, 0x66,
            /* 01A8 */   0xBC, 0x1E, 0x7E, 0xB8, 0x13, 0x38, 0xC9, 0xC7,
            /* 01B0 */   0x0B, 0x7E, 0xD4, 0xF0, 0xE0, 0x70, 0xF3, 0x3C,
            /* 01B8 */   0x99, 0x23, 0x2B, 0x55, 0x80, 0xD9, 0xC3, 0x81,
            /* 01C0 */   0x8E, 0x11, 0x3E, 0x6B, 0xB0, 0x33, 0x00, 0x46,
            /* 01C8 */   0xFE, 0x20, 0x50, 0x23, 0x33, 0xB4, 0xC7, 0xFD,
            /* 01D0 */   0xCA, 0x61, 0xC8, 0xE7, 0x84, 0xC3, 0x62, 0x62,
            /* 01D8 */   0xCF, 0x1C, 0x74, 0x3C, 0xE0, 0xBF, 0x8A, 0x3C,
            /* 01E0 */   0x65, 0x78, 0xFA, 0x9E, 0xAF, 0x09, 0x86, 0x1D,
            /* 01E8 */   0x38, 0x7A, 0x20, 0x86, 0x6E, 0x7D, 0x18, 0x9A,
            /* 01F0 */   0x86, 0x6F, 0x1F, 0x3E, 0x2F, 0xC0, 0x38, 0x05,
            /* 01F8 */   0x78, 0xE4, 0x3E, 0xA2, 0x18, 0xC4, 0xFF, 0xFF,
            /* 0200 */   0xA3, 0x05, 0x3F, 0x4D, 0xB0, 0xEB, 0xC1, 0x69,
            /* 0208 */   0x3C, 0x07, 0x78, 0x38, 0x67, 0xE5, 0xC3, 0x04,
            /* 0210 */   0xD8, 0x6E, 0x27, 0x6C, 0x44, 0xEF, 0x16, 0x1E,
            /* 0218 */   0x0D, 0xF6, 0x14, 0x00, 0xBE, 0xD3, 0x0B, 0x38,
            /* 0220 */   0xEF, 0x1A, 0x6C, 0xB0, 0x30, 0x4E, 0x2F, 0xE0,
            /* 0228 */   0x3F, 0x1F, 0x78, 0x00, 0xFC, 0x18, 0xE1, 0x01,
            /* 0230 */   0x70, 0xF0, 0xA7, 0x8F, 0xF3, 0xB3, 0xD2, 0x59,
            /* 0238 */   0x21, 0x87, 0x05, 0xEF, 0x8C, 0x03, 0x63, 0x14,
            /* 0240 */   0x3C, 0xCB, 0x53, 0xC3, 0x04, 0x0A, 0xF2, 0x16,
            /* 0248 */   0x50, 0xA0, 0x47, 0x01, 0x85, 0xF1, 0x99, 0x06,
            /* 0250 */   0x78, 0xFE, 0xFF, 0xCF, 0x34, 0xE0, 0x3E, 0x1A,
            /* 0258 */   0xE0, 0xCE, 0x0D, 0x70, 0x6F, 0x05, 0xEC, 0xDA,
            /* 0260 */   0xF0, 0x54, 0x03, 0x57, 0xF4, 0xA9, 0x06, 0xEA,
            /* 0268 */   0xAD, 0xA5, 0xB8, 0x31, 0xEA, 0x12, 0x13, 0xE4,
            /* 0270 */   0x51, 0xE0, 0x81, 0x26, 0xCA, 0xD3, 0xCC, 0x9B,
            /* 0278 */   0x4C, 0x84, 0x27, 0x1B, 0x5F, 0x6A, 0x3C, 0x85,
            /* 0280 */   0x38, 0xBE, 0xD4, 0x18, 0xF1, 0x55, 0xE2, 0xCD,
            /* 0288 */   0xC6, 0xB8, 0x07, 0xF7, 0x50, 0xF3, 0x88, 0x63,
            /* 0290 */   0x90, 0xA3, 0x89, 0xF0, 0x62, 0x10, 0xF0, 0xE1,
            /* 0298 */   0xC6, 0x87, 0x1A, 0xF0, 0x0A, 0x79, 0x9F, 0xC8,
            /* 02A0 */   0xC2, 0xA1, 0x06, 0xD0, 0xFA, 0xFF, 0x3F, 0xD4,
            /* 02A8 */   0x00, 0x17, 0xAC, 0xC7, 0x13, 0xF0, 0x1D, 0x19,
            /* 02B0 */   0xD8, 0xFD, 0x04, 0xDE, 0xF9, 0x04, 0xF0, 0x92,
            /* 02B8 */   0x78, 0xFD, 0x3A, 0x70, 0x38, 0x2D, 0x88, 0x6C,
            /* 02C0 */   0xBC, 0x00, 0x7C, 0x06, 0xA0, 0x6A, 0x80, 0x34,
            /* 02C8 */   0x49, 0xD8, 0x04, 0xD3, 0x93, 0x0B, 0xDE, 0x07,
            /* 02D0 */   0x02, 0xE7, 0x26, 0x51, 0xF2, 0x61, 0x51, 0x38,
            /* 02D8 */   0x67, 0x3D, 0x86, 0x50, 0x10, 0x03, 0x3A, 0xC8,
            /* 02E0 */   0x61, 0x02, 0x7D, 0x42, 0xF1, 0x31, 0xE4, 0x59,
            /* 02E8 */   0xE0, 0x59, 0xD0, 0x83, 0xF2, 0x30, 0xDE, 0x50,
            /* 02F0 */   0xD8, 0xF9, 0xC3, 0x47, 0x09, 0x8F, 0xDC, 0x87,
            /* 02F8 */   0x04, 0xFE, 0x8B, 0xF1, 0x6C, 0x8C, 0x6E, 0x35,
            /* 0300 */   0xA7, 0x14, 0x14, 0x98, 0x8F, 0x21, 0x9C, 0xA0,
            /* 0308 */   0x2E, 0x01, 0xFF, 0xFF, 0x7B, 0x04, 0xB8, 0x7E,
            /* 0310 */   0x8E, 0x3A, 0x28, 0x80, 0x00, 0xC8, 0xB7, 0x02,
            /* 0318 */   0x9F, 0x03, 0x9E, 0x0C, 0xD8, 0x18, 0x1E, 0x05,
            /* 0320 */   0x8C, 0x66, 0x74, 0x1E, 0x7E, 0xB2, 0xA8, 0xB8,
            /* 0328 */   0x93, 0xA5, 0x20, 0x9E, 0xAC, 0x6F, 0x8F, 0x9E,
            /* 0330 */   0x2C, 0x6E, 0x26, 0xBE, 0x55, 0x78, 0x46, 0x6F,
            /* 0338 */   0x59, 0x9E, 0xA3, 0x27, 0xEC, 0x5B, 0x08, 0xAC,
            /* 0340 */   0xC3, 0x40, 0xC8, 0x07, 0x03, 0x4F, 0xC3, 0x70,
            /* 0348 */   0x9E, 0x2C, 0x87, 0xF3, 0x64, 0xF9, 0x58, 0x7C,
            /* 0350 */   0x09, 0x01, 0xDF, 0x8D, 0x02, 0x37, 0x5B, 0x30,
            /* 0358 */   0xC2, 0x63, 0x62, 0x8D, 0x8A, 0x5E, 0x84, 0x3C,
            /* 0360 */   0x3C, 0x7E, 0x39, 0xF0, 0x7C, 0x9E, 0x11, 0x8E,
            /* 0368 */   0xF2, 0x49, 0x02, 0x87, 0xF1, 0x44, 0xE2, 0x21,
            /* 0370 */   0xFA, 0x4E, 0x04, 0x6B, 0x22, 0x27, 0xED, 0xDB,
            /* 0378 */   0xC2, 0xC9, 0x06, 0x7D, 0x35, 0xC3, 0xDC, 0x89,
            /* 0380 */   0xC0, 0x78, 0x39, 0xF3, 0xFF, 0xFF, 0x72, 0x06,
            /* 0388 */   0x2B, 0xCF, 0xAD, 0x0A, 0x15, 0xE9, 0x56, 0x05,
            /* 0390 */   0x88, 0x1D, 0xD6, 0x4B, 0x8F, 0x8F, 0x55, 0x70,
            /* 0398 */   0x6F, 0x55, 0x70, 0xAF, 0x54, 0xCF, 0x0A, 0xC7,
            /* 03A0 */   0x18, 0xFE, 0x51, 0x2A, 0xC6, 0x29, 0xBD, 0x72,
            /* 03A8 */   0x1A, 0x28, 0x4C, 0x94, 0x78, 0x6F, 0x55, 0x1E,
            /* 03B0 */   0xE3, 0x5B, 0x15, 0xBB, 0x40, 0x85, 0x89, 0xF5,
            /* 03B8 */   0x6A, 0x65, 0xD4, 0xD7, 0x89, 0x70, 0x81, 0x82,
            /* 03C0 */   0x44, 0x7A, 0xB1, 0x8A, 0x12, 0x39, 0xBE, 0x21,
            /* 03C8 */   0xDF, 0xAA, 0xC0, 0x2B, 0xE5, 0x56, 0x05, 0x24,
            /* 03D0 */   0xFE, 0xFF, 0xB7, 0x2A, 0xC0, 0x30, 0xDA, 0x5B,
            /* 03D8 */   0x15, 0x18, 0xAF, 0x0D, 0xEC, 0x86, 0x04, 0x0B,
            /* 03E0 */   0xE8, 0xB5, 0x0A, 0x30, 0x93, 0xF9, 0x5A, 0x45,
            /* 03E8 */   0xF3, 0x5E, 0xAB, 0x50, 0xA7, 0x12, 0xEB, 0xB9,
            /* 03F0 */   0x56, 0x91, 0x59, 0xC2, 0xF9, 0xFF, 0xCF, 0x12,
            /* 03F8 */   0x77, 0xAF, 0x02, 0x38, 0xFF, 0xFF, 0xBF, 0x57,
            /* 0400 */   0x01, 0x46, 0x6E, 0x45, 0x98, 0x83, 0x15, 0xBC,
            /* 0408 */   0x84, 0xF7, 0x2A, 0x1A, 0x67, 0x19, 0x0A, 0xB7,
            /* 0410 */   0x20, 0x0A, 0xE3, 0x7B, 0x15, 0xE0, 0xE8, 0xBA,
            /* 0418 */   0x82, 0x1B, 0x32, 0x5C, 0xB0, 0x28, 0xC1, 0x7C,
            /* 0420 */   0x08, 0xF1, 0x74, 0x8E, 0xF8, 0x21, 0xE1, 0x25,
            /* 0428 */   0xE0, 0x21, 0xC7, 0x03, 0x7E, 0x20, 0xF0, 0xD5,
            /* 0430 */   0x0A, 0x6C, 0xA7, 0xDE, 0xB3, 0x7C, 0x97, 0x7A,
            /* 0438 */   0xE7, 0xE5, 0xC7, 0xAB, 0xB7, 0x2A, 0x1F, 0x7C,
            /* 0440 */   0x63, 0xBD, 0x33, 0x44, 0xF9, 0xFF, 0x47, 0x3B,
            /* 0448 */   0x92, 0x28, 0x27, 0x11, 0xCA, 0x37, 0xAB, 0xB7,
            /* 0450 */   0x2A, 0xA3, 0x44, 0x7C, 0x19, 0xF6, 0x09, 0xD8,
            /* 0458 */   0xD0, 0x46, 0x79, 0xAA, 0x88, 0x6E, 0xBC, 0x57,
            /* 0460 */   0x2B, 0xF0, 0xCA, 0xB9, 0x5A, 0x01, 0x34, 0x19,
            /* 0468 */   0xFE, 0xAB, 0x15, 0xF8, 0x6E, 0x0E, 0xD8, 0x6B,
            /* 0470 */   0x12, 0xDC, 0xCB, 0x15, 0xBC, 0xFF, 0xFF, 0xE5,
            /* 0478 */   0x0A, 0xF8, 0x67, 0xBF, 0x5C, 0xD1, 0xDC, 0x97,
            /* 0480 */   0x2B, 0x94, 0x28, 0x08, 0x29, 0x02, 0xD2, 0x3C,
            /* 0488 */   0xC1, 0x73, 0xBB, 0x02, 0xB8, 0xF3, 0xFF, 0xBF,
            /* 0490 */   0x5D, 0x01, 0xF6, 0xC2, 0xDD, 0xAE, 0x80, 0xDE,
            /* 0498 */   0xDD, 0x08, 0xBC, 0x28, 0xEF, 0x46, 0xD8, 0x0B,
            /* 04A0 */   0x16, 0x3E, 0xDF, 0x05, 0x8B, 0x86, 0x59, 0x89,
            /* 04A8 */   0xA2, 0xAD, 0x89, 0xC2, 0xF8, 0x82, 0x05, 0x8C,
            /* 04B0 */   0xFF, 0xFF, 0x17, 0x2C, 0x30, 0x1E, 0x42, 0x71,
            /* 04B8 */   0xA3, 0x86, 0x7B, 0x6D, 0xF2, 0x9D, 0xC7, 0xF3,
            /* 04C0 */   0x8D, 0x68, 0xCD, 0x30, 0x3A, 0x43, 0xBC, 0x14,
            /* 04C8 */   0xBC, 0x4E, 0xFB, 0xD6, 0x0F, 0xE3, 0x7E, 0x05,
            /* 04D0 */   0x7B, 0x48, 0x0F, 0xC2, 0x3E, 0x49, 0xBC, 0x61,
            /* 04D8 */   0xF9, 0x60, 0x65, 0x90, 0xB7, 0xDF, 0xE7, 0xAA,
            /* 04E0 */   0xC7, 0xAA, 0x28, 0x46, 0x08, 0x78, 0x3C, 0xEF,
            /* 04E8 */   0xC1, 0x3E, 0x58, 0xBD, 0x67, 0x19, 0x25, 0x76,
            /* 04F0 */   0x2C, 0x5F, 0xA7, 0x9E, 0xB4, 0x7C, 0xC9, 0x32,
            /* 04F8 */   0x44, 0xDC, 0x87, 0x61, 0xDF, 0xAF, 0x00, 0x56,
            /* 0500 */   0xFC, 0xFF, 0xEF, 0x57, 0xC0, 0xFD, 0xE2, 0xC0,
            /* 0508 */   0x0F, 0x0E, 0xD8, 0xFB, 0x15, 0xE0, 0x71, 0x9E,
            /* 0510 */   0xE0, 0xB9, 0x5F, 0x01, 0xFB, 0xFF, 0xFF, 0xFD,
            /* 0518 */   0x0A, 0xE0, 0xFF, 0xFF, 0xFF, 0x7E, 0x05, 0xE7,
            /* 0520 */   0x6E, 0x85, 0xBD, 0x63, 0x61, 0x09, 0x1C, 0xF3,
            /* 0528 */   0xEF, 0x62, 0x02, 0x85, 0x5A, 0x89, 0x82, 0xC1,
            /* 0530 */   0xA0, 0xEE, 0x57, 0x80, 0xA3, 0x71, 0x7B, 0xD4,
            /* 0538 */   0xE0, 0x38, 0x1B, 0x3C, 0x49, 0x60, 0xCE, 0xD4,
            /* 0540 */   0xB8, 0xD9, 0x1C, 0x5C, 0xE0, 0x08, 0xCF, 0x31,
            /* 0548 */   0x41, 0xCF, 0x9D, 0x5D, 0x52, 0x60, 0xDC, 0xB1,
            /* 0550 */   0xE0, 0x5E, 0xA9, 0x1E, 0x1A, 0xA2, 0x1C, 0xC4,
            /* 0558 */   0x6B, 0xF0, 0x63, 0xD5, 0x83, 0xD4, 0x91, 0x3D,
            /* 0560 */   0x5C, 0x3D, 0x09, 0xFB, 0x90, 0xE5, 0x3B, 0x96,
            /* 0568 */   0xA1, 0x22, 0xBC, 0x63, 0xB1, 0x33, 0x44, 0xBC,
            /* 0570 */   0x58, 0x51, 0x42, 0xBC, 0x57, 0x84, 0xF6, 0x8D,
            /* 0578 */   0xCB, 0xE0, 0x8F, 0xC5, 0x46, 0x0D, 0xFA, 0x62,
            /* 0580 */   0xFC, 0x8E, 0x05, 0x5E, 0x11, 0x0F, 0x02, 0x19,
            /* 0588 */   0xB9, 0x63, 0xA1, 0xFE, 0xFF, 0x77, 0x2C, 0x80,
            /* 0590 */   0x17, 0xC1, 0x20, 0xE4, 0x64, 0xE0, 0xE8, 0xF3,
            /* 0598 */   0x02, 0x7E, 0x00, 0x0F, 0x23, 0x1E, 0x12, 0x0B,
            /* 05A0 */   0x30, 0x70, 0x7A, 0x5F, 0xF2, 0x99, 0x82, 0x1F,
            /* 05A8 */   0x30, 0x7C, 0xA6, 0x60, 0xD7, 0x83, 0xE8, 0x8F,
            /* 05B0 */   0x01, 0x3E, 0x97, 0x60, 0x06, 0x07, 0xFE, 0x6B,
            /* 05B8 */   0xC5, 0xA1, 0x7B, 0x14, 0xAF, 0x0F, 0x26, 0xF0,
            /* 05C0 */   0xE0, 0xC0, 0x71, 0x67, 0x38, 0x22, 0xDF, 0x61,
            /* 05C8 */   0x3C, 0x38, 0xCC, 0xFF, 0x7F, 0x70, 0xE0, 0x38,
            /* 05D0 */   0x08, 0x00, 0x87, 0xC1, 0xE1, 0x43, 0x0D, 0x0E,
            /* 05D8 */   0x3D, 0x1E, 0x03, 0x87, 0xF4, 0x79, 0x8C, 0x5D,
            /* 05E0 */   0x18, 0x1E, 0x72, 0x3C, 0x34, 0xB0, 0x01, 0x7A,
            /* 05E8 */   0x68, 0xC0, 0x72, 0x12, 0x4F, 0x21, 0x87, 0x06,
            /* 05F0 */   0x66, 0x09, 0x43, 0x03, 0x4A, 0xF1, 0x86, 0x86,
            /* 05F8 */   0x1E, 0x92, 0x0F, 0x0B, 0x31, 0x9F, 0x72, 0x22,
            /* 0600 */   0xBC, 0x2F, 0xF8, 0x04, 0xC5, 0xD0, 0x5F, 0x53,
            /* 0608 */   0x7C, 0xBB, 0xF0, 0xDD, 0x86, 0xFF, 0xFF, 0xCF,
            /* 0610 */   0x17, 0xE0, 0xBB, 0x72, 0x7A, 0x7C, 0xC0, 0xE7,
            /* 0618 */   0xC8, 0xE5, 0xF1, 0xE1, 0x8E, 0x4E, 0x1E, 0x1F,
            /* 0620 */   0x0C, 0x97, 0x57, 0x19, 0x72, 0x34, 0xF1, 0xD1,
            /* 0628 */   0x8A, 0x0D, 0x0F, 0x6C, 0x37, 0x3D, 0x0F, 0x0F,
            /* 0630 */   0xF8, 0xC4, 0x1C, 0x1E, 0xFA, 0x5C, 0xF4, 0x34,
            /* 0638 */   0xE2, 0xC9, 0xB1, 0x31, 0x14, 0x39, 0x34, 0x7A,
            /* 0640 */   0x0F, 0x63, 0x47, 0x9F, 0x77, 0x12, 0xB8, 0x63,
            /* 0648 */   0x04, 0xDB, 0x51, 0xCC, 0x63, 0x04, 0x1E, 0xFF,
            /* 0650 */   0xFF, 0x31, 0x82, 0xE3, 0x62, 0x75, 0x8C, 0xC0,
            /* 0658 */   0x6C, 0x64, 0x1E, 0x23, 0x70, 0x45, 0x3C, 0x46,
            /* 0660 */   0x60, 0x66, 0x62, 0x8C, 0x40, 0x17, 0xF2, 0x18,
            /* 0668 */   0x81, 0xC1, 0xFF, 0x7F, 0x8C, 0xF0, 0x54, 0x8C,
            /* 0670 */   0x11, 0xE8, 0x5E, 0xEC, 0x8E, 0x11, 0x98, 0x8D,
            /* 0678 */   0xD0, 0x63, 0x04, 0xAE, 0x27, 0xC4, 0x63, 0x04,
            /* 0680 */   0x66, 0xE3, 0xF3, 0x18, 0x81, 0xCB, 0xFF, 0x9F,
            /* 0688 */   0xC0, 0xD7, 0x73, 0x30, 0x5E, 0xBA, 0xF9, 0x30,
            /* 0690 */   0x61, 0x9C, 0x39, 0xF1, 0xD7, 0x73, 0xC0, 0xCB,
            /* 0698 */   0x28, 0xB8, 0xCE, 0x67, 0x93, 0xAF, 0xE1, 0x7E,
            /* 06A0 */   0x15, 0x2A, 0xD2, 0x7B, 0x80, 0xC2, 0xF8, 0x8C,
            /* 06A8 */   0x0B, 0x38, 0x1A, 0xEB, 0x33, 0x2E, 0x58, 0x6E,
            /* 06B0 */   0x05, 0xEC, 0x86, 0x0B, 0xEB, 0xFF, 0x7F, 0x3C,
            /* 06B8 */   0x60, 0xA7, 0x5B, 0xD8, 0x37, 0x87, 0x87, 0xD9,
            /* 06C0 */   0xA7, 0x8C, 0x37, 0xA6, 0x07, 0x5A, 0x6B, 0xC4,
            /* 06C8 */   0xD0, 0xAD, 0x36, 0x48, 0x9C, 0x08, 0xAF, 0x03,
            /* 06D0 */   0x4F, 0xB7, 0xBE, 0x94, 0xC5, 0x0B, 0xF4, 0x74,
            /* 06D8 */   0x6B, 0x8C, 0x38, 0x2F, 0xB9, 0x46, 0x7C, 0xA1,
            /* 06E0 */   0x08, 0xF1, 0x70, 0xEB, 0x93, 0xAE, 0xF1, 0x1E,
            /* 06E8 */   0x25, 0xC2, 0x85, 0x79, 0xC1, 0x7D, 0xBA, 0x05,
            /* 06F0 */   0xAF, 0x94, 0x07, 0xA5, 0x8E, 0x73, 0x3E, 0xDD,
            /* 06F8 */   0x02, 0xFC, 0x40, 0x7B, 0x44, 0x01, 0x1F, 0xD2,
            /* 0700 */   0xFF, 0xFF, 0xB5, 0xC1, 0x77, 0x14, 0x78, 0x67,
            /* 0708 */   0x7D, 0xFC, 0x01, 0x05, 0x70, 0x91, 0xE5, 0x01,
            /* 0710 */   0xA0, 0x13, 0x87, 0x73, 0x80, 0xC8, 0xC6, 0x13,
            /* 0718 */   0xC0, 0x87, 0x00, 0xAA, 0x06, 0x48, 0xB3, 0x84,
            /* 0720 */   0x9F, 0x9E, 0x5C, 0xF0, 0x3E, 0x11, 0x38, 0x37,
            /* 0728 */   0x89, 0x92, 0x0F, 0x8B, 0x8E, 0xC0, 0x59, 0xCF,
            /* 0730 */   0x21, 0x14, 0xC4, 0x80, 0x0E, 0x72, 0x9A, 0x40,
            /* 0738 */   0x1F, 0x51, 0xD8, 0x3D, 0xC9, 0x47, 0x09, 0x76,
            /* 0740 */   0x42, 0xF2, 0x15, 0xC5, 0x07, 0x10, 0x9F, 0x25,
            /* 0748 */   0x3C, 0x72, 0x9F, 0x12, 0xF8, 0x37, 0xC6, 0xD7,
            /* 0750 */   0x06, 0xA3, 0x5B, 0xCD, 0x31, 0x05, 0x05, 0xE6,
            /* 0758 */   0x73, 0x08, 0x27, 0xA8, 0xEB, 0x22, 0x01, 0x32,
            /* 0760 */   0x7D, 0x27, 0x05, 0x50, 0x00, 0xF9, 0x56, 0xE0,
            /* 0768 */   0x73, 0xC0, 0x93, 0x01, 0x1B, 0xC3, 0xA3, 0x80,
            /* 0770 */   0xD1, 0x8C, 0xCE, 0xC3, 0x4F, 0x16, 0xF1, 0xFF,
            /* 0778 */   0x27, 0x18, 0x77, 0xB2, 0x14, 0xC4, 0x93, 0x75,
            /* 0780 */   0x94, 0xC9, 0xA2, 0x67, 0xE2, 0x3B, 0x3F, 0x8E,
            /* 0788 */   0xC0, 0xF7, 0x98, 0xD7, 0x10, 0x58, 0x17, 0x81,
            /* 0790 */   0x90, 0x0F, 0x06, 0x9E, 0x86, 0xE1, 0x3C, 0x59,
            /* 0798 */   0x0E, 0xE7, 0xC9, 0xF2, 0xB1, 0xF8, 0x16, 0x02,
            /* 07A0 */   0xBE, 0x1B, 0x05, 0x6E, 0xB6, 0x60, 0x84, 0xC7,
            /* 07A8 */   0x08, 0x1E, 0x29, 0xBD, 0x09, 0xC1, 0xC2, 0x3E,
            /* 07B0 */   0x53, 0x5F, 0x11, 0x1E, 0x7C, 0x7D, 0x35, 0xC7,
            /* 07B8 */   0xC0, 0x7A, 0xA4, 0x1C, 0xD6, 0xA0, 0x61, 0x0F,
            /* 07C0 */   0xF8, 0xA1, 0x02, 0x77, 0xAF, 0xF5, 0x68, 0x59,
            /* 07C8 */   0xBC, 0x6F, 0xB2, 0x09, 0x14, 0x88, 0x5C, 0x81,
            /* 07D0 */   0x60, 0x50, 0x77, 0x28, 0xC0, 0xCC, 0xFF, 0xFF,
            /* 07D8 */   0x0E, 0x85, 0xB9, 0x16, 0x81, 0xF3, 0x9E, 0x82,
            /* 07E0 */   0xBB, 0x50, 0xC1, 0xBD, 0xA5, 0xE0, 0xEE, 0x53,
            /* 07E8 */   0xBE, 0xEA, 0x78, 0x18, 0xAF, 0xC8, 0x1E, 0x5F,
            /* 07F0 */   0xA0, 0x78, 0x0F, 0x38, 0xBE, 0x2A, 0x3C, 0x3F,
            /* 07F8 */   0x04, 0x89, 0x71, 0x2E, 0x86, 0x7B, 0xA7, 0xC2,
            /* 0800 */   0xC2, 0x79, 0xA8, 0x26, 0xB0, 0xFB, 0x2B, 0x94,
            /* 0808 */   0xCE, 0x29, 0x4F, 0x0A, 0x67, 0x78, 0x48, 0x11,
            /* 0810 */   0x1E, 0xAA, 0x5E, 0x07, 0x5F, 0xA6, 0x5E, 0xA4,
            /* 0818 */   0x62, 0x3C, 0x4B, 0xC5, 0x78, 0xA8, 0x32, 0xE6,
            /* 0820 */   0xC3, 0xD5, 0x6B, 0xCF, 0x43, 0x15, 0xC3, 0x8A,
            /* 0828 */   0x11, 0x25, 0xA4, 0x47, 0xE7, 0x13, 0x95, 0xCF,
            /* 0830 */   0x36, 0x3E, 0x64, 0x19, 0x2C, 0x44, 0xFB, 0x0B,
            /* 0838 */   0x61, 0x0B, 0xD7, 0xA5, 0xC4, 0xF7, 0x28, 0xC0,
            /* 0840 */   0xFA, 0xFF, 0x7F, 0x3C, 0x30, 0x27, 0xFE, 0x1E,
            /* 0848 */   0x85, 0x8D, 0x0D, 0x21, 0x2B, 0xE3, 0x41, 0x0D,
            /* 0850 */   0xC4, 0xD0, 0x4F, 0x2D, 0x9E, 0x86, 0x8F, 0x1C,
            /* 0858 */   0xBE, 0x2F, 0x62, 0xAF, 0xE9, 0xFC, 0x9A, 0x09,
            /* 0860 */   0x9E, 0x13, 0x85, 0x0F, 0x11, 0xE0, 0x39, 0xD4,
            /* 0868 */   0xE0, 0x0E, 0x10, 0x30, 0xAE, 0x4B, 0xC6, 0x7B,
            /* 0870 */   0x5B, 0x38, 0xBE, 0x40, 0x26, 0xF0, 0xA5, 0x13,
            /* 0878 */   0x3C, 0xA7, 0x86, 0x37, 0x0E, 0x5F, 0xC1, 0xC0,
            /* 0880 */   0x79, 0xCA, 0xC0, 0x5E, 0x32, 0x60, 0x5C, 0xC1,
            /* 0888 */   0x00, 0x2F, 0xFF, 0xFF, 0xA1, 0xA2, 0xAE, 0x9C,
            /* 0890 */   0xF4, 0x70, 0xE3, 0x70, 0x6F, 0x03, 0x7A, 0xBE,
            /* 0898 */   0x01, 0x18, 0x75, 0xA9, 0xF1, 0xF9, 0x06, 0x98,
            /* 08A0 */   0x88, 0xB9, 0x76, 0x02, 0x81, 0xFF, 0xFF, 0xF9,
            /* 08A8 */   0x06, 0xB0, 0x7C, 0x56, 0xC0, 0x5D, 0x3B, 0xC1,
            /* 08B0 */   0x75, 0x4B, 0x81, 0x7F, 0x4A, 0x01, 0xBC, 0x48,
            /* 08B8 */   0xBC, 0x77, 0x52, 0x79, 0xF7, 0x4E, 0xD4, 0xC9,
            /* 08C0 */   0xC3, 0xE2, 0xA8, 0x34, 0x02, 0xEC, 0xFF, 0x7F,
            /* 08C8 */   0xA8, 0x60, 0x91, 0x70, 0xF9, 0xA4, 0x10, 0x3E,
            /* 08D0 */   0x3F, 0x3A, 0xFA, 0x01, 0x12, 0x15, 0x16, 0x8C,
            /* 08D8 */   0x82, 0xF8, 0xF2, 0xC9, 0x8F, 0x4E, 0xB8, 0x03,
            /* 08E0 */   0x82, 0xC7, 0xF2, 0x4C, 0xE2, 0x41, 0x1C, 0x83,
            /* 08E8 */   0xCF, 0x8F, 0xF0, 0xAE, 0x9E, 0xEC, 0xFC, 0x08,
            /* 08F0 */   0xFB, 0x8C, 0x04, 0xCE, 0xF3, 0x23, 0xF0, 0x08,
            /* 08F8 */   0x0E, 0xA1, 0xB3, 0x88, 0xCF, 0x8F, 0xE0, 0x46,
            /* 0900 */   0x7B, 0x7E, 0x84, 0x79, 0xDA, 0x80, 0x0F, 0x88,
            /* 0908 */   0xBF, 0x41, 0xBC, 0x87, 0x78, 0x02, 0x06, 0x64,
            /* 0910 */   0x03, 0x7C, 0x67, 0x07, 0xDB, 0x4D, 0x81, 0xFD,
            /* 0918 */   0xFF, 0x6F, 0x5F, 0x30, 0x15, 0xDA, 0xF4, 0xA9,
            /* 0920 */   0xD1, 0xA8, 0x55, 0x83, 0x32, 0x35, 0xCA, 0x34,
            /* 0928 */   0xA8, 0xD5, 0xA7, 0x52, 0x63, 0xC6, 0xFC, 0x0D,
            /* 0930 */   0xD2, 0x47, 0x06, 0x2A, 0x64, 0xC1, 0x1A, 0xB1,
            /* 0938 */   0x63, 0x80, 0x50, 0xC9, 0x67, 0x4D, 0x81, 0x38,
            /* 0940 */   0xDC, 0xC2, 0x05, 0xE8, 0x40, 0xAF, 0x27, 0x9D,
            /* 0948 */   0x14, 0xC8, 0xA2, 0x04, 0xE2, 0xC8, 0x26, 0x20,
            /* 0950 */   0x1A, 0x01, 0x51, 0x7E, 0x10, 0x01, 0x39, 0xAB,
            /* 0958 */   0x0A, 0x20, 0x96, 0x1C, 0x44, 0x40, 0xD6, 0xB9,
            /* 0960 */   0x48, 0x81, 0x5B, 0x9B, 0x0E, 0x20, 0x96, 0x0C,
            /* 0968 */   0x84, 0x26, 0x78, 0x1C, 0x08, 0xD4, 0x71, 0x40,
            /* 0970 */   0x04, 0x64, 0xE9, 0x34, 0x02, 0x72, 0x10, 0x0A,
            /* 0978 */   0x01, 0x39, 0xB6, 0x12, 0x70, 0x16, 0xF8, 0x15,
            /* 0980 */   0x25, 0x20, 0xCB, 0x7D, 0x4E, 0x08, 0xC4, 0xE2,
            /* 0988 */   0xBC, 0x80, 0x32, 0xA5, 0x20, 0x02, 0xB2, 0xAA,
            /* 0990 */   0x45, 0x0B, 0xC8, 0x1A, 0x41, 0x04, 0xE4, 0x5C,
            /* 0998 */   0x66, 0xC0, 0x59, 0x1E, 0x37, 0x40, 0x4C, 0xCD,
            /* 09A0 */   0x63, 0x42, 0x20, 0xCE, 0x6E, 0x07, 0x94, 0x09,
            /* 09A8 */   0xD1, 0x03, 0xC4, 0x42, 0x83, 0x08, 0xC8, 0x12,
            /* 09B0 */   0xFC, 0x00, 0x31, 0xD9, 0x2F, 0x02, 0x81, 0x5B,
            /* 09B8 */   0xB6, 0x22, 0x40, 0x0A, 0x42, 0xC3, 0x38, 0x02,
            /* 09C0 */   0x61, 0x22, 0xDF, 0x5C, 0x02, 0x71, 0x70, 0x10,
            /* 09C8 */   0x1A, 0xC6, 0x12, 0x08, 0x93, 0xAA, 0x09, 0x84,
            /* 09D0 */   0xC9, 0xF0, 0x04, 0xC2, 0xC2, 0x82, 0xD0, 0x48,
            /* 09D8 */   0xCF, 0x3E, 0x81, 0x58, 0xB8, 0x29, 0x10, 0x26,
            /* 09E0 */   0x4F, 0x15, 0x08, 0x13, 0xE1, 0x0A, 0x84, 0x45,
            /* 09E8 */   0x05, 0xA1, 0xE2, 0x9E, 0x4C, 0x87, 0x43, 0x04,
            /* 09F0 */   0xF9, 0x02, 0x62, 0x71, 0x40, 0xA8, 0x68, 0x63,
            /* 09F8 */   0x03, 0x63, 0x09, 0x40, 0x04, 0x64, 0xB5, 0xFF,
            /* 0A00 */   0xA6, 0x40, 0x44, 0x3B, 0x88, 0x80, 0x9C, 0xE1,
            /* 0A08 */   0x17, 0x15, 0x9C, 0xE8, 0x7F, 0x48, 0x05, 0x22,
            /* 0A10 */   0xE9, 0x41, 0x68, 0xE6, 0x77, 0x47, 0x10, 0xA2,
            /* 0A18 */   0x50, 0xDC, 0xFF, 0x1F, 0x90, 0xA9, 0x53, 0x07,
            /* 0A20 */   0xC4, 0xB2, 0x81, 0xD0, 0x2C, 0xF2, 0x86, 0xC0,
            /* 0A28 */   0x92, 0x81, 0x08, 0xC8, 0xFF, 0x7F
        })
    }

    Method (HWAK, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (HPMN, SMIR)
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.SBRG.SPTS (Arg0)
            \_SB.PCI0.PEX0.SPRT (Arg0)
            \_SB.PCI0.PEX1.SPRT (Arg0)
            \_SB.PCI0.PEX2.SPRT (Arg0)
            \_SB.PCI0.PEX3.SPRT (Arg0)
            \_SB.PCI0.PEX4.SPRT (Arg0)
            \_SB.PCI0.PEX5.SPRT (Arg0)
            \_SB.PCI0.PEX6.SPRT (Arg0)
            \_SB.PCI0.PEX7.SPRT (Arg0)
            RPOP (Arg0)
            \_SB.PCI0.SBRG.SIOS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.SBRG.SWAK (Arg0)
        If (\_SB.PCI0.PEX0.PMS)
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX0, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX1.PMS)
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX1, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX2.PMS)
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX2, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX3.PMS)
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX3, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX4.PMS)
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX4, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX5.PMS)
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX5, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX6.PMS)
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX6, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX7.PMS)
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX7, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
        }

        HWAK (Arg0)
        \_SB.PCI0.SBRG.SIOW (Arg0)
    }

    Method (_SB._OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
    {
        If (WOSC (Arg0, Arg1, Arg3, Arg3))
        {
            Return (Arg3)
        }

        Return (Arg3)
    }
}

