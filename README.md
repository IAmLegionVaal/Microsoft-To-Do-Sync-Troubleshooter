# Microsoft To Do Sync Troubleshooter

Created by **Dewald Pretorius**.

`Troubleshooter.ps1` now supports both read-only diagnosis and a guarded DNS-cache repair mode.

```powershell
.\Troubleshooter.ps1 -Action Diagnose
.\Troubleshooter.ps1 -Action FlushDns -WhatIf
.\Troubleshooter.ps1 -Action FlushDns -Confirm
```

The tool records Microsoft To Do package state and connectivity to To Do, Microsoft identity, and Graph endpoints before any repair action. The workflow is source-reviewed for Windows PowerShell 5.1 but has not been runtime-tested against every account or app version.
