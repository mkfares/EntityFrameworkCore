This tutorial is for console applications created using Visual Studio on Windows system.

## Requirements

a. Visual Studio 16.3+

b. .NET Core SDK 3.0+

   To check the version of the installed Visual Studio go to: Help > About Visual Studio

   To check the .NET Code SDK, open the command or the powershell and type: dotnet --version

## Install .NET Core SDK

1. [Downaload the package by clicking on Download .NET Core SKD](https://dotnet.microsoft.com/download)

2. Install the package on your computer

## Create Console Project

1. Open Visual Studio and Create Console Project using the Console App (.NET Core) template

2. Provide a name to your project (i.e., ConsoleApp)

3. Build and Run your project (Debug > Start Without Debugging or Ctrl+F5)

## Add Entity Framework Core to the Project

1. Select Tools > NuGet Package Manager > Package Manager Console (or Ctrl+Q then type console)

2. In the Package Manager Console (PMC) window, install the SQL Server provider package
    ```PowerShell
    Install-Package Microsoft.EntityFrameworkCore.SqlServer
    ```
    For ASP.NET Core apps, this package is included automatically.
    
3. To add the PMC tools to the project, install the following package in the Package Manager Console (PMC)
    ```PowerShell
    Install-Package Microsoft.EntityFrameworkCore.Tools
    ```
    For ASP.NET Core apps, this package is included automatically.

4. Build and Run your project (Debug > Start Without Debugging or Ctrl+F5)
