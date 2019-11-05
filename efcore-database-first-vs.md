In this tutorial, you will create a console application using Visual Studio, then link this to an existing database using entity framework core. The model is generated from the database using dbcontext scaffolding.

## Requirements

1. Visual Studio 16.3+

    To check the version of the installed Visual Studio go to: **Help > About Visual Studio**

2. .NET Core SDK 3.0+

    To check the .NET Code SDK, open the command or the powershell and type: 
    
    ```PowerShell
    $ dotnet --version
    ```

## Install .NET Core SDK

1. [Downaload the package by clicking on Download .NET Core SDK](https://dotnet.microsoft.com/download)

2. Install the .NET Core SDK package on your computer

## Create Console Project

1. Open Visual Studio and create a Console Project using the Console App (.NET Core) template

2. Provide a name for your project (e.g., ConsoleApp)

3. Build and run your project using **Debug > Start Without Debugging** (Ctrl+F5)

## Add Entity Framework Core to the Project

1. Select **Tools > NuGet Package Manager > Package Manager Console** (Ctrl+Q then type console)

2. In the Package Manager Console (PMC) window, install the SQL Server provider package

    ```PowerShell
    PM> Install-Package Microsoft.EntityFrameworkCore.SqlServer
    ```
    For ASP.NET Core apps, this package is included automatically.

3. To add the PMC tools to the project, install the following package

    ```PowerShell
    PM> Install-Package Microsoft.EntityFrameworkCore.Tools
    ```
    For ASP.NET Core apps, this package is included automatically.

4. Check that the packages are available under **Dependencies > Packages** in the Solution Explorer window

5. Build then run your project using **Debug > Start Without Debugging** (Ctrl+F5)

## Create Model and Context from Existing Database

1. Create a folder named Models under your project

2. Open Package Manager Console (PMC) and type the follwoing command

3. Inspect the created classes (entities) and context

4. Build and run the project

## Database Migrations

1. Update the database

2. Add migration to the database

3. Update the model and the database

