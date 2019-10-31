This tutorial is for console applications created using Visual Studio on Windows system.

## Requirements

1. Visual Studio 16.3+

    To check the version of the installed Visual Studio go to: Help > About Visual Studio

2. .NET Core SDK 3.0+

    To check the .NET Code SDK, open the command or the powershell and type: dotnet --version

## Install .NET Core SDK

1. [Downaload the package by clicking on Download .NET Core SDK](https://dotnet.microsoft.com/download)

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

4. Check that the packages are available under Dependencies > Packages in the Solution Explorer window.

5. Build and Run your project (Debug > Start Without Debugging or Ctrl+F5)

## Create the Models (Entities) and Content

1. Add the following class to your project
    ```C#
    class Employee
    {
        public int EmployeeId { get; set; }
        public string Name { get; set; }
    }
    ```

2. Add to your project the class CompanyContext which represents the database context.
    ```C#
    using Microsoft.EntityFrameworkCore;
    ...

    class CompanyContext : DbContext
    {
        public DbSet<Employee> Employees { get; set; }
        
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            Options.UseSqlServer(@"Server=(localdb)\MSSQLLocalDB;Database=CompanyDatabase;Trusted_Connection=True;");
        }
    }
    ```
    Note: You need to use the entity framework core package to make DbContext available.

3. Build your project to check for errors.

## Create the Database

1. To create the database, run the following commands in the Package Manager Console (PMC)
        ```PowerShell
        Add-Migration Initial
        Update-Database
        ```

2. Verify that the database CompanyDatabase is created under SQL Server > (localdb)\MSSQLLocalDB > Databases, you may need to refresh the Databases folder.

## Perform CRUD Operations on the Database
    
1. Include the following code in the Main() method in the Program.cs file
        ```C#
        ```

2. Run the application and check for the output.

3. To check content of the database, you may run the application with debugging (F5) and use breakpoints.
