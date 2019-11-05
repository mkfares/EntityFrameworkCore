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

## Create the Database on LocalDB instance

1. Open the **SQL Server Object Explorer** window from the view menu in Visual Studio, then expand the SQL Server, then select the **(localdb)\MSSQLLocalDB** instance. Click on **New Query** icon on the top of the SQL Server Object Explorer window, A new query editor window will open.

2. Paste the content of the file [UniversityDatabase.sql](UniversityDatabase.sql) in the Query Editor window

3. Click on the green arrow on the top left of the Query Editor window or press Ctrl+Shift+E to execute the SQL code.

4. The UniversityDatabase database should be created. If the database does not show up, right-click on the Databases folder in SQL Server Object Explorer window then select refresh.

5. Inspect the tables, columns, and the data in the University Database

## Create Model and Context from Existing Database

1. Open the Package Manager Console (PMC) (Tools > NuGet Package Manager > Package Manager Console)

2. Run the following command to scaffold the model
    
    ```PowerShell
    PM> Scaffold-DbContext "Server=(localdb)\MSSQLLocalDB;Database=UniversityDatabase;Integrated Security=True" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Data -ContextDir Data -Context UniversityDbContext -DataAnnotations -UseDatabaseNames -Force
    ```
    
3. Inspect the Department, Student, and UniversityDbContext classes located in the Data folder

4. To test that the app is linked to the database, add the following code to the Main() method.

    ```C#
    using MyApp.Data;   // Need to add the namespace of the UniversityDbContext class
    
    using (var context = new UniversityDbContext())
    {
        foreach (var dept in context.Department)
        {
            Console.WriteLine($"Id: {dept.DepartmentId} - Name: {dept.Name}");
        }
    }
    ```
5. Build and run the project

## Database Migrations

1. Update the database

2. Add migration to the database

3. Update the model and the database

